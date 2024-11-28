// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class HomeController extends GetxController {
// //   RxInt indexWiget = 0.obs;

// //   void changeIndexBottomNav(int index) {
// //     indexWiget.value = index;
// //   }
  
// // }

// // Misalkan Anda memiliki sebuah controller untuk mengatur navigasi
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// // Metode untuk mengubah halaman
// void changePage(int index) {
//   switch (index) {
//     case 0:
//       // Ganti dengan halaman yang sesuai dengan indeks 0 (Home)
//       navigatorKey.currentState?.pushReplacementNamed('homePage');
//       // MaterialPageRoute(builder: (context) => HomePage()),
//       break;
//     case 1:
//       // Ganti dengan halaman yang sesuai dengan indeks 1 (Survey)
//       navigatorKey.currentState?.pushReplacementNamed('surveyPage');
//       break;
//     case 2:
//       // Ganti dengan halaman yang sesuai dengan indeks 2 (Promo)
//       navigatorKey.currentState?.pushReplacementNamed('promoPage');
//       break;
//     case 3:
//       // Ganti dengan halaman yang sesuai dengan indeks 3 (Chat)
//       navigatorKey.currentState?.pushReplacementNamed('chatPage');
//       break;
//     case 4:
//       // Ganti dengan halaman yang sesuai dengan indeks 4 (Profile)
//       navigatorKey.currentState?.pushReplacementNamed('profilePage');
//       break;
//     default:
//       break;
//   }
// }

// }