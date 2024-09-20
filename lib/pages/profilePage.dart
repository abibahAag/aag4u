// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_Profile/DaftarProfilePage.dart';
// import 'package:flutter_aag4u/Menu_Profile/ProfileWidget.dart';
// import 'package:flutter_aag4u/template/navbar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: <String>[
//     'email',
//   ],
// );

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   void initState() {
//     super.initState();
//     _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
//       if (account != null) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProfileWidget(),
//           ),
//         );
//       }
//     });
//     _googleSignIn.signInSilently();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double inWidth = MediaQuery.of(context).size.width * 0.8;
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;
//     double screenfullWidth = MediaQuery.of(context).size.width * 1;

//     return Scaffold(
//       appBar: Navbar(),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Center(
//                                           child: Container(
//                                               // color: Colors.amber,
//                                               width: 250,
//                                               height: 200,
//                                               child: Image.asset(
//                                                 "images/login2.png",
//                                               )),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 // width: screenWidth,
//                                 // height: 100,
//                                 // alignment: Alignment.center,
//                                 // decoration: BoxDecoration(
//                                 //   color: Color(0xFF233d63),
//                                 //   borderRadius: BorderRadius.circular(24),
//                                 // ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           "Welcome!",
//                                           style: TextStyle(
//                                               fontSize: 40,
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF233d63)),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Text("Hey! Good to see you again")
//                                           ],
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 // color: const Color.fromARGB(255, 148, 201, 244),
//                                 borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(24),
//                               topRight: Radius.circular(24),
//                               //   bottomLeft: Radius.circular(24),
//                               //   bottomRight: Radius.circular(24),
//                             )),
//                             width: screenfullWidth,
//                             height: 350,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Column(
//                                       // mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(top: 30),
//                                           child: Container(
//                                             // color: Colors.amber,
//                                             // width: inWidth,
//                                             // height: 300,
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Column(
//                                                       children: [
//                                                         Row(
//                                                           children: [
//                                                             Container(
//                                                               child: Column(
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   Row(
//                                                                     children: [
//                                                                       Container(
//                                                                         width:
//                                                                             inWidth,
//                                                                         height:
//                                                                             50,
//                                                                         decoration:
//                                                                             BoxDecoration(
//                                                                           border:
//                                                                               Border.all(
//                                                                             color: const Color.fromARGB(
//                                                                                 255,
//                                                                                 0,
//                                                                                 0,
//                                                                                 0),
//                                                                             width:
//                                                                                 1,
//                                                                             style:
//                                                                                 BorderStyle.solid,
//                                                                           ),
//                                                                           borderRadius:
//                                                                               BorderRadius.circular(24),
//                                                                         ),
//                                                                         child:
//                                                                             TextFormField(
//                                                                           // controller: _waController,
//                                                                           // keyboardType:
//                                                                           //     TextInputType.phone,
//                                                                           decoration:
//                                                                               const InputDecoration(
//                                                                             border:
//                                                                                 InputBorder.none,
//                                                                             prefixIcon:
//                                                                                 Icon(
//                                                                               Icons.email,
//                                                                               size: 20,
//                                                                             ),
//                                                                             hintText:
//                                                                                 'Email',
//                                                                           ),
//                                                                           validator:
//                                                                               (String? value) {
//                                                                             if (value == null ||
//                                                                                 value.isEmpty) {
//                                                                               return ' Maukkan Email';
//                                                                             }
//                                                                             return null;
//                                                                           },
//                                                                         ),
//                                                                       )
//                                                                     ],
//                                                                   )
//                                                                 ],
//                                                               ),
//                                                             )
//                                                           ],
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 20,
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     Column(
//                                                       children: [
//                                                         Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Container(
//                                                               child: Column(
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   Row(
//                                                                     children: [
//                                                                       Container(
//                                                                         width:
//                                                                             inWidth,
//                                                                         height:
//                                                                             50,
//                                                                         decoration:
//                                                                             BoxDecoration(
//                                                                           border:
//                                                                               Border.all(
//                                                                             color: const Color.fromARGB(
//                                                                                 255,
//                                                                                 7,
//                                                                                 7,
//                                                                                 7),
//                                                                             width:
//                                                                                 1,
//                                                                             style:
//                                                                                 BorderStyle.solid,
//                                                                           ),
//                                                                           borderRadius:
//                                                                               BorderRadius.circular(24),
//                                                                         ),
//                                                                         padding:
//                                                                             EdgeInsets.only(
//                                                                           left:
//                                                                               10,
//                                                                         ),
//                                                                         child:
//                                                                             TextFormField(
//                                                                           // controller: _waController,
//                                                                           // keyboardType:
//                                                                           //     TextInputType.phone,
//                                                                           decoration:
//                                                                               const InputDecoration(
//                                                                             border:
//                                                                                 InputBorder.none,
//                                                                             prefixIcon:
//                                                                                 Icon(
//                                                                               Icons.lock,
//                                                                               size: 20,
//                                                                             ),
//                                                                             hintText:
//                                                                                 'Password',
//                                                                           ),
//                                                                           validator:
//                                                                               (String? value) {
//                                                                             if (value == null ||
//                                                                                 value.isEmpty) {
//                                                                               return ' Maukkan Password';
//                                                                             }
//                                                                             return null;
//                                                                           },
//                                                                         ),
//                                                                       )
//                                                                     ],
//                                                                   )
//                                                                 ],
//                                                               ),
//                                                             )
//                                                           ],
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 30,
//                                                 ),
//                                                 Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.end,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment.end,
//                                                       children: [
//                                                         Container(
//                                                           // width: 100,
//                                                           // height: 50,
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .end,
//                                                             children: [
//                                                               Row(
//                                                                 children: [
//                                                                   ElevatedButton(
//                                                                     style:
//                                                                         ButtonStyle(
//                                                                       fixedSize: WidgetStatePropertyAll(Size(
//                                                                           inWidth,
//                                                                           30)),
//                                                                       backgroundColor: MaterialStateProperty.all<
//                                                                               Color>(
//                                                                           Color(
//                                                                               0xFF233d63)),
//                                                                     ),
//                                                                     onPressed:
//                                                                         () {},
//                                                                     child: Row(
//                                                                       mainAxisAlignment:
//                                                                           MainAxisAlignment
//                                                                               .center,
//                                                                       children: [
//                                                                         Text(
//                                                                           'Login',
//                                                                           style: TextStyle(
//                                                                               fontSize: 15,
//                                                                               color: Colors.white),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 SizedBox(height: 10),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.end,
//                                                   children: [
//                                                     Column(
//                                                       // crossAxisAlignment: CrossAxisAlignment.end,
//                                                       children: [
//                                                         Container(
//                                                           child: Row(
//                                                             children: [
//                                                               Column(
//                                                                 children: [
//                                                                   Container(
//                                                                     // color: Colors.amber,
//                                                                     // width: 150,
//                                                                     padding: EdgeInsets.only(
//                                                                         right:
//                                                                             20),
//                                                                     child:
//                                                                         Column(
//                                                                       children: [
//                                                                         Row(
//                                                                           children: [
//                                                                             Text(
//                                                                               "Buat akun baru?",
//                                                                               style: TextStyle(fontSize: 15, color: Colors.black),
//                                                                             ),
//                                                                             SizedBox(
//                                                                               width: 5,
//                                                                             ),
//                                                                             InkWell(
//                                                                               onTap: () {
//                                                                                 Navigator.push(
//                                                                                   context,
//                                                                                   MaterialPageRoute(builder: (context) => DaftarProfilePage()),
//                                                                                 );
//                                                                               },
//                                                                               child: Text(
//                                                                                 "Sign Up",
//                                                                                 style: TextStyle(fontSize: 15, color: Colors.lightBlue),
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         )
//                                                                       ],
//                                                                     ),
//                                                                   )
//                                                                 ],
//                                                               )
//                                                             ],
//                                                           ),
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 ),
//                                                 SizedBox(height: 15),
//                                                 Row(
//                                                   children: [
//                                                     Column(
//                                                       children: [
//                                                         Container(
//                                                           child: Column(
//                                                             children: [
//                                                               Row(
//                                                                 children: [
//                                                                   Center(
//                                                                     child:
//                                                                         ElevatedButton(
//                                                                       // style: ElevatedButton
//                                                                       //     .styleFrom(
//                                                                       //   shape:
//                                                                       //       RoundedRectangleBorder(
//                                                                       //     borderRadius:
//                                                                       //         BorderRadius.circular(30),
//                                                                       //   ),

//                                                                       //   backgroundColor:
//                                                                       //       Color(0xFF233d63), // Button color
//                                                                       //   padding:
//                                                                       //       EdgeInsets.all(8),
//                                                                       // ),
//                                                                       style:
//                                                                           ButtonStyle(
//                                                                         fixedSize: WidgetStatePropertyAll(Size(
//                                                                             inWidth,
//                                                                             30)),
//                                                                         backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(
//                                                                             255,
//                                                                             255,
//                                                                             255,
//                                                                             255)),
//                                                                       ),
//                                                                       child:
//                                                                           Container(
//                                                                         child:
//                                                                             Row(
//                                                                           mainAxisSize:
//                                                                               MainAxisSize.min,
//                                                                           children: <Widget>[
//                                                                             FaIcon(
//                                                                               FontAwesomeIcons.google,
//                                                                               color: Colors.blue,
//                                                                             ),
//                                                                             SizedBox(width: 15),
//                                                                             // Icon(Icons.goo),
//                                                                             Text(
//                                                                               'Sign in with Google',
//                                                                               style: TextStyle(
//                                                                                 color: const Color(0xFF233d63),
//                                                                                 fontSize: 15,
//                                                                                 // fontWeight:
//                                                                                 //     FontWeight.w800,
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                       onPressed:
//                                                                           () {
//                                                                         _handleSignIn();
//                                                                       },
//                                                                     ),
//                                                                   )
//                                                                 ],
//                                                               )
//                                                             ],
//                                                           ),
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _handleSignIn() async {
//     try {
//       await _googleSignIn.signIn();
//     } catch (error) {
//       print('Sign-in failed: $error');
//     }
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0.0, size.height - 50);

//     var firstControlPoint = Offset(size.width / 4, size.height);
//     var firstEndPoint = Offset(size.width / 2, size.height - 50.0);

//     var secondControlPoint = Offset(3 * size.width / 4, size.height - 100);
//     var secondEndPoint = Offset(size.width, size.height - 50.0);

//     path.quadraticBezierTo(
//       firstControlPoint.dx,
//       firstControlPoint.dy,
//       firstEndPoint.dx,
//       firstEndPoint.dy,
//     );

//     path.quadraticBezierTo(
//       secondControlPoint.dx,
//       secondControlPoint.dy,
//       secondEndPoint.dx,
//       secondEndPoint.dy,
//     );

//     path.lineTo(size.width, 0.0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Profile/DaftarProfilePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>['email'],
);

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
  final bool isRegistered, login; // Tambahkan flag untuk status registrasi
  ProfilePage({required this.isRegistered, required this.login});
  // final bool login; // Tambahkan flag untuk status registrasi
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

  // Membuat TextFormField untuk email dan password
// TextFormField(
//   controller: emailController,
//   decoration: InputDecoration(labelText: 'Email'),
// );
// TextFormField(
//   controller: passwordController,
//   obscureText: true, // Untuk menyembunyikan password
//   decoration: InputDecoration(labelText: 'Password'),
// );

  @override
  void initState() {
    super.initState();
    _loadLoginStatus();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        if (_currentUser != null) {
          _saveLoginStatus(true); // Simpan data login ke Hive
        }
      });
    });
    _googleSignIn.signInSilently();
    // Tampilkan alert jika pengguna sudah terdaftar (register)
    if (widget.isRegistered) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showVerificationAlert();
      });
    }
  }

  // Menyimpan status login google ke Hive
  Future<void> _saveLoginStatus(bool status) async {
    // await loginBox.put('isLoggedIn', status);
    // if (status && _currentUser != null) {
    await http.post(
      Uri.parse('https://app.aag4u.co.id/api/addUserGoogle'),
      body: jsonEncode({
        'name': _currentUser!.displayName,
        'email': _currentUser!.email,
        'photo': _currentUser!.photoUrl,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    await loginBox.put('name', _currentUser!.displayName);
    await loginBox.put('email', _currentUser!.email);
    await loginBox.put('photo', _currentUser!.photoUrl);

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       content: Text(
    //         'Success Login',
    //         style: TextStyle(fontSize: 20),
    //       ),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(context); // Tutup dialog

    //             setState(() {
    //               _name = isiBox!.get('name');
    //               _email = isiBox!.get('email');
    //               _photoUrl = isiBox!.get('photo');
    //             });
    //             ;
    //           },
    //           child: Text('OK'),
    //         ),
    //       ],
    //     );
    //   },
    // );
    setState(() {
      _name = isiBox!.get('name');
      _email = isiBox!.get('email');
      _photoUrl = isiBox!.get('photo');
    });
  }

  // Memuat status login dari Hive
  Future<void> _loadLoginStatus() async {
    // bool isLoggedIn = loginBox.get('isLoggedIn', defaultValue: false);
    isiBox = await Hive.openBox('loginBox');
    // Cek apakah box tidak kosong, jika ada isi, refresh halaman

    // if (isLoggedIn) {
    setState(() {
      _name = isiBox!.get('name');
      _email = isiBox!.get('email');
      _photoUrl = isiBox!.get('photo');
    });
    // }
  }

  ///opeb hive box

  // Fungsi untuk login menggunakan Google
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  // Fungsi untuk logout dan hapus data di Hive
  Future<void> _handleSignOut() async {
    await _googleSignIn.signOut();
    await loginBox.clear(); // Hapus semua data login di Hive
    setState(() {
      _currentUser = null;
      _name = null;
      _email = null;
      _photoUrl = null;
    });
  }

  Future<void> loginUser(BuildContext context) async {
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

        final pesan = json.decode(response.body) as Map<String, dynamic>;
        final info = pesan['pesan'];
        final mail = pesan['email'];
        final name = pesan['name'];
        final photo = pesan['photo'];

        if (info == "berhasil") {
          //hive box save
          await loginBox.put('email', mail);
          await loginBox.put('name', name);
          await loginBox.put('photo', photo);
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
                style: TextStyle(fontSize: 20),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Tutup dialog

                    setState(() {
                      _name = isiBox!.get('name');
                      _email = isiBox!.get('email');
                      _photoUrl = isiBox!.get('photo');
                    });
                    ;
                  },
                  child: Text('OK'),
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Verifikasi Email'),
          content: Text('Cek email untuk melakukan verifikasi akun.'),
          actions: [
            TextButton(
              child: Text('OK'),
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: (_currentUser == null && _name == null)
              ? Colors.white30
              : Colors.blue,

          automaticallyImplyLeading: true,
          // appBar: Navbar(),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: Colors.amber,
                width: 100,
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
                                  "images/icons/aagu.png",
                                  height: 100,
                                  width: 100,
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
        body: ValueListenableBuilder(
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
        ));
  }

  // Widget tampilan login Google
  Widget _buildSignInPage() {
    double inWidth = MediaQuery.of(context).size.width * 0.8;
    double inWidthlogo = MediaQuery.of(context).size.width * 0.9;
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    double screenfullWidth = MediaQuery.of(context).size.width * 1;
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
                                            height: 200,
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
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF233d63)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text("Hey! Good to see you again")
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
                      height: 10,
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
                          width: screenfullWidth,
                          height: 350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                                                          inWidth,
                                                                      height:
                                                                          50,
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
                                                                        controller:
                                                                            emailController,
                                                                        // keyboardType:
                                                                        //     TextInputType.phone,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          border:
                                                                              InputBorder.none,
                                                                          prefixIcon:
                                                                              Icon(
                                                                            Icons.email,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          hintText:
                                                                              'Email',
                                                                        ),
                                                                        validator:
                                                                            (String?
                                                                                value) {
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
                                                height: 20,
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
                                                                          inWidth,
                                                                      height:
                                                                          50,
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
                                                                        controller:
                                                                            passwordController,
                                                                        // keyboardType:
                                                                        //     TextInputType.phone,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          border:
                                                                              InputBorder.none,
                                                                          prefixIcon:
                                                                              Icon(
                                                                            Icons.lock,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          hintText:
                                                                              'Password',
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
                                                                    fixedSize: MaterialStateProperty.all<
                                                                            Size>(
                                                                        Size(
                                                                            inWidth,
                                                                            30)),
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
                                                                    setState(
                                                                        () {});
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
                                                                              15,
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
                                              SizedBox(height: 10),
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
                                                                                TextStyle(fontSize: 15, color: Colors.black),
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
                                                                              style: TextStyle(fontSize: 15, color: Colors.lightBlue),
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
                                                                    style:
                                                                        ButtonStyle(
                                                                      fixedSize: WidgetStatePropertyAll(Size(
                                                                          inWidth,
                                                                          30)),
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
                                                                              fontSize: 15,
                                                                              // fontWeight:
                                                                              //     FontWeight.w800,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      _handleSignIn();
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
    double inWidth = MediaQuery.of(context).size.width * 0.9;
    double screenWidth = MediaQuery.of(context).size.width * 1;
    double screenfullWidth = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: Colors.grey[200], // Warna latar belakang halaman
      body: Stack(
        children: [
          // Background untuk bagian atas halaman (seperti header)
          Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Bagian body dari profile page
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                // Spacer untuk memberi jarak ke atas
                SizedBox(height: 50),

                // Avatar pengguna
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(_photoUrl ??
                      'https://w7.pngwing.com/pngs/831/88/png-transparent-user-profile-computer-icons-user-interface-mystique-miscellaneous-user-interface-design-smile-thumbnail.png'),
                  backgroundColor: Colors.white,
                ),

                // Nama Pengguna
                SizedBox(height: 10),
                Text(
                  ' ${_name ?? 'No Name'}', // Nama pengguna
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                // Email Pengguna
                Text(
                  ' ${_email ?? 'No Email'}', // Email pengguna dari Hive
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),

                SizedBox(height: 20),

                // Kartu Informasi Profil
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.phone, color: Colors.blue),
                          title: Text("Phone Number"),
                          subtitle: Text("-"),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.location_on, color: Colors.blue),
                          title: Text("Address"),
                          subtitle: Text("-"),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.date_range, color: Colors.blue),
                          title: Text("Member Since"),
                          subtitle: Text("-"),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Tombol logout di bagian bawah halaman
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Logout dengan menghapus email dari Hive
          // box.delete('email');

          // Kembali ke halaman login
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => _handleSignOut),
          // );
          _handleSignOut();
        },
        icon: Icon(Icons.logout),
        label: Text("Logout"),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
