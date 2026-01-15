// // import 'dart:ffi';

// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_Blog/BlogPage.dart';
// import 'package:flutter_aag4u/Menu_Permintaan_Survey/widget/SimulasiHargaWidget.dart';
// import 'package:flutter_aag4u/Menu_Promo/promoPage.dart';
// import 'package:flutter_aag4u/pages/EventPage.dart';
// import 'package:flutter_aag4u/pages/InfoPage.dart';
// import 'package:flutter_aag4u/pages/LoginPage.dart';
// import 'package:flutter_aag4u/pages/PusatBantuanPage.dart';
// import 'package:flutter_aag4u/pages/TreatmentPage.dart';
// import 'package:flutter_aag4u/widgets/BannerWidget.dart';
// import 'package:flutter_aag4u/widgets/BlogWidget.dart';
// import 'package:flutter_aag4u/widgets/TestimoniWidget.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// // import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';

// class berandaPage extends StatefulWidget {
//   const berandaPage({super.key});
//   @override
//   State<berandaPage> createState() => _berandaPage();
// }

// class _berandaPage extends State<berandaPage> {
//   get controller => null;
//   String notificationMsg = "waiting for notifications";

//   Future<void> _refreshData() async {
//     setState(() {});
//   }

//   Future<void> _saveUrlToHive(String url) async {
//     final loginBox = Hive.box('loginBox');
//     await loginBox.put('url', url); // Simpan URL ke Hive box
//   }

//   Map payload = {};
//   @override
//   Widget build(BuildContext context) {
//     final data = ModalRoute.of(context)!.settings.arguments;
//     if (data is RemoteMessage) {
//       payload = data.data;
//     }

//     if (data is NotificationResponse) {
//       payload = jsonDecode(data.payload!);
//     }

//     //  to listen to any notification clicked or not
//     // listenToNotifications() {
//     //   print("Listening to notification");
//     //   LocalNotifications.onClickNotification.stream.listen((event) {
//     //     print(event);
//     //     Navigator.pushNamed(context, '/PromoPage', arguments: event);
//     //   });
//     // }

//     // void listenToNotifications() {
//     //   LocalNotifications.onClickNotification.stream.listen((payload) {
//     //     Navigator.pushNamed(context, '/PromoPage', arguments: payload);
//     //   });
//     // }

//     final loginBox = Hive.box('loginBox');
//     final userEmail =
//         loginBox.get('email', defaultValue: 'unknown@example.com');

//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Center(
//             child: Container(
//               // alignment: Alignment.center,
//               // color: Colors.amber,
//               child: Image.asset(
//                 "images/icons/aag.png",
//                 // alignment: Alignment.center,
//                 height: 70,
//                 width: 70,
//               ),
//             ),
//           ),
//         ),
//         body: SafeArea(
//           child: RefreshIndicator(
//             onRefresh: _refreshData, // Fungsi refresh
//             child: SingleChildScrollView(
//               physics:
//                   AlwaysScrollableScrollPhysics(), // Agar selalu bisa di-scroll
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   BannerWidget(),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10, right: 10),
//                           child: Container(
//                             width: 340,
//                             height: 200,
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                         top: 18,
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           Column(
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Container(
//                                                       width: 50,
//                                                       height: 50,
//                                                       decoration: BoxDecoration(
//                                                           // color: Color(0xFFcddcff),
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10)),
//                                                       child: InkWell(
//                                                         onTap: () async {
//                                                           // Memeriksa status login dari Hive, menunggu hasil dari fungsi async

//                                                           var loginBox =
//                                                               await Hive.openBox(
//                                                                   'loginBox');
//                                                           if (loginBox
//                                                               .isEmpty) {
//                                                             // Jika sudah login, arahkan ke halaman SimulasiHargaPage
//                                                             Navigator.push(
//                                                               context,
//                                                               MaterialPageRoute(
//                                                                 builder:
//                                                                     (context) =>
//                                                                         SimulasiHargaWidget(
//                                                                   isRegistered:
//                                                                       false,
//                                                                   login: false,
//                                                                   isLoggedIn:
//                                                                       false,
//                                                                   url:
//                                                                       "SimulasiHargaPage",
//                                                                 ),
//                                                               ),
//                                                             );
//                                                           } else {
//                                                             await _saveUrlToHive(
//                                                                 'SimulasiHargaPage');

