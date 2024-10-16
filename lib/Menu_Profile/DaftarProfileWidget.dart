// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/pages/profilePage.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class DaftarProfileWidget extends StatefulWidget {
//   const DaftarProfileWidget({super.key});

//   @override
//   State<DaftarProfileWidget> createState() => _DaftarProfileWidgetState();
// }

// class _DaftarProfileWidgetState extends State<DaftarProfileWidget> {
//   @override
//   Widget build(BuildContext context) {
//     bool _isTextEmpty = true;
//     double inWidth = MediaQuery.of(context).size.width * 0.8;
//     double screenWidth = MediaQuery.of(context).size.width * 1;
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           ClipPath(
//             clipper: WaveClipper(),
//             child: Container(
//               height: 100,
//               color: Colors.blue,
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     // width: screenWidth,
//                     // height: 100,
//                     // alignment: Alignment.center,
//                     // decoration: BoxDecoration(
//                     //   color: Color(0xFF233d63),
//                     //   borderRadius: BorderRadius.circular(24),
//                     // ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                   fontSize: 40,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF233d63)),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Column(
//                               children: [Text("Hello! let's join with us")],
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Row(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 // color: Colors.blue,
//                 width: screenWidth,
//                 // height: 400,
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   child: Column(
//                                     children: [
//                                       // Row(
//                                       //   mainAxisAlignment:
//                                       //       MainAxisAlignment.start,
//                                       //   children: [
//                                       //     Column(
//                                       //       children: <Widget>[
//                                       //         Container(
//                                       //           // color: Colors.blue,
//                                       //           // width:,
//                                       //           height: 30,
//                                       //           child: Text(
//                                       //             "Nama Lengkap",
//                                       //             style: TextStyle(
//                                       //               fontSize: 15,
//                                       //               fontWeight: FontWeight.bold,
//                                       //             ),
//                                       //           ),
//                                       //         )
//                                       //       ],
//                                       //     )
//                                       //   ],
//                                       // ),
//                                       Row(
//                                         children: [
//                                           Container(
//                                             width: inWidth,
//                                             height: 50,
//                                             decoration: BoxDecoration(
//                                               border: Border.all(
//                                                 color: Colors.grey,
//                                                 width: 1,
//                                                 style: BorderStyle.solid,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(24),
//                                             ),
//                                             padding: EdgeInsets.only(
//                                               top: 5,
//                                             ),
//                                             child: TextFormField(
//                                               decoration: const InputDecoration(
//                                                 border: InputBorder.none,
//                                                 prefixStyle: TextStyle(
//                                                   fontSize: 10,
//                                                 ),
//                                                 prefixIcon: Icon(
//                                                   Icons.person,
//                                                   size: 25,
//                                                 ),
//                                                 hintText: 'Nama Lengkap',
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       // Row(
//                                       //   mainAxisAlignment:
//                                       //       MainAxisAlignment.start,
//                                       //   children: [
//                                       //     Column(
//                                       //       children: <Widget>[
//                                       //         Container(
//                                       //           // color: Colors.blue,
//                                       //           // width:,

//                                       //           height: 30,
//                                       //           child: Text(
//                                       //             "Email",
//                                       //             style: TextStyle(
//                                       //               fontSize: 15,
//                                       //               fontWeight: FontWeight.bold,
//                                       //             ),
//                                       //           ),
//                                       //         )
//                                       //       ],
//                                       //     )
//                                       //   ],
//                                       // ),
//                                       Row(
//                                         children: [
//                                           Container(
//                                             width: inWidth,
//                                             height: 50,
//                                             decoration: BoxDecoration(
//                                               border: Border.all(
//                                                 color: Colors.grey,
//                                                 width: 1,
//                                                 style: BorderStyle.solid,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(24),
//                                             ),
//                                             padding: EdgeInsets.only(
//                                               top: 5,
//                                             ),
//                                             child: TextFormField(
//                                               // controller: _waController,
//                                               // keyboardType: TextInputType.phone,
//                                               decoration: const InputDecoration(
//                                                 border: InputBorder.none,
//                                                 prefixIcon: Icon(
//                                                   Icons.email,
//                                                   size: 20,
//                                                 ),
//                                                 hintText: 'Email',
//                                               ),
//                                               // validator: (String? value) {
//                                               //   if (value == null ||
//                                               //       value.isEmpty) {
//                                               //     return ' Maukkan Email';
//                                               //   }
//                                               //   return null;
//                                               // },
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       // Row(
//                                       //   mainAxisAlignment:
//                                       //       MainAxisAlignment.start,
//                                       //   children: [
//                                       //     Column(
//                                       //       children: <Widget>[
//                                       //         Container(
//                                       //           // color: Colors.blue,
//                                       //           // width:,

//                                       //           height: 30,
//                                       //           child: Text(
//                                       //             "Password",
//                                       //             style: TextStyle(
//                                       //               fontSize: 15,
//                                       //               fontWeight: FontWeight.bold,
//                                       //             ),
//                                       //           ),
//                                       //         )
//                                       //       ],
//                                       //     )
//                                       //   ],
//                                       // ),
//                                       Row(
//                                         children: [
//                                           Container(
//                                             width: inWidth,
//                                             height: 50,
//                                             decoration: BoxDecoration(
//                                               border: Border.all(
//                                                 color: Colors.grey,
//                                                 width: 1,
//                                                 style: BorderStyle.solid,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(24),
//                                             ),
//                                             padding: EdgeInsets.only(
//                                               top: 5,
//                                             ),
//                                             child: TextFormField(
//                                               // controller: _waController,
//                                               // keyboardType: TextInputType.phone,
//                                               decoration: const InputDecoration(
//                                                 border: InputBorder.none,
//                                                 prefixIcon: Icon(
//                                                   Icons.lock,
//                                                   size: 20,
//                                                 ),
//                                                 hintText: 'Password',
//                                               ),
//                                               // validator: (String? value) {
//                                               //   if (value == null ||
//                                               //       value.isEmpty) {
//                                               //     return ' Maukkan Password';
//                                               //   }
//                                               //   return null;
//                                               // },
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         // color: Colors.amber,
//                                         // width: 150,
//                                         // padding: EdgeInsets.only(right: 20),
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           left: 30),
//                                                   child: InkWell(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: (context) =>
//                                                                 ProfilePage(isRegistered: true,
//                                                                       login:
//                                                                           true,
//                                                                     )),
//                                                       );
//                                                     },
//                                                     child: Row(
//                                                       children: [
//                                                         Icon(
//                                                           Icons.arrow_back,
//                                                           color:
//                                                               Colors.lightBlue,
//                                                         ),
//                                                         Text(
//                                                           "Login",
//                                                           style: TextStyle(
//                                                               fontSize: 15,
//                                                               color: Colors
//                                                                   .lightBlue),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   // width: 100,
//                                   // height: 50,
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           ElevatedButton(
//                                             style: ButtonStyle(
//                                               fixedSize: WidgetStatePropertyAll(
//                                                   Size(inWidth, 30)),
//                                               backgroundColor:
//                                                   MaterialStateProperty.all<
//                                                       Color>(Color(0xFF233d63)),
//                                             ),
//                                             onPressed: () {},
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Text(
//                                                   'Create Account',
//                                                   style: TextStyle(
//                                                       fontSize: 15,
//                                                       color: Colors.white),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               child: Container(
//                                 child: Row(
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Container(
//                                           child: Text("Or"),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           // crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Row(
//                               // mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Container(
//                                   // width: 100,
//                                   // height: 50,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           ElevatedButton(
//                                             style: ButtonStyle(
//                                               fixedSize: WidgetStatePropertyAll(
//                                                   Size(inWidth, 30)),
//                                               backgroundColor:
//                                                   MaterialStateProperty.all<
//                                                       Color>(Colors.white),
//                                             ),
//                                             onPressed: () {},
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: <Widget>[
//                                                 FaIcon(
//                                                   FontAwesomeIcons.google,
//                                                   color: Colors.blue,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text(
//                                                   'Login with Google',
//                                                   style: TextStyle(
//                                                       fontSize: 15,
//                                                       color: Color(0xFF233d63)),
//                                                 ),
//                                                 // Icon(Icons.Google)
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
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
