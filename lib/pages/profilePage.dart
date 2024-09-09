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
// import 'package:flutter_aag4u/template/navbar.dart';
// import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';
// import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double inWidth = MediaQuery.of(context).size.width * 0.9;
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    double screenfullWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      // appBar: Navbar(),
      body: SafeArea(
        child: Column(
          children: [
            // Image.asset('images/blog/artikel.jpg')
            Text(" PROFILE")
          ],
        ),
      ),
      // bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