//                                                             Navigator.push(
//                                                               context,
//                                                               MaterialPageRoute(
//                                                                 builder:
//                                                                     (context) =>
//                                                                         LoginPage(
//                                                                   isRegistered:
//                                                                       false,
//                                                                   login: false,
//                                                                   id: '1',
//                                                                   url:
//                                                                       'SimulasiHargaPage',
//                                                                   judul: '',
//                                                                   category: '',
//                                                                   gambar: '',
//                                                                   tgl: '',
//                                                                   akhir: '',
//                                                                   tempat: '',
//                                                                   mulai: '',
//                                                                 ),
//                                                               ),
//                                                             );
//                                                           }
//                                                         },
//                                                         child: Column(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .center,
//                                                           children: [
//                                                             Container(
//                                                               child: Image.asset(
//                                                                   "images/icons/survey.png"),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       )),
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Container(
//                                                     child: Text(
//                                                       "Permintaan ",
//                                                       style: TextStyle(
//                                                         fontSize: 11,
//                                                       ),
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Container(
//                                                       child: Text(" Survey",
//                                                           style: TextStyle(
//                                                             fontSize: 11,
//                                                           )))
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 30,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   width: 50,
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                       // color: Color(0xFFcddcff),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10)),
//                                                   child: InkWell(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder:
//                                                                 (context) =>
//                                                                     BlogPage()),
//                                                       );
//                                                     },
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Container(
//                                                             child: Image.asset(
//                                                                 "images/icons/blog.png")),
//                                                         // const SizedBox(height: 5,),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   // child: GestureDetector(
//                                                   //   onTap: () {
//                                                   //     showDialog(
//                                                   //       context: context,
//                                                   //       builder: (BuildContext
//                                                   //           context) {
//                                                   //         return AlertDialog(
//                                                   //           title: Text("Info"),
//                                                   //           content: Text(
//                                                   //               "Coming soon"),
//                                                   //           actions: [
//                                                   //             TextButton(
//                                                   //               child:
//                                                   //                   Text("OK"),
//                                                   //               onPressed: () {
//                                                   //                 Navigator.of(
//                                                   //                         context)
//                                                   //                     .pop();
//                                                   //               },
//                                                   //             ),
//                                                   //           ],
//                                                   //         );
//                                                   //       },
//                                                   //     );
//                                                   //   },
//                                                   //   child: Column(
//                                                   //     mainAxisAlignment:
//                                                   //         MainAxisAlignment
//                                                   //             .center,
//                                                   //     children: [
//                                                   //       Container(
//                                                   //           child: Image.asset(
//                                                   //               "images/icons/blog.png")),
//                                                   //       // const SizedBox(height: 5,),
//                                                   //     ],
//                                                   //   ),
//                                                   // ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                     child: Text("Blog",
//                                                         style: TextStyle(
//                                                           fontSize: 11,
//                                                         )))
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       width: 30,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   width: 50,
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                       // color: Color(0xFFcddcff),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10)),
//                                                   child: InkWell(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: (context) =>
//                                                                 TreatmentPage()),
//                                                       );
//                                                     },
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Container(
//                                                             child: Image.asset(
//                                                                 "images/icons/treat.png")),
//                                                         // const SizedBox(height: 5,),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                     child: Text("Treatment",
//                                                         style: TextStyle(
//                                                           fontSize: 11,
//                                                         )))
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       width: 30,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   width: 50,
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                       // color: Color(0xFFcddcff),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10)),
//                                                   child: InkWell(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder:
//                                                                 (context) =>
//                                                                     InfoPage()),
//                                                       );
//                                                     },
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Container(
//                                                             child: Image.asset(
//                                                                 "images/icons/notif.png")),
//                                                         // const SizedBox(height: 5,),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                     child: Text("Info",
//                                                         style: TextStyle(
//                                                           fontSize: 11,
//                                                         )))
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   width: 50,
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                       // color: Color(0xFFcddcff),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10)),
//                                                   child: InkWell(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: (context) =>
//                                                                 PromoPage()),
//                                                       );
//                                                     },
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Container(
//                                                             child: Image.asset(
//                                                                 "images/icons/promo.png")),
//                                                         // const SizedBox(height: 5,),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                     child: Text("Promo",
//                                                         style: TextStyle(
//                                                           fontSize: 11,
//                                                         )))
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       width: 35,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   width: 50,
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                       // color: Color(0xFFcddcff),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10)),
//                                                   child: InkWell(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: (context) =>
//                                                                 Pusatbantuanpage()),
//                                                       );
//                                                     },
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Container(
//                                                             child: Image.asset(
//                                                                 "images/icons/bantuan.png")),
//                                                         // const SizedBox(height: 5,),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                     child: Text("Bantuan",
//                                                         style: TextStyle(
//                                                           fontSize: 11,
//                                                         )))
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       width: 35,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   width: 50,
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                       // color: Color(0xFFcddcff),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10)),
//                                                   child: InkWell(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: (context) =>
//                                                                 EventPage()),
//                                                       );
//                                                     },
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Container(
//                                                             child: Image.asset(
//                                                                 "images/icons/event.png")),
//                                                         // const SizedBox(height: 5,),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                     child: Text("Event",
//                                                         style: TextStyle(
//                                                           fontSize: 11,
//                                                         )))
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       width: 30,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                   width: 50,
//                                                   height: 50,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10)),
//                                                   child: GestureDetector(
//                                                     onTap: () {
//                                                       showModalBottomSheet(
//                                                         context: context,
//                                                         isScrollControlled:
//                                                             true,
//                                                         shape:
//                                                             const RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .vertical(
//                                                             top:
//                                                                 Radius.circular(
//                                                                     30),
//                                                           ),
//                                                         ),
//                                                         builder: (BuildContext
//                                                             context) {
//                                                           return DraggableScrollableSheet(
//                                                             expand: false,
//                                                             builder: (BuildContext
//                                                                     context,
//                                                                 ScrollController
//                                                                     scrollController) {
//                                                               return AnimatedContainer(
//                                                                 duration: Duration(
//                                                                     milliseconds:
//                                                                         1300),
//                                                                 curve: Curves
//                                                                     .easeInOut,
//                                                                 // padding: EdgeInsets
//                                                                 //     .only(
//                                                                 //         top:
//                                                                 //             50),
//                                                                 width: 500,
//                                                                 decoration:
//                                                                     BoxDecoration(
//                                                                   color: Colors
//                                                                       .white,
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .vertical(
//                                                                     top: Radius
//                                                                         .circular(
//                                                                             30),
//                                                                   ),
//                                                                 ),
//                                                                 child:
//                                                                     SingleChildScrollView(
//                                                                   controller:
//                                                                       scrollController,
//                                                                   child: Column(
//                                                                     children: [
//                                                                       Row(
//                                                                         mainAxisAlignment:
//                                                                             MainAxisAlignment.center,
//                                                                         children: [
//                                                                           Padding(
//                                                                             padding:
//                                                                                 const EdgeInsets.only(top: 20),
//                                                                             child:
//                                                                                 Container(
//                                                                               decoration: BoxDecoration(
//                                                                                 // color: const Color.fromARGB(255, 180, 6, 6),
//                                                                                 borderRadius: BorderRadius.vertical(
//                                                                                   top: Radius.circular(30),
//                                                                                 ),
//                                                                               ),
//                                                                               width: 350,
//                                                                               height: 600,
//                                                                               child: Column(
//                                                                                 mainAxisAlignment: MainAxisAlignment.start,
//                                                                                 children: <Widget>[
//                                                                                   Text(
//                                                                                     'Coming Soon',
//                                                                                     style: TextStyle(fontSize: 35),
//                                                                                   ),
//                                                                                   SizedBox(height: 20.0),
//                                                                                   ElevatedButton(
//                                                                                     onPressed: () {
//                                                                                       Navigator.pop(context);
//                                                                                     },
//                                                                                     child: Text('Close'),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               );
//                                                             },
//                                                           );
//                                                         },
//                                                       );
//                                                     },
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Image.asset(
//                                                             "images/icons/lainnya.png"),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Text(
//                                                   "Lainnya",
//                                                   style: TextStyle(
//                                                     fontSize: 11,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     // Lainnyawidget(),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),

//                   Testimoniwidget(),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   // BANNER IKLAN AAG4U //
//                   Container(
//                     child: Column(
//                       children: [
//                         Image.asset(
//                           "images/iklan/iklan.jpg",
//                           // width: 300,
//                           // height: 100,
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Blogwidget(),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }

// // import 'dart:ffi';

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Blog/BlogPage.dart';
import 'package:flutter_aag4u/Menu_Permintaan_Survey/widget/SimulasiHargaWidget.dart';
import 'package:flutter_aag4u/Menu_Promo/MenuPromoPage.dart';
import 'package:flutter_aag4u/pages/EventPage.dart';
import 'package:flutter_aag4u/pages/InfoPage.dart';
import 'package:flutter_aag4u/pages/PusatBantuanPage.dart';
import 'package:flutter_aag4u/pages/TreatmentPage.dart';
import 'package:flutter_aag4u/pages/profilePage.dart';
import 'package:flutter_aag4u/widgets/BannerWidget.dart';
import 'package:flutter_aag4u/widgets/BlogWidget.dart';
import 'package:flutter_aag4u/widgets/TestimoniWidget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Menu_Permintaan_Survey/widget/SurveyResultWidget.dart';

// import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';

class berandaPage extends StatefulWidget {
  const berandaPage({super.key});
  @override
  State<berandaPage> createState() => _berandaPage();
}

class _berandaPage extends State<berandaPage> {
  get controller => null;
  String notificationMsg = "waiting for notifications";

  Future<void> _refreshData() async {
    setState(() {});
  }

  Future<void> _saveUrlToHive(String url) async {
    final loginBox = Hive.box('loginBox');
    await loginBox.put('url', url); // Simpan URL ke Hive box
  }

  Map payload = {};
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
    if (data is RemoteMessage) {
      payload = data.data;
    }

    if (data is NotificationResponse) {
      payload = jsonDecode(data.payload!);
    }


    @override
    void initState() {
      super.initState();
      // final box = Hive.box('loginBox');
      // box.delete('after_login');
      
    }

    //  to listen to any notification clicked or not
    // listenToNotifications() {
    //   print("Listening to notification");
    //   LocalNotifications.onClickNotification.stream.listen((event) {
    //     print(event);
    //     Navigator.pushNamed(context, '/PromoPage', arguments: event);
    //   });
    // }

    // void listenToNotifications() {
    //   LocalNotifications.onClickNotification.stream.listen((payload) {
    //     Navigator.pushNamed(context, '/PromoPage', arguments: payload);
    //   });
    // }

    final loginBox = Hive.box('loginBox');
    final userEmail =
        loginBox.get('email', defaultValue: 'unknown@example.com');

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth;
    double containerHeight = screenWidth;
    double icon = MediaQuery.of(context).size.width;
    double pontSize = MediaQuery.of(context).size.width;
    double spacing = screenWidth * 0.02;
    double spacinga = screenWidth * 0.04;

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          extendBodyBehindAppBar:
              true, // Biarkan AppBar menyatu dengan bagian atas layar

          appBar: AppBar(
            backgroundColor: Colors.white,
            // toolbarHeight: screenWidth * 0.5,

            title: Center(
              child: Container(
                // alignment: Alignment.center,
                // color: Colors.amber,
                child: Image.asset(
                  "images/icons/aag.png",
                  alignment: Alignment.center,
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.1,
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: _refreshData,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BannerWidget(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      width: containerWidth,
                      height: containerHeight * 0.52,
                      // height: containerHeight * 0.52,
                      decoration: BoxDecoration(
                        // color: const Color.fromARGB(255, 41, 4, 251),
                        // color: const Color.fromARGB(125, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: spacing,
                            runSpacing: spacinga,
                            children: [
                              // _buildMenuItem(
                              //   context,
                              //     iconPath: "images/icons/survey.png",
                              //     label: "Permintaan\n Survey",
                              //     onTap: () async {
                              //   var loginBox = await Hive.openBox('loginBox');
                              //   var email = loginBox.get('email');

                              //   if (email == null) {
                              //     await _saveUrlToHive('SimulasiHargaPage');

                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => ProfilePage(
                              //           isRegistered: false,
                              //           login: false,
                              //           // id: '1',
                              //           // url: 'SimulasiHargaPage',
                              //           // judul: '',
                              //           // category: '',
                              //           // gambar: '',
                              //           // tgl: '',
                              //           // akhir: '',
                              //           // tempat: '',
                              //           // mulai: '',
                              //         ),
                              //       ),
                              //     );
                              //     // Navigator.push(
                              //     //   context,
                              //     //   MaterialPageRoute(
                              //     //     builder: (context) => LoginPage(
                              //     //       isRegistered: false,
                              //     //       login: false,
                              //     //       id: '1',
                              //     //       url: 'SimulasiHargaPage',
                              //     //       judul: '',
                              //     //       category: '',
                              //     //       gambar: '',
                              //     //       tgl: '',
                              //     //       akhir: '',
                              //     //       tempat: '',
                              //     //       mulai: '',
                              //     //     ),
                              //     //   ),
                              //     // );
                              //   } else {
                              //     // Navigator.pushNamed(
                              //     //     context, '/simulasiHarga');
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               SimulasiHargaWidget(
                              //                 isRegistered: false,
                              //                 login: false,
                              //                 isLoggedIn: false,
                              //                 url: 'SimulasiHargaPage',
                              //               )),
                              //     );
                              //   }

                              // },
                              //   iconSize:
                              //     MediaQuery.of(context).size.width > 750
                              //             ? icon * 0.10 // Tablet
                              //             : icon * 0.13, // HP,
                              //   fontSize: pontSize,
                              //   containerWidth: containerWidth,
                              //   containerHeight: containerHeight
                              // ),

                              _buildMenuItem(
                                context,
                                iconPath: "images/icons/survey.png",
                                label: "Permintaan\nSurvey",
                                onTap: () {
                                  final box = Hive.box('loginBox');
                                  final email = box.get('email');

                                  if (email == null) {
                                    // SIMPAN TUJUAN
                                    box.put('after_login', 'survey');

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ProfilePage(
                                          isRegistered: false,
                                          login: false,
                                        ),
                                      ),
                                    );
                                  } else {
                                    // LANGSUNG KE SURVEY
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const SimulasiHargaWidget(
                                          isRegistered: false,
                                          login: false,
                                          isLoggedIn: true,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                iconSize:
                                    MediaQuery.of(context).size.width > 750
                                        ? icon * 0.10
                                        : icon * 0.13,
                                fontSize: pontSize,
                                containerWidth: containerWidth,
                                containerHeight: containerHeight,
                              ),

                              _buildMenuItem(context,
                                  iconPath: "images/icons/blog.png",
                                  label: "Blog", onTap: () {
                                // Navigator.pushNamed(context, '/blog');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlogPage()));
                                //
                              },
                                  iconSize:
                                      MediaQuery.of(context).size.width > 800
                                          ? icon * 0.10 // Tablet
                                          : icon * 0.13, // HP,,
                                  fontSize: pontSize,
                                  containerWidth: containerWidth,
                                  containerHeight: containerHeight),
                              _buildMenuItem(context,
                                  iconPath: "images/icons/treat.png",
                                  label: "Treatment", onTap: () {
                                // Navigator.pushNamed(context, '/treatment');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TreatmentPage()),
                                );
                              },
                                  iconSize:
                                      MediaQuery.of(context).size.width > 800
                                          ? icon * 0.10 // Tablet
                                          : icon * 0.13, // HP,,
                                  fontSize: pontSize,
                                  containerWidth: containerWidth,
                                  containerHeight: containerHeight),
                              _buildMenuItem(context,
                                  iconPath: "images/icons/notif.png",
                                  label: "Info", onTap: () {
                                // Navigator.pushNamed(context, '/info');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InfoPage(
                                          // pdfUrl:
                                          //     'https://app.aag4u.co.id/public/Compro-AAG.pdf',
                                          )),
                                );
                              },
                                  iconSize:
                                      MediaQuery.of(context).size.width > 800
                                          ? icon * 0.10 // Tablet
                                          : icon * 0.13, // HP,,
                                  fontSize: pontSize,
                                  containerWidth: containerWidth,
                                  containerHeight: containerHeight),
                              _buildMenuItem(context,
                                  iconPath: "images/icons/promo.png",
                                  label: "Promo", onTap: () {
                                // Navigator.pushNamed(context, '/Promo');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Menupromopage()),
                                );
                              },
                                  iconSize:
                                      MediaQuery.of(context).size.width > 800
                                          ? icon * 0.10 // Tablet
                                          : icon * 0.13, // HP,,
                                  fontSize: pontSize,
                                  containerWidth: containerWidth,
                                  containerHeight: containerHeight),
                              _buildMenuItem(context,
                                  iconPath: "images/icons/bantuan.png",
                                  label: "Bantuan", onTap: () {
                                // Navigator.pushNamed(context, '/Bantuan');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pusatbantuanpage()),
                                );
                              },
                                  iconSize:
                                      MediaQuery.of(context).size.width > 800
                                          ? icon * 0.10 // Tablet
                                          : icon * 0.13, // HP,,
                                  fontSize: pontSize,
                                  containerWidth: containerWidth,
                                  containerHeight: containerHeight),
                              _buildMenuItem(context,
                                  iconPath: "images/icons/event.png",
                                  label: "Event", onTap: () {
                                // Navigator.pushNamed(context, '/Event');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EventPage()),
                                );
                              },
                                  iconSize:
                                      MediaQuery.of(context).size.width > 800
                                          ? icon * 0.10 // Tablet
                                          : icon * 0.13, // HP,,
                                  fontSize: pontSize,
                                  containerWidth: containerWidth,
                                  containerHeight: containerHeight),
                              _buildMenuItem(context,
                                  iconPath: "images/icons/lainnya.png",
                                  label: "Lainnya",
                                  // onTap: () {
                                  //   // Navigator.pushNamed(context, '/Event');
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => EventResult(
                                  //               EventId: 3, dated: '',
                                  //               // id: 1,
                                  //               // url: 'EventPageForm',
                                  //               // judul:
                                  //               //     'Kesadaran Tentang Hama di sekitar kita',
                                  //               // category: 'Pest Awareness',
                                  //               // email: 'admin@aag4u.co.id',
                                  //             )),
                                  //   );
                                  // },
                                  onTap: () {
                                // Navigator.pushNamed(context, '/Event');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SurveyResultWidget(
                                            surveyId: 278,
                                          )),
                                );
                              },
                                  //     onTap: () {
                                  //   showModalBottomSheet(
                                  //     context: context,
                                  //     isScrollControlled:
                                  //         true, // Modal bisa full screen
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.vertical(
                                  //           top: Radius.circular(20)),
                                  //     ),
                                  //     builder: (context) {
                                  //       return LayoutBuilder(
                                  //         builder: (context, constraints) {
                                  //           double screenWidth =
                                  //               MediaQuery.of(context).size.width;
                                  //           double screenHeight =
                                  //               MediaQuery.of(context).size.height;

                                  //           return FractionallySizedBox(
                                  //             widthFactor: screenWidth > 800
                                  //                 ? 1.5
                                  //                 : 1, // Jika layar besar, 50% dari layar, jika kecil 100%

                                  //             child: DraggableScrollableSheet(
                                  //               initialChildSize:
                                  //                   0.4, // Awalnya 40% dari layar
                                  //               minChildSize: 0.2, // Minimal 20%
                                  //               maxChildSize: 0.9, // Maksimal 90%
                                  //               expand: false,
                                  //               builder:
                                  //                   (context, scrollController) {
                                  //                 return Container(
                                  //                   padding: EdgeInsets.all(16),
                                  //                   decoration: BoxDecoration(
                                  //                     color: Colors.white,
                                  //                     borderRadius:
                                  //                         BorderRadius.vertical(
                                  //                             top: Radius.circular(
                                  //                                 20)),
                                  //                   ),
                                  //                   child: Column(
                                  //                     mainAxisSize:
                                  //                         MainAxisSize.min,
                                  //                     children: [
                                  //                       Center(
                                  //                         child: Container(
                                  //                           width: 40,
                                  //                           height: 5,
                                  //                           decoration:
                                  //                               BoxDecoration(
                                  //                             color:
                                  //                                 Colors.grey[400],
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(10),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       SizedBox(height: 10),
                                  //                       Text(
                                  //                         "Menu Lainnya",
                                  //                         textAlign:
                                  //                             TextAlign.center,
                                  //                         style: TextStyle(
                                  //                             fontSize: MediaQuery.of(
                                  //                                         context)
                                  //                                     .size
                                  //                                     .width *
                                  //                                 0.05,
                                  //                             fontWeight:
                                  //                                 FontWeight.bold),
                                  //                       ),
                                  //                       SizedBox(height: 30),
                                  //                       Expanded(
                                  //                           child: Text(
                                  //                         "Coming Soon",
                                  //                         style: TextStyle(
                                  //                           fontSize: MediaQuery.of(
                                  //                                       context)
                                  //                                   .size
                                  //                                   .width *
                                  //                               0.09,
                                  //                         ),
                                  //                       )
                                  //                           // ListView(
                                  //                           //   controller:
                                  //                           //       scrollController, // Bisa di-scroll
                                  //                           //   children: [
                                  //                           //     _buildResponsiveListTile(
                                  //                           //       context,
                                  //                           //       Icons.settings,
                                  //                           //       "Coming sooon",
                                  //                           //       '/Settings',
                                  //                           //     ),
                                  //                           //     _buildResponsiveListTile(
                                  //                           //       context,
                                  //                           //       Icons.info,
                                  //                           //       "Tentang Aplikasi",
                                  //                           //       '/About',
                                  //                           //     ),
                                  //                           //     _buildResponsiveListTile(
                                  //                           //       context,
                                  //                           //       Icons.exit_to_app,
                                  //                           //       "Keluar",
                                  //                           //       null, // Or your logout action
                                  //                           //     ),
                                  //                           //   ],
                                  //                           // ),
                                  //                           ),
                                  //                     ],
                                  //                   ),
                                  //                 );
                                  //               },
                                  //             ),
                                  //           );
                                  //         },
                                  //       );
                                  //     },
                                  //   );
                                  // },
                                  iconSize:
                                      MediaQuery.of(context).size.width > 800
                                          ? icon * 0.10 // Tablet
                                          : icon * 0.13, // HP,,
                                  fontSize: pontSize,
                                  containerWidth: containerWidth,
                                  containerHeight: containerHeight),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Testimoniwidget(),
                    SizedBox(height: 20),
                    // BANNER IKLAN AAG4U //
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            "images/iklan/iklan.jpg",
                            // width: 300,
                            // height: 100,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Blogwidget(),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String iconPath,
    required String label,
    required VoidCallback onTap,
    required double iconSize,
    required double fontSize,
    required double containerHeight,
    required double containerWidth,
  }) {
    return Container(
      width: containerWidth * 0.2, //  Lebar tetap agar semua sejajar
      height: containerHeight * 0.23,
      // padding: EdgeInsets.only(), //  Padding agar lebih estetis
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 255, 255, 255), //  Ganti warna sesuai tema
        borderRadius: BorderRadius.circular(12), //  Sudut melengkung
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: iconSize,
              height: iconSize,
              decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 10, 206, 36),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                iconPath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 5), //  Jarak antara ikon dan teks
          SizedBox(
            // width: iconSize * 1.2, //  Pastikan lebar teks konsisten
            child: Text(
              label,
              style: TextStyle(
                // fontSize: MediaQuery.of(context).size.width * 0.035,
                fontSize: MediaQuery.of(context).size.width > 750
                    ? fontSize * 0.03 // Tablet
                    : fontSize * 0.03, // HP,
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

// Helper function to build responsive ListTile
  Widget _buildResponsiveListTile(
      BuildContext context, IconData icon, String title, String? routeName) {
    double iconSize =
        MediaQuery.of(context).size.width * 0.06; // Adjust 0.06 as needed
    double fontSize = MediaQuery.of(context).size.width * 0.05;

    return ListTile(
      leading: Icon(
        icon,
        // size: iconSize, // Make the icon responsive
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        if (routeName != null) {
          Navigator.pushNamed(context, routeName);
        } else {
          // Handle logout or other actions
        }
      },
    );
  }
}
