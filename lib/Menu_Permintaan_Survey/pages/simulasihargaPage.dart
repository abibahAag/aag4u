// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_Permintaan_Survey/widget/SimulasiHargaWidget.dart';
// import 'package:flutter_aag4u/pages/homepage.dart';

// class SimulasiHargaPage extends StatefulWidget {
//   const SimulasiHargaPage(
//       {super.key,
//       required bool isRegistered,
//       required bool login,
//       required bool isLoggedIn});

//   @override
//   State<SimulasiHargaPage> createState() => _SimulasiHargaPageState();
// }

// class _SimulasiHargaPageState extends State<SimulasiHargaPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Sesuaikan warna
//       appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 PageRouteBuilder(
//                   pageBuilder: (context, animation, secondaryAnimation) =>
//                       homePage(
//                     isRegistered: false,
//                     // login: false,
//                     isLoggedIn: false,
//                   ),
//                 ),
//                 (route) => false, // Menghapus semua rute sebelumnya
//               );
//             },
//           ),
//           // automaticallyImplyLeading: true,
//           title: Container(
//             // color: Colors.amber,
//             // height: 300,
//             child: Column(
//               children: [
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           Container(
//                             child: Image.asset(
//                               "images/icons/aagu.png",
//                               height: 100,
//                               width: 100,
//                             ),
//                           ),
//                           // Text(
//                           //   "data",
//                           //   style: TextStyle(color: Colors.black, fontSize: 5),
//                           // )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             Container(
//               // color: Colors.amber,
//               width: 50,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     // crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                           child: Icon(
//                         Icons.refresh,
//                         size: 30,
//                       ))
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ]),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [SimulasiHargaWidget()],
//         ),
//       )),
//       // bottomNavigationBar: HomeBottomNavBar(),
//     );
//   }
// }
