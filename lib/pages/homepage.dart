// import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/berandaPage.dart';
// import 'package:flutter_aag4u/pages/blogPage.dart';
import 'package:flutter_aag4u/pages/chatPage.dart';
import 'package:flutter_aag4u/pages/profilePage.dart';
import 'package:flutter_aag4u/Menu_Promo/promoPage.dart';
import 'package:flutter_aag4u/pages/surveyPage.dart';
import 'package:flutter_aag4u/template/navbar.dart';
import 'package:flutter_aag4u/widgets/SplashScreen.dart';
// import 'package:flutter_aag4u/controllers/homeControllers.dart';
// import 'package:flutter_aag4u/widgets/BennerWidget.dart';
// import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  @override
  State<homePage> createState() => _homePage();
}

class _homePage extends State<homePage> {
  int _selectedTabIndex = 0;
  // String notificationMsg = "waiting for notifications";

@override 
  void _onNavBarTapped(int index){
    setState(() {
        _selectedTabIndex = index;
    });
    // super.initState();
    // FirebaseMessaging.onMessage.listen((event){

    // });
  }

      @override
      Widget build(BuildContext context) {
        final _listPage = <Widget>[
        // const Text("Beranda"),
        berandaPage(),
        // const Text("survey"),
        SurveyPage(),
        // const Text("promo"),
        promoPage(),
        // const Text("chat"),
        ChatPage(),
        // const Text("profile"),
        // ProfilePage(),
        ];

        final _bottonNavBarItems = <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
                    label: "Home",
                    icon: InkWell(
                        
                        child: Icon(
                          Icons.home,
                          // color: index_color == 0 ? Colors.red : Colors.white,
                        ))),
                BottomNavigationBarItem(
                    label: "Survey",
                    icon: InkWell(
                        
                        child: Icon(
                          Icons.assignment,
                          // color: index_color == 1 ? Colors.red : Colors.white,
                        ))),
                BottomNavigationBarItem(
                    label: "Promo",
                    icon: InkWell(
                        
                        child: Icon(
                          Icons.local_offer,
                          // color: index_color == 2 ? Colors.red : Colors.white,
                        ))),
                BottomNavigationBarItem(
                    label: "Chat",
                    icon: InkWell(
                        
                        child: Icon(
                          Icons.chat,
                          // color: index_color == 3 ? Colors.red : Colors.white,
                        ))),
                  ///BOTTOM PROFILE
                // BottomNavigationBarItem(
                //     label: "Profile",
                //     icon: InkWell(
                //         // onTap: () {
                //         //   setState(() {
                //         //     index_color = 4;
                //         //    _navigateWithoutTransition(ProfilePage());
                //         //   });
                //         // },
                //         child: Icon(
                //           Icons.person,
                //           // color: index_color == 4 ? Colors.red : Colors.white,
                //         )
                //     )
                //   ),
          ];
          final _bottomNavBar = BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            items: _bottonNavBarItems,
            currentIndex: _selectedTabIndex,
            unselectedItemColor: Colors.grey ,
            selectedItemColor: const Color(0xFF233d63),
            onTap: _onNavBarTapped,
            );

   
      return Scaffold(
        appBar: Navbar(),

        body: Center(
          child: _listPage[_selectedTabIndex],
        ),

        bottomNavigationBar: _bottomNavBar,
      );
      
         
  }
}





