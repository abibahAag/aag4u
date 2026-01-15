import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Permintaan_Survey/widget/SimulasiHargaWidget.dart';
import 'package:flutter_aag4u/Menu_Profile/DaftarProfilePage.dart';
import 'package:flutter_aag4u/Menu_Profile/DaftarProfileWidget.dart';
import 'package:flutter_aag4u/pages/EventpageDetail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>['email'],
);

class LoginPage extends StatefulWidget {
  final String id;
  final String url;
  final String judul;
  final String category;
  final String gambar;
  final String tgl;
  final String mulai;
  final String akhir;
  final String tempat;

  const LoginPage({
    Key? key,
    required this.id,
    required this.url,
    required this.judul,
    required this.category,
    required this.isRegistered,
    required this.login,
    required this.gambar,
    required this.tgl,
    required this.mulai,
    required this.akhir,
    required this.tempat,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
  final bool isRegistered, login; // Tambahkan flag untuk status registrasi
  // LoginPage({required this.isRegistered, required this.login});
  // final bool login; // Tambahkan flag untuk status registrasi

 
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignInAccount? _currentUser;
  Box loginBox = Hive.box('loginBox');
  Box? isiBox;
  String? _name, _email, _photoUrl; // Simpan informasi login sebagai variabel
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Box? bannerBox;
  bool isRefreshing = false;
  bool _isObscured = true;
  bool hasInternet = true;
  late StreamSubscription<GoogleSignInAccount?> _googleSignInSubscription;

  @override
  void initState() {
    super.initState();
    _loadLoginStatus();
    _checkInternetConnection();

    _googleSignInSubscription = _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) {
      if (mounted) {
        setState(() {
          _currentUser = account;
          if (_currentUser != null) {
            _saveLoginStatus(true);
          }
        });
      }
    });
    _googleSignIn.signInSilently();

    // Tampilkan alert jika pengguna sudah terdaftar (register)
    if (widget.isRegistered) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showVerificationAlert();
      });
    }
  }

  Future<void> _checkInternetConnection() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (mounted) {
      setState(() {
        hasInternet = isConnected;
        // isLoading = false;
      });
    }
  }

  // Menyimpan status login google ke Hive
  // Future<void> _saveLoginStatus(bool status) async {
  //   await loginBox.put('isLoggedIn', status);
  //   // if (status && _currentUser != null) {
  //   await http.post(
  //     Uri.parse('https://app.aag4u.co.id/api/addUserGoogle'),
  //     body: jsonEncode({
  //       'name': _currentUser!.displayName,
  //       'email': _currentUser!.email,
  //       'photo': _currentUser!.photoUrl,
  //     }),
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   await loginBox.put('name', _currentUser!.displayName);
  //   await loginBox.put('email', _currentUser!.email);
  //   await loginBox.put('photo', _currentUser!.photoUrl);

  //   setState(() {
  //     _name = isiBox!.get('name');
  //     _email = isiBox!.get('email');
  //     _photoUrl = isiBox!.get('photo');
  //   });
  // }

  Future<void> saveTokenToApi() async {
    final loginBox = await Hive.openBox('loginBox');
    final tokenBox = await Hive.openBox('tokenBox');

    final email = loginBox.get('email');
    final token = tokenBox.get('token');
    final tokenbearer = tokenBox.get('tokenbearer');
    print("Mengirim data hivebox: $tokenbearer");

    if (email != null) {
      final uri = Uri.parse('https://app.aag4u.co.id/api/updateToken');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenbearer',
      };
      final data = {
        'email': email,
        'token': token,
        'bearer': tokenbearer, // Pastikan format sesuai API
      };

      // print("Mengirim data ke API: $data");

      try {
        final response = await http.post(
          uri,
          headers: headers,
          body: json.encode(data),
        );

        print("Response: ${response.body}");

        if (response.statusCode == 200) {
          print("Token berhasil disimpan ke API.");
        } else {
          print(
              "Gagal menyimpan token ke API. Status code: ${response.statusCode}");
        }
      } catch (e) {
        print("Error saat mengirim token ke API: $e");
      }
    } else {
      print(
          "Email, token, atau token bearer tidak tersedia. Data tidak dikirim.");
    }
  }

  Future<void> _saveLoginStatus(bool status) async {
    final loginBox = Hive.box('loginBox'); // Hive box sudah dibuka sebelumnya
    if (status && _currentUser != null) {
      // Simpan data pengguna di Hive
      // setState(() async {
      await loginBox.put('isLoggedIn', true);
      await loginBox.put('name', _currentUser!.displayName);
      await loginBox.put('email', _currentUser!.email);
      await loginBox.put('photo', _currentUser!.photoUrl);
      // });

      // Kirim data ke server untuk pengguna Google
      try {
        final response = await http.post(
          Uri.parse('https://app.aag4u.co.id/api/addUserGoogle'),
          body: jsonEncode({
            'name': _currentUser!.displayName,
            'email': _currentUser!.email,
            'photo': _currentUser!.photoUrl,
          }),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          print("Data pengguna berhasil disimpan ke server.");
          // return _navigateBasedOnUrl(String as String );
        } else {
          print("Gagal menyimpan data pengguna ke server: ${response.body}");
        }
      } catch (e) {
        print("Error saat menyimpan data pengguna ke server: $e");
      }

      // Segera panggil fungsi `saveTokenToApi` setelah data login berhasil disimpan
      await saveTokenToApi();
    } else {
      await loginBox.put('isLoggedIn', false);
    }

    if (mounted) {
      setState(() {
        _name = loginBox.get('name');
        _email = loginBox.get('email');
        _photoUrl = loginBox.get('photo');
      });
    }
  }

  void _navigateBasedOnUrl(String url) {
    if (url == "SimulasiHargaPage") {
      // Navigasi ke SimulasiHargaPage jika url cocok
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SimulasiHargaWidget(
            // url: 'SimulasiHargaPage',
            isRegistered: false,
            isLoggedIn: false,
            login: false,
          ),
        ),
        (route) => false, // Menghapus semua rute sebelumnya
      );
    } else if (url == "EventPageForm") {
      // Parsing id jika diperlukan
      int parsedId = 0; // Default ID jika parsing gagal
      try {
        parsedId = int.parse(widget.id);
      } catch (e) {
        print("Error parsing id: $e");
      }

      // Navigasi ke EventPageForm
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => EventpageDetail(
            gambar: widget.gambar,
            tgl: widget.tgl,
            mulai: widget.mulai,
            akhir: widget.akhir,
            tempat: widget.tempat,
            id: parsedId,
            judul: widget.judul,
            category: widget.category,
          ),
        ),
        (route) => false,
      );
    }
  }

  // Memuat status login dari Hive
  Future<void> _loadLoginStatus() async {
    bool isLoggedIn = loginBox.get('isLoggedIn', defaultValue: false);
    final isiBox = await Hive.openBox('loginBox');
    // Cek apakah box tidak kosong, jika ada isi, refresh halaman

    if (isLoggedIn) {
      if (mounted) {
        setState(() {
          _name = isiBox.get('name');
          _email = isiBox.get('email');
          _photoUrl = isiBox.get('photo');
        });
      }
    }
    // print("ini isi hive box : $isLoggedIn");
  }

  // Fungsi untuk login menggunakan Google
  Future<void> _handleSignIn(String url) async {
    final isiLog = await Hive.openBox('loginBox');
    final mail = isiLog.get('email');
    int parsedId = int.parse(widget.id); // Mengonversi widget.id menjadi int

    try {
      await _googleSignIn.signIn();
      if (url == "SimulasiHargaPage") {
        // Navigasi ke SimulasiHargaPage jika url cocok
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => SimulasiHargaWidget(
              // url: 'SimulasiHargaPage',
              isRegistered: false,
              isLoggedIn: false,
              login: false,
            ),
          ),
          (route) => false, // Menghapus semua rute sebelumnya
        );
      } else if (url == "EventPageForm") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => EventpageDetail(
                    gambar: widget.gambar, tgl: widget.tgl, mulai: widget.mulai,
                    akhir: widget.akhir, tempat: widget.tempat, id: parsedId,
                    judul: widget.judul, category: widget.category,
                    // id: 1,
                    // url: 'EventPageForm',
                    // judul: widget.judul,
                    // category: widget.category,
                    // email: _currentUser!.email ?? emailController.text.trim(),
                  )),
          (route) => false,
        );
      }
    } catch (error) {
      print(error);
    }
  }

  // Fungsi untuk logout dan hapus data di Hive
  Future<void> _handleSignOut() async {
    await _googleSignIn.signOut();
    await loginBox.clear(); // Hapus semua data login di Hive
    if (mounted) {
      setState(() {
        _currentUser = null;
        _name = null;
        _email = null;
        _photoUrl = null;
      });
    }
  }

  Future<void> loginUser(BuildContext context) async {
    final loginBox = Hive.box('loginBox'); // Hive box sudah dibuka sebelumnya
    double fontSize = MediaQuery.of(context).size.width;

    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        // Ganti URL dengan endpoint API kamu
        final response = await http.post(
          Uri.parse('https://app.aag4u.co.id/api/logon'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: {'Content-Type': 'application/json'},
        );
        // print('API Response: $response');

        final pesan = json.decode(response.body) as Map<String, dynamic>;
        final info = pesan['pesan'];
        final mail = pesan['email'];
        final name = pesan['name'];
        // var _photoUrl = pesan['photo'];

        if (info == "berhasil") {
          //hive box save
          await loginBox.put('isLoggedIn', true);
          await loginBox.put('email', mail);
          await loginBox.put('name', name);
          // await loginBox.put('photo', _photoUrl);

          // print('Data berhasil disimpan ke Hive box: ${loginBox.toMap()}');
          await saveTokenToApi();
        } else {
          print('Failed to submit data: ${info}');
        }

        // Tampilkan response body di dalam alert
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                '$info',
                style: TextStyle(fontSize: fontSize * 0.03),
              ),
              actions: [
                TextButton(
                  // onPressed: () {
                  //   Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SimulasiHargaWidget(
                  //               url: 'SimulasiHargaPage',
                  //               isRegistered: false,
                  //               isLoggedIn: false,
                  //               login: false,
                  //             )),
                  //     (route) => false, // Menghapus semua rute sebelumnya
                  //   );
                  // },
                  onPressed: () {
                    Navigator.pop(context);
                    if (mounted) {
                      setState(() {
                        _name = loginBox.get('name');
                        _email = loginBox.get('email');
                        _photoUrl = loginBox.get('photo');
                      });
                    }
                  },
                  child:
                      Text('OK', style: TextStyle(fontSize: fontSize * 0.03)),
                ),
              ],
            );
          },
        );
      } catch (e) {
        print("Error: $e");
      }
    } else {
      // Jika email atau password kosong
      print("Email and password must not be empty");
    }
  }

  void _showVerificationAlert() {
    double fontSize = MediaQuery.of(context).size.width * 0.04;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Verifikasi Email',
              style: TextStyle(fontSize: fontSize * 0.04)),
          content: Text('Cek email untuk melakukan verifikasi akun.',
              style: TextStyle(fontSize: fontSize * 0.04)),
          actions: [
            TextButton(
              child: Text('OK', style: TextStyle(fontSize: fontSize * 0.04)),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: (_currentUser == null && _name == null)
      //       ? Colors.white30
      //       : Colors.blue,

      // automaticallyImplyLeading: true,
      // appBar: Navbar(),

      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         // color: Colors.amber,
      //         width: 100,
      //         // height: 300,
      //         child: Column(
      //           children: [
      //             Container(
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Column(
      //                     children: [
      //                       Container(
      //                         child: Image.asset(
      //                           "images/icons/aagu.png",
      //                           height: 100,
      //                           width: 100,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: hasInternet
          ? ValueListenableBuilder(
              valueListenable:
                  loginBox.listenable(), // Listen for changes in the Hive box
              builder: (context, Box box, _) {
                String? _email = box.get('email');

                if (_email == null) {
                  // If email is null, show the sign-in page
                  return _buildSignInPage();
                } else {
                  // If email is not null, show the profile page
                  return _buildProfilePage();
                }
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/assets/No_internet.png',
                    width: screenWidth * 0.7,
                    height: screenheight * 0.4,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text('No Internet Connection',
                      style: TextStyle(fontSize: fontSize * 0.04)),
                  SizedBox(height: 16),
                ],
              ),
            ),
    );
  }

  // Widget tampilan login Google
  Widget _buildSignInPage() {
    double inWidth = MediaQuery.of(context).size.width * 0.8;
    double inWidthlogo = MediaQuery.of(context).size.width * 0.9;
    double screenfullWidth = MediaQuery.of(context).size.width * 1;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double iconSize = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Center(
                                          child: Container(
                                              // color: Colors.amber,
                                              // width: inWidthlogo,
                                              height: screenheight * 0.2,
                                              child: Image.asset(
                                                "images/login2.png",
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                // width: screenWidth,
                                // height: 100,
                                // alignment: Alignment.center,
                                // decoration: BoxDecoration(
                                //   color: Color(0xFF233d63),
                                //   borderRadius: BorderRadius.circular(24),
                                // ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Welcome!",
                                          style: TextStyle(
                                              fontSize: fontSize * 0.06,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF233d63)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Hey! Good to see you again",
                                              style: TextStyle(
                                                fontSize: fontSize * 0.04,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenheight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                // color: const Color.fromARGB(255, 148, 201, 244),
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                              //   bottomLeft: Radius.circular(24),
                              //   bottomRight: Radius.circular(24),
                            )),
                            width: screenWidth * 0.9,
                            height: screenheight * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: Container(
                                            // color: Colors.amber,
                                            // width: inWidth,
                                            // height: 300,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width: screenWidth *
                                                                            0.9,
                                                                        height: screenheight *
                                                                            0.06,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border.all(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            width:
                                                                                1,
                                                                            style:
                                                                                BorderStyle.solid,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(24),
                                                                        ),
                                                                        child:
                                                                            TextFormField(
                                                                          style:
                                                                              TextStyle(fontSize: screenWidth * 0.04),
                                                                          controller:
                                                                              emailController,
                                                                          // keyboardType:
                                                                          //     TextInputType.phone,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            prefixIcon:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(left: 10, right: 10), // Jarak ikon ke teks

                                                                              child: Icon(
                                                                                Icons.email,
                                                                                size: iconSize * 0.06,
                                                                              ),
                                                                            ),
                                                                            hintText:
                                                                                'Email',
                                                                            hintStyle:
                                                                                TextStyle(fontSize: fontSize * 0.04),
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(vertical: 15),
                                                                          ),
                                                                          validator:
                                                                              (String? value) {
                                                                            if (value == null ||
                                                                                value.isEmpty) {
                                                                              return ' Maukkan Email';
                                                                            }
                                                                            return null;
                                                                          },
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: screenheight * 0.02,
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width: screenWidth *
                                                                            0.9,
                                                                        height: screenheight *
                                                                            0.06,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border.all(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                7,
                                                                                7,
                                                                                7),
                                                                            width:
                                                                                1,
                                                                            style:
                                                                                BorderStyle.solid,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(24),
                                                                        ),
                                                                        padding:
                                                                            EdgeInsets.only(
                                                                          left:
                                                                              0,
                                                                        ),
                                                                        child:
                                                                            TextFormField(
                                                                          style:
                                                                              TextStyle(fontSize: screenWidth * 0.04),
                                                                          controller:
                                                                              passwordController,
                                                                          obscureText:
                                                                              _isObscured, // Kontrol visibilitas password
                                                                          enableSuggestions:
                                                                              true,

                                                                          keyboardType:
                                                                              TextInputType.multiline,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            prefixIcon:
                                                                                Padding(
                                                                              padding: EdgeInsets.only(left: 10, right: 10),
                                                                              child: Icon(
                                                                                Icons.lock,
                                                                                size: iconSize * 0.06,
                                                                              ),
                                                                            ),
                                                                            hintText:
                                                                                'Password',
                                                                            hintStyle:
                                                                                TextStyle(fontSize: fontSize * 0.04),
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(vertical: 15),
                                                                            suffixIcon:
                                                                                IconButton(
                                                                              icon: Icon(
                                                                                _isObscured ? Icons.visibility : Icons.visibility_off,
                                                                                size: iconSize * 0.06,
                                                                              ),
                                                                              onPressed: () {
                                                                                if (mounted) {
                                                                                  setState(() {
                                                                                    _isObscured = !_isObscured;
                                                                                  });
                                                                                }
                                                                              },
                                                                            ),
                                                                          ),
                                                                          validator:
                                                                              (String? value) {
                                                                            if (value == null ||
                                                                                value.isEmpty) {
                                                                              return ' Maukkan Password';
                                                                            }
                                                                            return null;
                                                                          },
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          // width: 100,
                                                          // height: 50,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  ElevatedButton(
                                                                    style:
                                                                        ButtonStyle(
                                                                      fixedSize: MaterialStateProperty.all<Size>(Size(
                                                                          screenWidth *
                                                                              0.9,
                                                                          screenheight *
                                                                              0.06)),
                                                                      backgroundColor: MaterialStateProperty.all<
                                                                              Color>(
                                                                          Color(
                                                                              0xFF233d63)),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      loginUser(
                                                                          context); // Pastikan untuk meneruskan `context` ke fungsi loginUser
                                                                      // After loginUser is done, refresh the page
                                                                      if (mounted) {
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          'Login',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                fontSize * 0.04,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenheight * 0.02),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Column(
                                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    // color: Colors.amber,
                                                                    // width: 150,
                                                                    padding: EdgeInsets.only(
                                                                        right:
                                                                            20),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "Buat akun baru?",
                                                                              style: TextStyle(fontSize: fontSize * 0.04, color: Colors.black),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            InkWell(
                                                                              onTap: () {
                                                                                Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(builder: (context) => DaftarProfilewidget()),
                                                                                );
                                                                              },
                                                                              child: Text(
                                                                                "Sign Up",
                                                                                style: TextStyle(fontSize: fontSize * 0.04, color: Colors.lightBlue),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 15),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        ElevatedButton(
                                                                      // style: ElevatedButton
                                                                      //     .styleFrom(
                                                                      //   shape:
                                                                      //       RoundedRectangleBorder(
                                                                      //     borderRadius:
                                                                      //         BorderRadius.circular(30),
                                                                      //   ),

                                                                      //   backgroundColor:
                                                                      //       Color(0xFF233d63), // Button color
                                                                      //   padding:
                                                                      //       EdgeInsets.all(8),
                                                                      // ),
                                                                      style: ButtonStyle(
                                                                          fixedSize: WidgetStatePropertyAll(Size(
                                                                              screenWidth *
                                                                                  0.9,
                                                                              screenheight *
                                                                                  0.06)),
                                                                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              255,
                                                                              255)),
                                                                          shadowColor: WidgetStatePropertyAll(Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              9,
                                                                              9))),
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: <Widget>[
                                                                            FaIcon(
                                                                              FontAwesomeIcons.google,
                                                                              size: iconSize * 0.04,
                                                                              color: Colors.blue,
                                                                            ),
                                                                            SizedBox(width: 15),
                                                                            // Icon(Icons.goo),
                                                                            Text(
                                                                              'Sign in with Google',
                                                                              style: TextStyle(
                                                                                color: const Color(0xFF233d63),
                                                                                fontSize: fontSize * 0.04,
                                                                                // fontWeight:
                                                                                //     FontWeight.w800,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        _handleSignIn(
                                                                            widget.url);
                                                                      },
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    //   ElevatedButton(
    //   onPressed: _handleSignIn,
    //   child: Text('Login with Google'),
    // ),
  }

  // Widget tampilan profil pengguna setelah login
  Widget _buildProfilePage() {
    // Ambil nilai URL dari Hive box
    String? url = loginBox.get('url');
    int parsedId = int.parse(widget.id); // Mengonversi widget.id menjadi int

    if (url == "SimulasiHargaPage") {
      // Navigasi ke SimulasiHargaPage jika url cocok
      return SimulasiHargaWidget(
        // url: 'SimulasiHargaPage',
        isRegistered: false,
        isLoggedIn: false,
        login: false,
      );

      // Navigasi ke SimulasiHargaPage jika url cocok
      //   Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => SimulasiHargaWidget(
      //         url: 'SimulasiHargaPage',
      //         isRegistered: false,
      //         isLoggedIn: false,
      //         login: false,
      //       ),
      //     ),
      //     (route) => false, // Menghapus semua rute sebelumnya
      //   );
    } else if (url == "EventPageForm") {
      return EventpageDetail(
        gambar: widget.gambar,
        tgl: widget.tgl,
        mulai: widget.mulai,
        akhir: widget.akhir,
        tempat: widget.tempat,
        id: parsedId,
        judul: widget.judul,
        category: widget.category,
      );
    } else {
      // Halaman default jika URL tidak dikenali
      return Center(
        child: Text(
          'Welcome to the Profile Page!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}

