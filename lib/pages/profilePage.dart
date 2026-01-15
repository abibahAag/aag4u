// // import 'package:flutter/material.dart';
// // import 'package:flutter_aag4u/Menu_Profile/DaftarProfilePage.dart';
// // import 'package:flutter_aag4u/Menu_Profile/ProfileWidget.dart';
// // import 'package:flutter_aag4u/template/navbar.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:google_sign_in/google_sign_in.dart';

// // GoogleSignIn _googleSignIn = GoogleSignIn(
// //   scopes: <String>[
// //     'email',
// //   ],
// // );

// // class ProfilePage extends StatefulWidget {
// //   @override
// //   _ProfilePageState createState() => _ProfilePageState();
// // }

// // class _ProfilePageState extends State<ProfilePage> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
// //       if (account != null) {
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => ProfileWidget(),
// //           ),
// //         );
// //       }
// //     });
// //     _googleSignIn.signInSilently();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double inWidth = MediaQuery.of(context).size.width * 0.8;
// //     double screenWidth = MediaQuery.of(context).size.width * 0.9;
// //     double screenfullWidth = MediaQuery.of(context).size.width * 1;

// //     return Scaffold(
// //       appBar: Navbar(),
// //       body: SingleChildScrollView(
// //         scrollDirection: Axis.vertical,
// //         child: Column(
// //           children: [
// //             Stack(
// //               children: [
// //                 Container(
// //                   child: Column(
// //                     children: [
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Container(
// //                             child: Column(
// //                               children: [
// //                                 Row(
// //                                   children: [
// //                                     Column(
// //                                       children: [
// //                                         Center(
// //                                           child: Container(
// //                                               // color: Colors.amber,
// //                                               width: 250,
// //                                               height: 200,
// //                                               child: Image.asset(
// //                                                 "images/login2.png",
// //                                               )),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(
// //                         height: 10,
// //                       ),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Column(
// //                             children: [
// //                               Container(
// //                                 // width: screenWidth,
// //                                 // height: 100,
// //                                 // alignment: Alignment.center,
// //                                 // decoration: BoxDecoration(
// //                                 //   color: Color(0xFF233d63),
// //                                 //   borderRadius: BorderRadius.circular(24),
// //                                 // ),
// //                                 child: Column(
// //                                   mainAxisAlignment: MainAxisAlignment.center,
// //                                   children: [
// //                                     Row(
// //                                       mainAxisAlignment:
// //                                           MainAxisAlignment.center,
// //                                       children: [
// //                                         Text(
// //                                           "Welcome!",
// //                                           style: TextStyle(
// //                                               fontSize: 40,
// //                                               fontWeight: FontWeight.bold,
// //                                               color: Color(0xFF233d63)),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                     Row(
// //                                       children: [
// //                                         Column(
// //                                           children: [
// //                                             Text("Hey! Good to see you again")
// //                                           ],
// //                                         )
// //                                       ],
// //                                     )
// //                                   ],
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(
// //                         height: 10,
// //                       ),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Container(
// //                             decoration: BoxDecoration(
// //                                 // color: const Color.fromARGB(255, 148, 201, 244),
// //                                 borderRadius: BorderRadius.only(
// //                               topLeft: Radius.circular(24),
// //                               topRight: Radius.circular(24),
// //                               //   bottomLeft: Radius.circular(24),
// //                               //   bottomRight: Radius.circular(24),
// //                             )),
// //                             width: screenfullWidth,
// //                             height: 350,
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.center,
// //                               children: [
// //                                 Row(
// //                                   mainAxisAlignment: MainAxisAlignment.center,
// //                                   children: [
// //                                     Column(
// //                                       // mainAxisAlignment: MainAxisAlignment.center,
// //                                       children: [
// //                                         Padding(
// //                                           padding:
// //                                               const EdgeInsets.only(top: 30),
// //                                           child: Container(
// //                                             // color: Colors.amber,
// //                                             // width: inWidth,
// //                                             // height: 300,
// //                                             child: Column(
// //                                               children: [
// //                                                 Row(
// //                                                   children: [
// //                                                     Column(
// //                                                       children: [
// //                                                         Row(
// //                                                           children: [
// //                                                             Container(
// //                                                               child: Column(
// //                                                                 crossAxisAlignment:
// //                                                                     CrossAxisAlignment
// //                                                                         .start,
// //                                                                 children: [
// //                                                                   Row(
// //                                                                     children: [
// //                                                                       Container(
// //                                                                         width:
// //                                                                             inWidth,
// //                                                                         height:
// //                                                                             50,
// //                                                                         decoration:
// //                                                                             BoxDecoration(
// //                                                                           border:
// //                                                                               Border.all(
// //                                                                             color: const Color.fromARGB(
// //                                                                                 255,
// //                                                                                 0,
// //                                                                                 0,
// //                                                                                 0),
// //                                                                             width:
// //                                                                                 1,
// //                                                                             style:
// //                                                                                 BorderStyle.solid,
// //                                                                           ),
// //                                                                           borderRadius:
// //                                                                               BorderRadius.circular(24),
// //                                                                         ),
// //                                                                         child:
// //                                                                             TextFormField(
// //                                                                           // controller: _waController,
// //                                                                           // keyboardType:
// //                                                                           //     TextInputType.phone,
// //                                                                           decoration:
// //                                                                               const InputDecoration(
// //                                                                             border:
// //                                                                                 InputBorder.none,
// //                                                                             prefixIcon:
// //                                                                                 Icon(
// //                                                                               Icons.email,
// //                                                                               size: 20,
// //                                                                             ),
// //                                                                             hintText:
// //                                                                                 'Email',
// //                                                                           ),
// //                                                                           validator:
// //                                                                               (String? value) {
// //                                                                             if (value == null ||
// //                                                                                 value.isEmpty) {
// //                                                                               return ' Maukkan Email';
// //                                                                             }
// //                                                                             return null;
// //                                                                           },
// //                                                                         ),
// //                                                                       )
// //                                                                     ],
// //                                                                   )
// //                                                                 ],
// //                                                               ),
// //                                                             )
// //                                                           ],
// //                                                         )
// //                                                       ],
// //                                                     )
// //                                                   ],
// //                                                 ),
// //                                                 SizedBox(
// //                                                   height: 20,
// //                                                 ),
// //                                                 Row(
// //                                                   children: [
// //                                                     Column(
// //                                                       children: [
// //                                                         Row(
// //                                                           mainAxisAlignment:
// //                                                               MainAxisAlignment
// //                                                                   .start,
// //                                                           children: [
// //                                                             Container(
// //                                                               child: Column(
// //                                                                 crossAxisAlignment:
// //                                                                     CrossAxisAlignment
// //                                                                         .start,
// //                                                                 children: [
// //                                                                   Row(
// //                                                                     children: [
// //                                                                       Container(
// //                                                                         width:
// //                                                                             inWidth,
// //                                                                         height:
// //                                                                             50,
// //                                                                         decoration:
// //                                                                             BoxDecoration(
// //                                                                           border:
// //                                                                               Border.all(
// //                                                                             color: const Color.fromARGB(
// //                                                                                 255,
// //                                                                                 7,
// //                                                                                 7,
// //                                                                                 7),
// //                                                                             width:
// //                                                                                 1,
// //                                                                             style:
// //                                                                                 BorderStyle.solid,
// //                                                                           ),
// //                                                                           borderRadius:
// //                                                                               BorderRadius.circular(24),
// //                                                                         ),
// //                                                                         padding:
// //                                                                             EdgeInsets.only(
// //                                                                           left:
// //                                                                               10,
// //                                                                         ),
// //                                                                         child:
// //                                                                             TextFormField(
// //                                                                           // controller: _waController,
// //                                                                           // keyboardType:
// //                                                                           //     TextInputType.phone,
// //                                                                           decoration:
// //                                                                               const InputDecoration(
// //                                                                             border:
// //                                                                                 InputBorder.none,
// //                                                                             prefixIcon:
// //                                                                                 Icon(
// //                                                                               Icons.lock,
// //                                                                               size: 20,
// //                                                                             ),
// //                                                                             hintText:
// //                                                                                 'Password',
// //                                                                           ),
// //                                                                           validator:
// //                                                                               (String? value) {
// //                                                                             if (value == null ||
// //                                                                                 value.isEmpty) {
// //                                                                               return ' Maukkan Password';
// //                                                                             }
// //                                                                             return null;
// //                                                                           },
// //                                                                         ),
// //                                                                       )
// //                                                                     ],
// //                                                                   )
// //                                                                 ],
// //                                                               ),
// //                                                             )
// //                                                           ],
// //                                                         )
// //                                                       ],
// //                                                     )
// //                                                   ],
// //                                                 ),
// //                                                 SizedBox(
// //                                                   height: 30,
// //                                                 ),
// //                                                 Column(
// //                                                   crossAxisAlignment:
// //                                                       CrossAxisAlignment.end,
// //                                                   children: [
// //                                                     Row(
// //                                                       mainAxisAlignment:
// //                                                           MainAxisAlignment.end,
// //                                                       children: [
// //                                                         Container(
// //                                                           // width: 100,
// //                                                           // height: 50,
// //                                                           child: Column(
// //                                                             crossAxisAlignment:
// //                                                                 CrossAxisAlignment
// //                                                                     .end,
// //                                                             children: [
// //                                                               Row(
// //                                                                 children: [
// //                                                                   ElevatedButton(
// //                                                                     style:
// //                                                                         ButtonStyle(
// //                                                                       fixedSize: WidgetStatePropertyAll(Size(
// //                                                                           inWidth,
// //                                                                           30)),
// //                                                                       backgroundColor: MaterialStateProperty.all<
// //                                                                               Color>(
// //                                                                           Color(
// //                                                                               0xFF233d63)),
// //                                                                     ),
// //                                                                     onPressed:
// //                                                                         () {},
// //                                                                     child: Row(
// //                                                                       mainAxisAlignment:
// //                                                                           MainAxisAlignment
// //                                                                               .center,
// //                                                                       children: [
// //                                                                         Text(
// //                                                                           'Login',
// //                                                                           style: TextStyle(
// //                                                                               fontSize: 15,
// //                                                                               color: Colors.white),
// //                                                                         ),
// //                                                                       ],
// //                                                                     ),
// //                                                                   ),
// //                                                                 ],
// //                                                               ),
// //                                                             ],
// //                                                           ),
// //                                                         ),
// //                                                       ],
// //                                                     ),
// //                                                   ],
// //                                                 ),
// //                                                 SizedBox(height: 10),
// //                                                 Row(
// //                                                   mainAxisAlignment:
// //                                                       MainAxisAlignment.end,
// //                                                   children: [
// //                                                     Column(
// //                                                       // crossAxisAlignment: CrossAxisAlignment.end,
// //                                                       children: [
// //                                                         Container(
// //                                                           child: Row(
// //                                                             children: [
// //                                                               Column(
// //                                                                 children: [
// //                                                                   Container(
// //                                                                     // color: Colors.amber,
// //                                                                     // width: 150,
// //                                                                     padding: EdgeInsets.only(
// //                                                                         right:
// //                                                                             20),
// //                                                                     child:
// //                                                                         Column(
// //                                                                       children: [
// //                                                                         Row(
// //                                                                           children: [
// //                                                                             Text(
// //                                                                               "Buat akun baru?",
// //                                                                               style: TextStyle(fontSize: 15, color: Colors.black),
// //                                                                             ),
// //                                                                             SizedBox(
// //                                                                               width: 5,
// //                                                                             ),
// //                                                                             InkWell(
// //                                                                               onTap: () {
// //                                                                                 Navigator.push(
// //                                                                                   context,
// //                                                                                   MaterialPageRoute(builder: (context) => DaftarProfilePage()),
// //                                                                                 );
// //                                                                               },
// //                                                                               child: Text(
// //                                                                                 "Sign Up",
// //                                                                                 style: TextStyle(fontSize: 15, color: Colors.lightBlue),
// //                                                                               ),
// //                                                                             ),
// //                                                                           ],
// //                                                                         )
// //                                                                       ],
// //                                                                     ),
// //                                                                   )
// //                                                                 ],
// //                                                               )
// //                                                             ],
// //                                                           ),
// //                                                         )
// //                                                       ],
// //                                                     )
// //                                                   ],
// //                                                 ),
// //                                                 SizedBox(height: 15),
// //                                                 Row(
// //                                                   children: [
// //                                                     Column(
// //                                                       children: [
// //                                                         Container(
// //                                                           child: Column(
// //                                                             children: [
// //                                                               Row(
// //                                                                 children: [
// //                                                                   Center(
// //                                                                     child:
// //                                                                         ElevatedButton(
// //                                                                       // style: ElevatedButton
// //                                                                       //     .styleFrom(
// //                                                                       //   shape:
// //                                                                       //       RoundedRectangleBorder(
// //                                                                       //     borderRadius:
// //                                                                       //         BorderRadius.circular(30),
// //                                                                       //   ),

// //                                                                       //   backgroundColor:
// //                                                                       //       Color(0xFF233d63), // Button color
// //                                                                       //   padding:
// //                                                                       //       EdgeInsets.all(8),
// //                                                                       // ),
// //                                                                       style:
// //                                                                           ButtonStyle(
// //                                                                         fixedSize: WidgetStatePropertyAll(Size(
// //                                                                             inWidth,
// //                                                                             30)),
// //                                                                         backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(
// //                                                                             255,
// //                                                                             255,
// //                                                                             255,
// //                                                                             255)),
// //                                                                       ),
// //                                                                       child:
// //                                                                           Container(
// //                                                                         child:
// //                                                                             Row(
// //                                                                           mainAxisSize:
// //                                                                               MainAxisSize.min,
// //                                                                           children: <Widget>[
// //                                                                             FaIcon(
// //                                                                               FontAwesomeIcons.google,
// //                                                                               color: Colors.blue,
// //                                                                             ),
// //                                                                             SizedBox(width: 15),
// //                                                                             // Icon(Icons.goo),
// //                                                                             Text(
// //                                                                               'Sign in with Google',
// //                                                                               style: TextStyle(
// //                                                                                 color: const Color(0xFF233d63),
// //                                                                                 fontSize: 15,
// //                                                                                 // fontWeight:
// //                                                                                 //     FontWeight.w800,
// //                                                                               ),
// //                                                                             ),
// //                                                                           ],
// //                                                                         ),
// //                                                                       ),
// //                                                                       onPressed:
// //                                                                           () {
// //                                                                         _handleSignIn();
// //                                                                       },
// //                                                                     ),
// //                                                                   )
// //                                                                 ],
// //                                                               )
// //                                                             ],
// //                                                           ),
// //                                                         )
// //                                                       ],
// //                                                     )
// //                                                   ],
// //                                                 )
// //                                               ],
// //                                             ),
// //                                           ),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                           )
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> _handleSignIn() async {
// //     try {
// //       await _googleSignIn.signIn();
// //     } catch (error) {
// //       print('Sign-in failed: $error');
// //     }
// //   }
// // }

// // class WaveClipper extends CustomClipper<Path> {
// //   @override
// //   Path getClip(Size size) {
// //     var path = Path();
// //     path.lineTo(0.0, size.height - 50);

// //     var firstControlPoint = Offset(size.width / 4, size.height);
// //     var firstEndPoint = Offset(size.width / 2, size.height - 50.0);

// //     var secondControlPoint = Offset(3 * size.width / 4, size.height - 100);
// //     var secondEndPoint = Offset(size.width, size.height - 50.0);

// //     path.quadraticBezierTo(
// //       firstControlPoint.dx,
// //       firstControlPoint.dy,
// //       firstEndPoint.dx,
// //       firstEndPoint.dy,
// //     );

// //     path.quadraticBezierTo(
// //       secondControlPoint.dx,
// //       secondControlPoint.dy,
// //       secondEndPoint.dx,
// //       secondEndPoint.dy,
// //     );

// //     path.lineTo(size.width, 0.0);
// //     path.close();
// //     return path;
// //   }

// //   @override
// //   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// // }

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Permintaan_Survey/widget/SimulasiHargaWidget.dart';
import 'package:flutter_aag4u/Menu_Profile/DaftarProfilePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: <String>['email'],
// );

final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      "938263913922-uqmhupj4mmc3cenuckud74b5snrc29kp.apps.googleusercontent.com", // Gantilah dengan Web Client ID dari Firebase
);

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
  final bool isRegistered, login; // Tambahkan flag untuk status registrasi
  ProfilePage({
    required this.isRegistered,
    required this.login,
  });
  // final bool login; // Tambahkan flag untuk status registrasi
}

// Model Data Profil
class ProfileData {
  final String phoneNumber;
  final String gender;
  final String province;
  final String city;
  final String? memberSince;

  ProfileData({
    required this.phoneNumber,
    required this.gender,
    required this.province,
    required this.city,
    this.memberSince,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      phoneNumber: json['telp'] ?? '',
      gender: json['gender'] ?? '',
      province: json['provinsi'] ?? '',
      city: json['kota'] ?? '',
      memberSince: json['created_at'],
    );
  }
}

class _ProfilePageState extends State<ProfilePage> {
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
    // final box = Hive.box('loginBox');
    // box.delete('after_login');
    _loadLoginStatus();
    // DataProfile();
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

  // Model untuk data profil
  Future<ProfileData> fetchDataProfile() async {
    try {
      final loginBox = await Hive.openBox('loginBox');
      final email = loginBox.get('email');
      if (email == null) {
        throw Exception('Email not found in loginBox.');
      }

      final response = await http.get(
        Uri.parse('https://app.aag4u.co.id/api/getProfile/$email'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ProfileData.fromJson(data);
      } else {
        throw Exception('Failed to fetch profile data');
      }
    } catch (e) {
      throw Exception('Server Sedang Error');
    }
  }

  Future<void> checkProfileBox() async {
    final profileBox = await Hive.openBox('profileBox');
    final profileData = profileBox.get('profile');

    if (profileData != null) {
      print('Data di profileBox: $profileData');
    } else {
      print('Tidak ada data di profileBox.');
    }
  }

  Future<void> _checkInternetConnection() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (mounted) {
      setState(() {
        hasInternet = isConnected;
      });
    }
  }

  Future<void> saveTokenToApi() async {
    final loginBox = await Hive.openBox('loginBox');
    final tokenBox = await Hive.openBox('tokenBox');

    final email = loginBox.get('email');
    final token = tokenBox.get('token');
    final tokenbearer = tokenBox.get('tokenbearer');
    print("Mengirim data hivebox: $tokenbearer");

    if (email != null) {
      final url = Uri.parse('https://app.aag4u.co.id/api/updateToken');
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
          url,
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
      await loginBox.put('isLoggedIn', true);
      await loginBox.put('name', _currentUser!.displayName);
      await loginBox.put('email', _currentUser!.email);
      await loginBox.put('photo', _currentUser!.photoUrl);

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

  // Memuat status login dari Hive
  Future<void> _loadLoginStatus() async {
    bool isLoggedIn = loginBox.get('isLoggedIn', defaultValue: false);
    final isiBox = await Hive.openBox('loginBox');
    // Cek apakah box tidak kosong, jika ada isi, refresh halaman

    if (mounted) {
      setState(() {
        _name = isiBox.get('name');
        _email = isiBox.get('email');
        _photoUrl = isiBox.get('photo');
      });
    }
    // print("ini isi hive box : $isLoggedIn");
  }

  // Fungsi untuk login menggunakan Google
  // Future<void> _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<void> _handleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? user = await _googleSignIn.signIn();

      if (user == null) return; // user cancel login
      if (!context.mounted) return;

      final box = Hive.box('loginBox');
      final String? afterLogin = box.get('after_login');

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text('Login Berhasil'),
          content: Text('Selamat datang ${user.displayName}'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context); // tutup alert

                // HAPUS FLAG agar tidak nyasar lagi
                box.delete('after_login');

                // ARAHKAN SESUAI TUJUAN
                if (afterLogin == 'survey') {
                   Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SimulasiHargaWidget(
                        isRegistered: false,
                        login: false,
                        isLoggedIn: true,
                      ),
                    ),
                  );
                } else {
                  _buildProfilePage();

                }
              },
            ),
          ],
        ),
      );
    } catch (e) {
      print(e);
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
    double fontSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    final loginBox = Hive.box('loginBox'); // Hive box sudah dibuka sebelumnya

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

          print('Data berhasil disimpan ke Hive box: ${loginBox.toMap()}');
          await saveTokenToApi();
        } else {
          print('Failed to submit data: ${info}');
        }

        // Tampilkan response body di dalam alert
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Berhasil'),
              content: Text('Selamat datang $mail',
                // style: TextStyle(fontSize: fontSize * 0.04),
              ),
              actions: [
                TextButton(
                  
                  onPressed: () async {
                    Navigator.pop(context);

                    final box = Hive.box('loginBox');
                    final target = box.get('after_login');

                    if (!mounted) return;

                    // hapus agar tidak nyangkut
                    await box.delete('after_login');

                    if (target == 'survey') {
                      // 🔥 MASUK KE HALAMAN SURVEY
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SimulasiHargaWidget(
                            isRegistered: false,
                            login: false,
                            isLoggedIn: true,
                          ),
                        ),
                      );
                    } else {
                      // 🔵 LOGIN BIASA → PROFILE
                      _buildProfilePage();
                    }
                  },
                  child:
                      Text('OK', style: TextStyle(fontSize: fontSize * 0.04)),
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
              child: Text('OK', style: TextStyle(fontSize: fontSize * 0.02)),
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double inWidth = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: (_currentUser == null && _name == null)
        //     ? Colors.white30
        //     : Colors.blue,
        // backgroundColor: Colors.amber,
        // toolbarHeight: screenheight * 0.07,

        flexibleSpace: ValueListenableBuilder(
          valueListenable:
              loginBox.listenable(), // Listen for changes in the Hive box
          builder: (context, Box box, _) {
            String? _email = box.get('email');

            if (_email == null) {
              // If email is null, show the sign-in page
              return Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    backgroundBlendMode: BlendMode.color),
              );
            } else {
              // If email is not null, show the profile page
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'images/assets/profile.jpg'), // Gambar latar belakang
                    fit: BoxFit.cover, // Agar gambar mengisi seluruh ruang
                  ),
                ),
              );
            }
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // color: Colors.amber,
              // width: 100,
              // height: 300,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Image.asset(
                                "images/icons/aag.png",
                                height: screenheight * 0.1,
                                width: screenWidth * 0.1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: hasInternet
          ?
          // ValueListenableBuilder(
          //     valueListenable:
          //         loginBox.listenable(), // Listen for changes in the Hive box
          //     builder: (context, Box box, _) {
          //       String? _email = box.get('email');

          //       if (_email == null) {
          //         // If email is null, show the sign-in page
          //         return _buildSignInPage();
          //       } else {
          //         // If email is not null, show the profile page
          //         return _buildProfilePage();
          //       }
          //     },
          //   )

          ValueListenableBuilder(
              valueListenable: Hive.box('loginBox').listenable(),
              builder: (context, Box box, _) {
                final String? email = box.get('email');
                final String? afterLogin = box.get('after_login');

                if (email == null) {
                  return _buildSignInPage();
                }

                // if (afterLogin == 'survey') {
                //   return _buildSimulasi();
                //   // const SimulasiHargaWidget(
                //   //   isRegistered: false,
                //   //   login: false,
                //   //   isLoggedIn: true,
                //   // );
                // } else {
                  return _buildProfilePage();
                // }
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double inWidth = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                              // color: const Color.fromARGB(255, 255, 255, 255),
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
                                        padding: const EdgeInsets.only(top: 30),
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
                                                                      width:
                                                                          screenWidth *
                                                                              0.9,
                                                                      height:
                                                                          screenheight *
                                                                              0.06,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border:
                                                                            Border.all(
                                                                          color: const Color
                                                                              .fromARGB(
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
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                screenWidth * 0.04),
                                                                        controller:
                                                                            emailController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          border:
                                                                              InputBorder.none,
                                                                          prefixIcon:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.only(left: 10, right: 10), // Jarak ikon ke teks
                                                                            child:
                                                                                Icon(
                                                                              Icons.email,
                                                                              size: iconSize * 0.06,
                                                                            ),
                                                                          ),
                                                                          hintText:
                                                                              'Email',
                                                                          hintStyle:
                                                                              TextStyle(fontSize: fontSize * 0.04),
                                                                          contentPadding:
                                                                              EdgeInsets.symmetric(vertical: 15), // Jarak teks ke border
                                                                        ),
                                                                        validator:
                                                                            (String?
                                                                                value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return 'Masukkan Email';
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
                                                                      width:
                                                                          screenWidth *
                                                                              0.9,
                                                                      height:
                                                                          screenheight *
                                                                              0.06,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border:
                                                                            Border.all(
                                                                          color: const Color
                                                                              .fromARGB(
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
                                                                          EdgeInsets
                                                                              .only(
                                                                        left: 0,
                                                                      ),
                                                                      child:
                                                                          TextFormField(
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                screenWidth * 0.04),
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
                                                                            padding:
                                                                                EdgeInsets.only(left: 10, right: 10), // Jarak ikon ke teks
                                                                            child:
                                                                                Icon(
                                                                              Icons.lock,
                                                                              size: iconSize * 0.06,
                                                                            ),
                                                                          ),
                                                                          hintText:
                                                                              'Password',
                                                                          hintStyle:
                                                                              TextStyle(fontSize: fontSize * 0.04),
                                                                          contentPadding:
                                                                              EdgeInsets.symmetric(vertical: 15), // Jarak teks ke border

                                                                          suffixIcon:
                                                                              IconButton(
                                                                            icon:
                                                                                Icon(
                                                                              _isObscured ? Icons.visibility : Icons.visibility_off,
                                                                              size: iconSize * 0.06,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              if (mounted) {
                                                                                setState(() {
                                                                                  _isObscured = !_isObscured;
                                                                                });
                                                                              }
                                                                            },
                                                                          ),
                                                                        ),
                                                                        validator:
                                                                            (String?
                                                                                value) {
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
                                                height: screenheight * 0.03,
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
                                                  height: screenheight * 0.02),
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
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              20),
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Buat akun baru?",
                                                                            style:
                                                                                TextStyle(fontSize: fontSize * 0.04, color: Colors.black),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(builder: (context) => DaftarProfilePage()),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Text(
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
                                              SizedBox(
                                                  height: screenheight * 0.02),
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
                                                                    style:
                                                                        ButtonStyle(
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
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: <Widget>[
                                                                          FaIcon(
                                                                            FontAwesomeIcons.google,
                                                                            size:
                                                                                iconSize * 0.04,
                                                                            color:
                                                                                Colors.blue,
                                                                          ),
                                                                          SizedBox(
                                                                              width: 15),
                                                                          // Icon(Icons.goo),
                                                                          Text(
                                                                            'Sign in with Google',
                                                                            style:
                                                                                TextStyle(
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
                                                                          context);
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
    );
    //   ElevatedButton(
    //   onPressed: _handleSignIn,
    //   child: Text('Login with Google'),
    // ),
  }

  // Widget tampilan profil pengguna setelah login
  Widget _buildProfilePage() {
    // double inWidth = MediaQuery.of(context).size.width * 0.9;
    // double screenWidth = MediaQuery.of(context).size.width * 1;
    // double screenfullWidth = MediaQuery.of(context).size.width * 0.9;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double inWidth = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;

    final loginBox = Hive.box('loginBox');
    final _photoUrl = loginBox.get('photo'); // Mengambil foto dari Hive box

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 12, 98),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screenheight * 1.2,
              width: screenWidth * 1.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/assets/profile.jpg'),
                  fit: BoxFit.cover, // Atur bagaimana gambar akan ditampilkan
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenheight * 0.04),
                  CircleAvatar(
                    radius: screenheight * 0.08,
                    backgroundImage: _photoUrl != null && _photoUrl!.isNotEmpty
                        ? NetworkImage(_photoUrl!)
                        : AssetImage('images/profile.png') as ImageProvider,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    ' ${_name ?? 'No Name'}',
                    style: TextStyle(
                      fontSize: fontSize * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    ' ${_email ?? 'No Email'}',
                    style: TextStyle(
                      fontSize: fontSize * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenheight * 0.9,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenheight * 0.71,
                width: screenWidth * 0.9,
                margin: EdgeInsets.only(top: screenheight * 0.3),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                    bottom: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: FutureBuilder<ProfileData>(
                  future: fetchDataProfile(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      final error = snapshot.error.toString();
                      if (error.contains('500') || error.contains('502')) {
                        return Center(
                            child: Text('Server Sedang Error',
                                style: TextStyle(fontSize: fontSize * 0.04)));
                      } else {
                        return Center(
                            child: Text('Server Sedang Error',
                                style: TextStyle(fontSize: fontSize * 0.04)));
                      }
                    } else if (snapshot.hasData && snapshot.data != null) {
                      final data = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Icons.phone,
                                color: Colors.blue, size: iconSize * 0.04),
                            title: Text(
                              "Phone Number",
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              data.phoneNumber.isNotEmpty
                                  ? data.phoneNumber
                                  : '-',
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: screenheight * 0.02,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.blue,
                              size: iconSize * 0.04,
                            ),
                            title: Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              data.gender.isNotEmpty ? data.gender : '-',
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: screenheight * 0.02,
                          ),
                          ListTile(
                            leading: Icon(Icons.location_on,
                                color: Colors.blue, size: iconSize * 0.04),
                            title: Text(
                              "Province",
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              data.province.isNotEmpty ? data.province : '-',
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: screenheight * 0.02,
                          ),
                          ListTile(
                            leading: Icon(Icons.location_city,
                                color: Colors.blue, size: iconSize * 0.04),
                            title: Text(
                              "City",
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              data.city.isNotEmpty ? data.city : '-',
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: screenheight * 0.02,
                          ),
                          ListTile(
                            leading: Icon(Icons.date_range,
                                color: Colors.blue, size: iconSize * 0.04),
                            title: Text(
                              "Member Since",
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              '-',
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Icons.phone,
                                color: Colors.blue, size: iconSize * 0.05),
                            title: Text(
                              "Phone Number",
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              '-',
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: screenheight * 0.02,
                          ),
                          ListTile(
                            leading: Icon(Icons.person,
                                color: Colors.blue, size: iconSize * 0.04),
                            title: Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              '-',
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: screenheight * 0.02,
                          ),
                          ListTile(
                            leading: Icon(Icons.location_on,
                                color: Colors.blue, size: iconSize * 0.04),
                            title: Text(
                              "Province",
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              '-',
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: screenheight * 0.02,
                          ),
                          ListTile(
                            leading: Icon(Icons.location_city,
                                color: Colors.blue, size: iconSize * 0.04),
                            title: Text(
                              "City",
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              '-',
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Divider(
                            height: screenheight * 0.02,
                          ),
                          ListTile(
                            leading: Icon(Icons.date_range,
                                color: Colors.blue, size: iconSize * 0.04),
                            title: Text(
                              "Member Since",
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              '-',
                              style: TextStyle(
                                fontSize: fontSize * 0.04,
                                color: Colors.black,
                              ),
                            ),
                            // subtitle: Text(data.memberSince ?? '-'),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: screenWidth * 0.3, // Atur lebar
        height: screenheight * 0.06, // Atur tinggi
        child: FloatingActionButton.extended(
          onPressed: () {
            _handleSignOut();
          },
          highlightElevation: screenheight * 0.8,
          icon: Icon(
            Icons.logout,
            size: iconSize * 0.04,
          ),
          label: Text(
            "Logout",
            style: TextStyle(
              fontSize: fontSize * 0.04,
              color: Colors.white70,
            ),
          ),
          backgroundColor: Colors.redAccent,
        ),
      ),
    );
  }

  Widget _buildSimulasi() {
    return Scaffold(
        body: Stack(
      children: [SimulasiHargaWidget(
         isRegistered: false,
            login: false,
            isLoggedIn: true,
      )],
    ));
  }
}

// class TokenService {
//   Future<void> hivetoken() async {
//     final String apiUrl = 'https://app.aag4u.co.id/api/updateToken';
//     final Box loginBox = Hive.openBox('loginBox')
//         as Box; // Gantilah 'loginBox' sesuai nama box yang Anda gunakan
//     String? tokenn = loginBox.get('token');
//     print("email dari hive box $loginBox");

//     // Ambil email dari Hive box
//     String? getEmailFromHive() {
//       return loginBox.get(
//           'email'); // Asumsikan 'email' adalah kunci penyimpanan email di Hive
//     }

//     // Simpan token ke API
//     Future<void> saveTokenToApi(String token) async {
//       final email = getEmailFromHive();
//       if (email == null) {
//         print('Email tidak ditemukan di Hive box.');
//         return;
//       }

//       // Persiapkan data untuk dikirim ke API
//       final Map<String, String> body = {
//         'email': email,
//         'token': token,
//       };

//       try {
//         // Lakukan request POST ke API
//         final response = await http.post(
//           Uri.parse(apiUrl),
//           body: body,
//           headers: {
//             'Content-Type': 'application/json',
//           },
//         );

//         if (response.statusCode == 200) {
//           print('Token berhasil disimpan ke API.');
//         } else {
//           print('Gagal menyimpan token ke API. Status: ${response.statusCode}');
//         }
//       } catch (e) {
//         print('Terjadi kesalahan: $e');
//       }
//     }
//   }
// }
