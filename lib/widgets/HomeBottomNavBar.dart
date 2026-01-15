

// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/pages/chatPage.dart';
// import 'package:flutter_aag4u/pages/homepage.dart';
// import 'package:flutter_aag4u/pages/profilePage.dart';
// import 'package:flutter_aag4u/pages/promoPage.dart';
// import 'package:flutter_aag4u/pages/surveyPage.dart';
// // import 'package:flutter_icons/flutter_icons.dart';

// class HomeBottomNavBar extends StatefulWidget {
//   const HomeBottomNavBar({super.key});

//   @override
//   State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
// }

// class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
//   // // UNTUK MENGATUR SAAT PERPINDAHAN HALAMAN AGAR TIDAK TERTUMPUK DAN AKAN LEBIH HALUS
//   // void _navigateWithoutTransition(Widget page) {
//   //   Navigator.pushReplacement(
//   //     context,
//   //     PageRouteBuilder(
//   //       pageBuilder: (context, animation1, animation2) => page,
//   //       transitionDuration: Duration.zero,
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //   );
//   // }

//   // // SAMPAI SINI UNTUK MENGATUR SAAT PERPINDAHAN HALAMAN AGAR TIDAK TERTUMPUK DAN AKAN LEBIH HALUS

  

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60.0,
//       padding: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
//       decoration: BoxDecoration(
//         // color: Color.fromARGB(255, 255, 255, 255),
//         color: Color.fromARGB(255, 48, 75, 116),
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//             // bottomLeft: Radius.circular(20),
//             // bottomRight: Radius.circular(20)
//             ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: 0,
//                 ),
//                 child: InkWell(
//                   onTap: () {
                   
//                     // _navigateWithoutTransition(homePage());
//                   },
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.home,
//                             // size: 25,
//                             color: Colors.white,
                            
//                           ),
//                         ],
//                       ),
//                       Text(
//                         "Beranda",
//                         style: TextStyle(
//                           color: Colors.white,
                          
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                   autofocus: true,
//                 ),
//               ),

//               // Row(
//               //   children: [
//               //     TextButton(
//               //       child: Text(
//               //         "Beranda",
//               //         style: TextStyle(
//               //           color: Colors.white,
//               //           fontSize: 10,
//               //         ),
//               //       ),
//               //       onPressed: () {
//               //        // _navigateWithoutTransition(homePage());
//               //       },
//               //     ),
//               //   ],
//               // )
//             ],
//           ),
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 0),
//                 child: InkWell(
//                   onTap: () {
                   
                    
//                     // _navigateWithoutTransition(SurveyPage());
//                   },
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.assignment,
//                             size: 25,
//                             color: Colors.white,
                           
//                           ),
//                         ],
//                       ),
//                       Text(
//                         "Survey",
//                         style: TextStyle(
//                           color: Colors.white,
                         
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // Row(
//               //   children: [
//               //     Column(
//               //       mainAxisAlignment: MainAxisAlignment.start,
//               //       children: [
//               //         TextButton(
//               //           child: Text(
//               //             "Survey",
//               //             style: TextStyle(
//               //               color: Colors.white,
//               //               fontSize: 10,
//               //             ),
//               //           ),
//               //           onPressed: () {
//               //             // _changeColor();
//               //             _navigateWithoutTransition(SurveyPage());
//               //           },
//               //         ),
//               //       ],
//               //     )
//               //   ],
//               // )
//             ],
//           ),
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 0),
//                 child: InkWell(
//                   onTap: () {
                    
                    
//                     // _navigateWithoutTransition(promoPage());
//                   },
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.local_offer,
//                             size: 25,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                       Text(
//                         "Promo",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // Row(
//               //   children: [
//               //     Column(
//               //       mainAxisAlignment: MainAxisAlignment.start,
//               //       children: [
//               //         TextButton(
//               //           child: Text(
//               //             "Promo",
//               //             style: TextStyle(
//               //               color: Colors.white,
//               //               fontSize: 10,
//               //             ),
//               //           ),
//               //           onPressed: () {
//               //             _navigateWithoutTransition(promoPage());
//               //           },
//               //         ),
//               //       ],
//               //     )
//               //   ],
//               // )
//             ],
//           ),
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 0),
//                 child: InkWell(
//                   onTap: () {
                    
//                     // _navigateWithoutTransition(ChatPage());
//                   },
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.chat,
//                             size: 25,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                       Text(
//                         "Chat",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // Row(
//               //   children: [
//               //     Column(
//               //       mainAxisAlignment: MainAxisAlignment.start,
//               //       children: [
//               //         TextButton(
//               //           child: Text(
//               //             "Chat",
//               //             style: TextStyle(
//               //               color: Colors.white,
//               //               fontSize: 10,
//               //             ),
//               //           ),
//               //           onPressed: () {
//               //             _navigateWithoutTransition(ChatPage());
//               //           },
//               //         ),
//               //       ],
//               //     )
//               //   ],
//               // )
//             ],
//           ),
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 0),
//                 child: InkWell(
//                   onTap: () {
                    
