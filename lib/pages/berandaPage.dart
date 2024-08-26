// // import 'dart:ffi';

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Blog/BlogPage.dart';
import 'package:flutter_aag4u/Menu_Permintaan_Survey/pages/simulasihargaPage.dart';
import 'package:flutter_aag4u/Menu_Promo/MenuPromoPage.dart';
import 'package:flutter_aag4u/widgets/BannerWidget.dart';
import 'package:flutter_aag4u/widgets/BlogWidget.dart';
import 'package:flutter_aag4u/widgets/TestimoniWidget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';

class berandaPage extends StatefulWidget {
  const berandaPage({super.key});
  @override
  State<berandaPage> createState() => _berandaPage();
}

class _berandaPage extends State<berandaPage> {
  get controller => null;
  String notificationMsg = "waiting for notifications";

  //  @override
  // void iniState(int index) {
  //   super.initState();

  //   LocalNotificationsService.initilize();

  //   ///Terminated State
  //   FirebaseMessaging.instance.getInitialMessage().then((event){
  //     if (event != null) {
  //     setState(() {
  //       notificationMsg = "${event!.notification!.title} ${event.notification!.body} I am coming from terminated state";
  //     });
  //     }
  //   });

  //   ///Foregrand State
  //   FirebaseMessaging.onMessage.listen((event) {
  //     LocalNotificationsService.showNotificationOnForeground(event);
  //     setState(() {
  //       notificationMsg = "${event.notification!.title} ${event.notification!.body} I am coming forground";
  //     });
  //   });

  //   ///Background State
  //   FirebaseMessaging.onMessageOpenedApp.listen((event ) {
  //     setState(() {
  //       notificationMsg = "${event.notification!.title} ${event.notification!.body} I am coming background";
  //     });

  //   });

