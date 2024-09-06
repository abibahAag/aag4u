// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_Profile/DaftarProfilePage.dart';
// import 'package:flutter_aag4u/Menu_Profile/login_page.dart';
// // import 'package:flutter_aag4u/template/navbar.dart';
// // import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';
// // import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double inWidth = MediaQuery.of(context).size.width * 0.8;

//     return Scaffold(
//       // appBar: Navbar(),
//       body: SafeArea(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         width: 350,
//                                         height: 300,
//                                         child: Image.asset("images/Login.png"),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   child: Text(
//                                     "Selamat Datang Di  AAG4U",
//                                     style: TextStyle(
//                                       color: Colors.blue,
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 100,
//                     ),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               // color: Colors.amber,
//                               width: 300,
//                               height: 200,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Column(
//                                     // crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Container(
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     TextButton(
//                                                       onPressed: () {
//                                                         Navigator.push(
//                                                             context,
//                                                             MaterialPageRoute(
//                                                                 builder:
//                                                                     (context) =>
//                                                                         LoginPage()));
//                                                       },
//                                                       style: ButtonStyle(
//                                                           backgroundColor:
//                                                               MaterialStateProperty
//                                                                   .all(const Color
//                                                                       .fromARGB(
//                                                                       255,
//                                                                       103,
//                                                                       161,
//                                                                       236))),
//                                                       child: Container(
//                                                         width: 250,
//                                                         child: Center(
//                                                           child: Text(
//                                                             'Login',
//                                                             style: TextStyle(
//                                                               color:
//                                                                   Colors.black,
//                                                               fontSize: 20,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Column(
//                                             children: [
//                                               Container(
//                                                 child: Column(
//                                                   children: [
//                                                     Row(
//                                                       children: [Text("Or")],
//                                                     )
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Container(
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     TextButton(
//                                                       onPressed: () {
//                                                         Navigator.push(
//                                                             context,
//                                                             MaterialPageRoute(
//                                                                 builder:
//                                                                     (context) =>
//                                                                         DaftarProfilePage()));
//                                                       },
//                                                       style: ButtonStyle(
//                                                           backgroundColor:
//                                                               MaterialStateProperty
//                                                                   .all(const Color
//                                                                       .fromARGB(
//                                                                       255,
//                                                                       103,
//                                                                       161,
//                                                                       236))),
//                                                       child: Container(
//                                                         width: 250,
//                                                         child: Center(
//                                                           child: Text(
//                                                             'Daftar Akun',
//                                                             style: TextStyle(
//                                                               color:
//                                                                   Colors.black,
//                                                               fontSize: 20,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Profile/ProfileWidget.dart';
import 'package:flutter_aag4u/Menu_Profile/login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_signin/pages/home_page.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => loginpage(),
          ),
        );
      }
    });
    _googleSignIn.signInSilently();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       appBar: AppBar(
  //         automaticallyImplyLeading: true,
  //       ),
  //       body: Center(
  //         child: ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(30),
  //             ),
  //             backgroundColor: Colors.white, // Button color
  //             padding: EdgeInsets.all(8),
  //           ),
  //           child: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               FaIcon(FontAwesomeIcons.google),
  //               SizedBox(width: 10),
  //               Text(
  //                 'Sign in with Google',
  //                 style: TextStyle(
  //                   fontSize: 24,
  //                   fontWeight: FontWeight.w800,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           onPressed: () {
  //             _handleSignIn();
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double inWidth = MediaQuery.of(context).size.width * 0.9;
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    double screenfullWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   // appBar: Navbar(),

      //   title: Container(
      //     // color: Colors.amber,
      //     width: 250,
      //     // height: 300,
      //     child: Column(
      //       children: [
      //         Container(
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Column(
      //                 children: [
      //                   Container(
      //                     child: Image.asset(
      //                       "images/icons/aagu.png",
      //                       height: 100,
      //                       width: 100,
      //                     ),
      //                   ),
      //                   // Text(
      //                   //   "data",
      //                   //   style: TextStyle(color: Colors.black, fontSize: 5),
      //                   // )
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [ProfileWidget()],
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print('Sign-in failed: $error');
    }
  }
}
