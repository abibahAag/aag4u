// // import 'dart:ffi';

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Blog/BlogPage.dart';
import 'package:flutter_aag4u/Menu_Permintaan_Survey/pages/simulasihargaPage.dart';
import 'package:flutter_aag4u/Menu_Promo/promoPage.dart';
import 'package:flutter_aag4u/pages/profilePage.dart';
import 'package:flutter_aag4u/template/navbar.dart';
import 'package:flutter_aag4u/widgets/BannerWidget.dart';
import 'package:flutter_aag4u/widgets/BlogWidget.dart';
import 'package:flutter_aag4u/widgets/TestimoniWidget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Navbar(),
        // backgroundColor: Color(0xFF233d63),
        // backgroundColor: Colors.white,

        // leading: Container(
        //   color: Colors.amber,
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.only(left: 5, top: 15),
        //         child: Row(
        //           children: [
        //             Container(
        //               child: Icon(
        //                 Icons.menu,
        //                 size: 30,
        //                 color: Colors.white,
        //               ),
        //             )
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // title: Container(
        //   // height: 300,
        //   child: Column(
        //     children: [
        //       Container(
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Column(
        //               children: [
        //                 Container(
        //                   child: Image.asset(
        //                     "images/icons/aagu.png",
        //                     height: 100,
        //                     width: 100,
        //                   ),
        //                 ),
        //                 // Text(
        //                 //   "data",
        //                 //   style: TextStyle(color: Colors.black, fontSize: 5),
        //                 // )
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: _refreshData, // Fungsi refresh
            child: SingleChildScrollView(
              physics:
                  AlwaysScrollableScrollPhysics(), // Agar selalu bisa di-scroll
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BannerWidget(),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            width: 340,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 18,
                                      ),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          // color: Color(0xFFcddcff),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          // Memeriksa status login dari Hive, menunggu hasil dari fungsi async

                                                          var loginBox =
                                                              await Hive.openBox(
                                                                  'loginBox');

                                                          if (loginBox
                                                              .isNotEmpty) {
                                                            // Jika sudah login, arahkan ke halaman SimulasiHargaPage
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        SimulasiHargaPage(
                                                                  isRegistered:
                                                                      true,
                                                                  login: false,
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            // Tampilkan alert jika belum login
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Info'),
                                                                  content: Text(
                                                                      'Harap login terlebih dahulu'),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      child: Text(
                                                                          'OK'),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop(); // Menutup dialog
                                                                        // Arahkan ke halaman login setelah menutup dialog
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                ProfilePage(
                                                                              isRegistered: false,
                                                                              login: false,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              child: Image.asset(
                                                                  "images/icons/simulasi.png"),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Permintaan ",
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      child: Text(" Survey",
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                          )))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      // color: Color(0xFFcddcff),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    BlogPage()),
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            child: Image.asset(
                                                                "images/icons/blog.png")),
                                                        // const SizedBox(height: 5,),
                                                      ],
                                                    ),
                                                  ),
                                                  // child: GestureDetector(
                                                  //   onTap: () {
                                                  //     showDialog(
                                                  //       context: context,
                                                  //       builder: (BuildContext
                                                  //           context) {
                                                  //         return AlertDialog(
                                                  //           title: Text("Info"),
                                                  //           content: Text(
                                                  //               "Coming soon"),
                                                  //           actions: [
                                                  //             TextButton(
                                                  //               child:
                                                  //                   Text("OK"),
                                                  //               onPressed: () {
                                                  //                 Navigator.of(
                                                  //                         context)
                                                  //                     .pop();
                                                  //               },
                                                  //             ),
                                                  //           ],
                                                  //         );
                                                  //       },
                                                  //     );
                                                  //   },
                                                  //   child: Column(
                                                  //     mainAxisAlignment:
                                                  //         MainAxisAlignment
                                                  //             .center,
                                                  //     children: [
                                                  //       Container(
                                                  //           child: Image.asset(
                                                  //               "images/icons/blog.png")),
                                                  //       // const SizedBox(height: 5,),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    child: Text("Blog",
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                        )))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      // color: Color(0xFFcddcff),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Navigator.push(
                                                      //   context,
                                                      //   MaterialPageRoute(
                                                      // builder: (context) => Pekerjaanwidget()),
                                                      // );
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            child: Image.asset(
                                                                "images/icons/survey.png")),
                                                        // const SizedBox(height: 5,),
                                                      ],
                                                    ),
                                                  ),
                                                  //     GestureDetector(
                                                  //   onTap: () {
                                                  //     showDialog(
                                                  //       context: context,
                                                  //       builder:
                                                  //           (BuildContext context) {
                                                  //         return AlertDialog(
                                                  //           title: Text("Info"),
                                                  //           content:
                                                  //               Text("Coming soon"),
                                                  //           actions: [
                                                  //             TextButton(
                                                  //               child: Text("OK"),
                                                  //               onPressed: () {
                                                  //                 Navigator.of(
                                                  //                         context)
                                                  //                     .pop();
                                                  //               },
                                                  //             ),
                                                  //           ],
                                                  //         );
                                                  //       },
                                                  //     );
                                                  //   },
                                                  //   child: Column(
                                                  //     mainAxisAlignment:
                                                  //         MainAxisAlignment.center,
                                                  //     children: [
                                                  //       Container(
                                                  //           child: Image.asset(
                                                  //               "images/icons/survey.png")),
                                                  //       // const SizedBox(height: 5,),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    child: Text("Pekerjaan",
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                        )))
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      // color: Color(0xFFcddcff),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text("Info"),
                                                            content: Text(
                                                                "Coming soon"),
                                                            actions: [
                                                              TextButton(
                                                                child:
                                                                    Text("OK"),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            child: Image.asset(
                                                                "images/icons/notif.png")),
                                                        // const SizedBox(height: 5,),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    child: Text("Info",
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                        )))
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      // color: Color(0xFFcddcff),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                promoPage()),
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            child: Image.asset(
                                                                "images/icons/promo.png")),
                                                        // const SizedBox(height: 5,),
                                                      ],
                                                    ),
                                                  ),

                                                  // child: GestureDetector(
                                                  //   onTap: () {
                                                  //     showDialog(
                                                  //       context: context,
                                                  //       builder:
                                                  //           (BuildContext context) {
                                                  //         return AlertDialog(
                                                  //           title: Text("Info"),
                                                  //           content:
                                                  //               Text("Coming soon"),
                                                  //           actions: [
                                                  //             TextButton(
                                                  //               child: Text("OK"),
                                                  //               onPressed: () {
                                                  //                 Navigator.of(
                                                  //                         context)
                                                  //                     .pop();
                                                  //               },
                                                  //             ),
                                                  //           ],
                                                  //         );
                                                  //       },
                                                  //     );
                                                  //   },
                                                  //   child: Column(
                                                  //     mainAxisAlignment:
                                                  //         MainAxisAlignment.center,
                                                  //     children: [
                                                  //       Container(
                                                  //           child: Image.asset(
                                                  //               "images/icons/promo.png")),
                                                  //       // const SizedBox(height: 5,),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    child: Text("Promo",
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                        )))
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      // color: Color(0xFFcddcff),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text("Info"),
                                                            content: Text(
                                                                "Coming soon"),
                                                            actions: [
                                                              TextButton(
                                                                child:
                                                                    Text("OK"),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            child: Image.asset(
                                                                "images/icons/chat.png")),
                                                        // const SizedBox(height: 5,),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    child: Text("Chat",
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                        )))
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      // color: Color(0xFFcddcff),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text("Info"),
                                                            content: Text(
                                                                "Coming soon"),
                                                            actions: [
                                                              TextButton(
                                                                child:
                                                                    Text("OK"),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            child: Image.asset(
                                                                "images/icons/treat.png")),
                                                        // const SizedBox(height: 5,),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    child: Text("Treatment",
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                        )))
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      // color: Color(0xFFcddcff),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text("Info"),
                                                            content: Text(
                                                                "Coming soon"),
                                                            actions: [
                                                              TextButton(
                                                                child:
                                                                    Text("OK"),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            child: Image.asset(
                                                                "images/icons/lainnya.png")),
                                                        // const SizedBox(height: 5,),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    child: Text("Lainnya",
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                        )))
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Testimoniwidget(),
                  SizedBox(
                    height: 10,
                  ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Blogwidget(),
                ],
              ),
            ),
          ),
        ));
  }
}