  // }

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
      // appBar: Navbar(),
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
        // notificationMsg;
        child: SingleChildScrollView(
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
                        // color: Colors.amber,
                        width: 340,
                        height: 200,
                        //  width: MediaQuery.of(context).size.width * 0.5,
                        // height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 27, 21, 210),
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
                                                        BorderRadius.circular(
                                                            10)),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SimulasiHargaPage()),
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          child: Image.asset(
                                                              "images/icons/simulasi.png")),
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
                                                        builder: (context) =>
                                                            BlogPage()),
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                              child: GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text("Info"),
                                                        content:
                                                            Text("Coming soon"),
                                                        actions: [
                                                          TextButton(
                                                            child: Text("OK"),
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
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        child: Image.asset(
                                                            "images/icons/survey.png")),
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
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text("Info"),
                                                        content:
                                                            Text("Coming soon"),
                                                        actions: [
                                                          TextButton(
                                                            child: Text("OK"),
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
                                                      MainAxisAlignment.center,
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
                                                            MenuPromoPage()),
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text("Info"),
                                                        content:
                                                            Text("Coming soon"),
                                                        actions: [
                                                          TextButton(
                                                            child: Text("OK"),
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
                                                      MainAxisAlignment.center,
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
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text("Info"),
                                                        content:
                                                            Text("Coming soon"),
                                                        actions: [
                                                          TextButton(
                                                            child: Text("OK"),
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
                                                      MainAxisAlignment.center,
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
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text("Info"),
                                                        content:
                                                            Text("Coming soon"),
                                                        actions: [
                                                          TextButton(
                                                            child: Text("OK"),
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
                                                      MainAxisAlignment.center,
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
    );
  }
}





      // bottomNavigationBar: HomeBottomNavBar(),
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(20.0),
      //     topRight: Radius.circular(20.0),
      //   ),
      //   child: BottomNavigationBar(
      //     showSelectedLabels: true,
      //     showUnselectedLabels: true,
      //     type: BottomNavigationBarType.fixed,
      //     selectedFontSize: 10,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.white,
      //     backgroundColor: Color(0xFF233d63),

      //     items: [
      //       BottomNavigationBarItem(
      //           label: "Home",
      //           icon: InkWell(
      //               onTap: () {
      //                 setState(() {
      //                   index_color = 0;
      //                   _navigateWithoutTransition(homePage());
      //                 });

      //               },
      //               child: Icon(
      //                 Icons.home,
      //                 color: index_color == 0 ? Colors.red : Colors.white,
      //               ))),
      //       BottomNavigationBarItem(
      //           label: "Survey",
      //           icon: InkWell(
      //               onTap: () {
      //                 setState(() {
      //                   index_color = 1;
      //                   _navigateWithoutTransition(SurveyPage());
      //                 });
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => const SurveyPage(),
      //                     // Pass the arguments as part of the RouteSettings. The
      //                     // DetailScreen reads the arguments from these settings.
      //                   ),
      //                 );
      //               },
      //               child: Icon(
      //                 Icons.assignment,
      //                 color: index_color == 1 ? Colors.red : Colors.white,
      //               ))),
      //       BottomNavigationBarItem(
      //           label: "Promo",
      //           icon: InkWell(
      //               onTap: () {
      //                 setState(() {
      //                   index_color = 2;
      //                   _navigateWithoutTransition(promoPage());
      //                 });
      //               },
      //               child: Icon(
      //                 Icons.local_offer,
      //                 color: index_color == 2 ? Colors.red : Colors.white,
      //               ))),
      //       BottomNavigationBarItem(
      //           label: "Chat",
      //           icon: InkWell(
      //               onTap: () {
      //                 setState(() {
      //                   index_color = 3;
      //                  _navigateWithoutTransition(ChatPage());
      //                 });
      //               },
      //               child: Icon(
      //                 Icons.chat,
      //                 color: index_color == 3 ? Colors.red : Colors.white,
      //               ))),
      //       BottomNavigationBarItem(
      //           label: "Profile",
      //           icon: InkWell(
      //               onTap: () {
      //                 setState(() {
      //                   index_color = 4;
      //                  _navigateWithoutTransition(ProfilePage());
      //                 });
      //               },
      //               child: Icon(
      //                 Icons.person,
      //                 color: index_color == 4 ? Colors.red : Colors.white,
      //               ))),
      //     ],
      //   ),
      // ),
    // );

    //   body: SafeArea(

    //                 child: SingleChildScrollView(
    //                   scrollDirection: Axis.horizontal,
    //                   child:
    //                     Row(
    //                       children: [
    //                         // for (int i = 1; i < 5; i++)
    //                         Container(
    //                           margin: EdgeInsets.only(top: 5, bottom: 5, right: 5),
    //                           padding: EdgeInsets.symmetric(horizontal: 5),

    //                           child: Row(
    //                             children: [
    //                               Stack(
    //                                 alignment: Alignment.center,
    //                                 children: [

    //                                   Image.asset("images/benner1.png",
    //                                   height: 150,
    //                                   width:490,
    //                                   fit: BoxFit.contain,
    //                                   ),
    //                                 ],
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                         Container(
    //                               margin: EdgeInsets.only(top: 5, bottom: 5, right: 0),
    //                               padding: EdgeInsets.symmetric(horizontal: 5),
    //                               // height: 180,

    //                               child: Row(
    //                                 children: [
    //                                   Stack(
    //                                     alignment: Alignment.center,
    //                                     children: [

    //                                       Image.asset(
    //                                         "images/benner3.png",
    //                                         height: 150,
    //                                         width: 490,
    //                                         fit: BoxFit.contain,
    //                                       ),
    //                                     ],
    //                                   ),

    //                                 ],
    //                               ),
    //                             ),
    //                         Container(
    //                               margin: EdgeInsets.only(top: 5, bottom: 5, right: 0),
    //                               padding: EdgeInsets.symmetric(horizontal: 5),
    //                               // height: 180,

    //                               child: Row(
    //                                 children: [
    //                                   Stack(
    //                                     alignment: Alignment.center,
    //                                     children: [

    //                                       Image.asset(
    //                                         "images/benner2.png",
    //                                         height: 150,
    //                                         width: 490,
    //                                         fit: BoxFit.contain,
    //                                       ),
    //                                     ],
    //                                   ),

    //                                 ],
    //                               ),
    //                             ),

    //                       ],
    //                     ),

    //                 ),

    //               ),
    //               // SizedBox(height: 10,),

    //           // Row(
    //           //   children: [
    //           //     Container(
    //           //       child: Column(
    //           //         children: [
    //           //           Padding(
    //           //             padding: EdgeInsets.all(8),
    //           //             child: Row(
    //           //               children: [
    //           //                 Container(
    //           //                   child: Icon(Icons.home),
    //           //                 )
    //           //               ],
    //           //             ),
    //           //           )
    //           //         ],
    //           //       ),
    //           //     )
    //           //   ],
    //           // )

    // );
//   }
// }
