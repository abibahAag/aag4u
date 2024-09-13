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
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Profile/DaftarProfilePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>['email'],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('loginBox'); // Buka Hive box untuk menyimpan data login
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sign-In Example with Hive',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GoogleSignInAccount? _currentUser;
  Box loginBox = Hive.box('loginBox');
  String? _name, _email, _photoUrl; // Simpan informasi login sebagai variabel

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
  }

  // Memuat status login dari Hive
  Future<void> _loadLoginStatus() async {
    bool isLoggedIn = loginBox.get('isLoggedIn', defaultValue: false);
    if (isLoggedIn) {
      setState(() {
        _name = loginBox.get('name');
        _email = loginBox.get('email');
        _photoUrl = loginBox.get('photoUrl');
      });
    }
  }

  // Menyimpan status login ke Hive
  Future<void> _saveLoginStatus(bool status) async {
    await loginBox.put('isLoggedIn', status);
    if (status && _currentUser != null) {
      await loginBox.put('name', _currentUser!.displayName);
      await loginBox.put('email', _currentUser!.email);
      await loginBox.put('photoUrl', _currentUser!.photoUrl);
      setState(() {
        _name = _currentUser!.displayName;
        _email = _currentUser!.email;
        _photoUrl = _currentUser!.photoUrl;
      });
    }
  }

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
      body: (_currentUser == null && _name == null)
          ? _buildSignInPage()
          : _buildProfilePage(),
    );
  }

  // Widget tampilan login Google
  Widget _buildSignInPage() {
    double inWidth = MediaQuery.of(context).size.width * 0.8;
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
                                            width: 250,
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
                                                                        // controller: _waController,
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
                                                                        left:
                                                                            10,
                                                                      ),
                                                                      child:
                                                                          TextFormField(
                                                                        // controller: _waController,
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
                                                                    fixedSize:
                                                                        WidgetStatePropertyAll(Size(
                                                                            inWidth,
                                                                            30)),
                                                                    backgroundColor: MaterialStateProperty.all<
                                                                            Color>(
                                                                        Color(
                                                                            0xFF233d63)),
                                                                  ),
                                                                  onPressed:
                                                                      () {},
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Login',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                Colors.white),
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
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              // color: Colors.amber,
                              width: 350,
                              height: 450,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
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
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Name",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Container(
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
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      ' ${_name ?? 'No Name'}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18),
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Container(
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
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Email",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Container(
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
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      ' ${_email ?? 'No Email'}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16),
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              child: ElevatedButton(
                                                onPressed: _handleSignOut,
                                                child: Text('Logout'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
        ),
        Container(
          width: screenWidth,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(34),
                bottomLeft: Radius.circular(34)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.amber,
                    width: 300,
                    // height: 200,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(_photoUrl ?? ''),
                                      radius: 80,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