//                     // _navigateWithoutTransition(ProfilePage());
//                   },
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.person,
//                             size: 25,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                       Text(
//                         "Profile",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // Row(
//               //   children: [
//               //     Column(
//               //       mainAxisAlignment: MainAxisAlignment.start,
//               //       children: [
//               //         TextButton(
//               //           child: Text(
//               //             "Profile",
//               //             style: TextStyle(
//               //               color: Colors.white,
//               //               fontSize: 10,
//               //             ),
//               //           ),
//               //           onPressed: () {
//               //             _navigateWithoutTransition(ProfilePage());
//               //           },
//               //         ),
//               //       ],
//               //     )
//               //   ],
//               // ),
//               // Text(
//               //   "Profile",
//               //   style: TextStyle(color: Colors.white),

//               // ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/pages/chatPage.dart';
// import 'package:flutter_aag4u/pages/homepage.dart';
// import 'package:flutter_aag4u/pages/profilePage.dart';
// import 'package:flutter_aag4u/pages/promoPage.dart';
// import 'package:flutter_aag4u/pages/surveyPage.dart';

// class HomeBottomNavBar extends StatefulWidget {
//   const HomeBottomNavBar({super.key});

//   @override
//   State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
// }

// class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
//   void _navigateWithoutTransition(Widget page) {
//     Navigator.pushReplacement(
//       context,
//       PageRouteBuilder(
//         pageBuilder: (context, animation1, animation2) => page,
//         transitionDuration: Duration.zero,
//         reverseTransitionDuration: Duration.zero,
//       ),
//     );
//   }

//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60.0,
//       padding: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
//       decoration: BoxDecoration(
//         color: Color.fromARGB(255, 48, 75, 116),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _buildNavBarItem(
//             icon: Icons.home,
//             label: 'Beranda',
//             page: homePage(),
//             index: 0,
//           ),
//           _buildNavBarItem(
//             icon: Icons.poll,
//             label: 'Survey',
//             page: SurveyPage(),
//             index: 1,
//           ),
//           _buildNavBarItem(
//             icon: Icons.local_offer,
//             label: 'Promo',
//             page: promoPage(),
//             index: 2,
//           ),
//           _buildNavBarItem(
//             icon: Icons.chat,
//             label: 'Chat',
//             page: ChatPage(),
//             index: 3,
//           ),
//           _buildNavBarItem(
//             icon: Icons.person,
//             label: 'Profile',
//             page: ProfilePage(),
//             index: 4,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavBarItem({
//     required IconData icon,
//     required String label,
//     required Widget page,
//     required int index,
//   }) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         _navigateWithoutTransition(page);
//         });
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: selectedIndex == index ? Colors.red : Colors.white,
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: selectedIndex == index ? Colors.red : Colors.white,
//               fontSize: 10,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/pages/chatPage.dart';
// import 'package:flutter_aag4u/pages/homepage.dart';
// import 'package:flutter_aag4u/pages/profilePage.dart';
// import 'package:flutter_aag4u/pages/promoPage.dart';
// import 'package:flutter_aag4u/pages/surveyPage.dart';



// class HomeBottomNavBar extends StatefulWidget {
//   const HomeBottomNavBar({super.key});

//   @override
//   State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
// }

// class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
//   // UNTUK MENGATUR SAAT PERPINDAHAN HALAMAN AGAR TIDAK TERTUMPUK DAN AKAN LEBIH HALUS
//   void _navigateWithoutTransition(Widget page) {
//     Navigator.pushReplacement(
//       context,
//       PageRouteBuilder(
//         pageBuilder: (context, animation1, animation2) => page,
//         transitionDuration: Duration.zero,
//         reverseTransitionDuration: Duration.zero,
//       ),
//     );
//   }
//   // SAMPAI SINI UNTUK MENGATUR SAAT PERPINDAHAN HALAMAN AGAR TIDAK TERTUMPUK DAN AKAN LEBIH HALUS


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//     );
//     }
// }

















// import 'package:custom_navigation_bar/custom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_aag4u/main.dart';
// import 'package:flutter_aag4u/pages/chatPage.dart';
// import 'package:flutter_aag4u/pages/homepage.dart';
// import 'package:flutter_aag4u/pages/profilePage.dart';
// import 'package:flutter_aag4u/pages/promoPage.dart';
// import 'package:flutter_aag4u/pages/surveyPage.dart';
// import 'package:flutter_icons/flutter_icons.dart';


// import 'package:flutter/material.dart';



// class HomeBottomNavBar extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<HomeBottomNavBar> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Navigation Example'),
//       ),
//       body: Center(
//         child: Text('Select a menu item to navigate'),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Center(
//         child: Text('Welcome to Home Page',
//             style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }

// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Page'),
//       ),
//       body: Center(
//         child: Text('Welcome to Search Page',
//             style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Page'),
//       ),
//       body: Center(
//         child: Text('Welcome to Profile Page',
//             style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }

