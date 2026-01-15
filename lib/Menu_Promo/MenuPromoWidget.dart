// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:shimmer/shimmer.dart';

// // class Promo {
// //   // final String id;

// //   final String gambar_banner;

// //   Promo({required this.gambar_banner});

// //   factory Promo.fromJson(Map<String, dynamic> json) {
// //     String id = json['id'].toString();
// //     String imageName = json['gambar_banner'].toString();
// //     String imageUrl = 'https://app.aag4u.co.id/public/image/banner/$imageName';
// //     return Promo(
// //       // id: json['id'],
// //       gambar_banner: imageUrl.toString(),
// //     );
// //   }
// // }

// // class MenuPromoWidget extends StatefulWidget {
// //   const MenuPromoWidget({super.key});

// //   @override
// //   State<MenuPromoWidget> createState() => _MenuPromoWidgetState();
// // }

// // class _MenuPromoWidgetState extends State<MenuPromoWidget> {
// //   Future<List<Promo>>? futurePromo;

// //   @override
// //   void initState() {
// //     super.initState();
// //     futurePromo = fetchPromo();
// //   }

// //   Future<List<Promo>> fetchPromo() async {
// //     final response =
// //         await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

// //     if (response.statusCode == 200) {
// //       List jsonResponse = json.decode(response.body);
// //       return jsonResponse.map((data) => Promo.fromJson(data)).toList();
// //     } else {
// //       throw Exception('Failed to load blog posts');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width * 0.9;

// //     return SingleChildScrollView(
// //       scrollDirection: Axis.vertical,
// //       child:
// //       Column(
// //         children: [
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(
// //                     horizontal: 12.0, vertical: 15.0),
// //                 child: Column(
// //                   children: [
// //                     Container(
// //                       width: screenWidth,
// //                       height: 50,
// //                       alignment: Alignment.center,
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(24),
// //                       ),
// //                       child: Column(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               Text(
// //                                 "Promo",
// //                                 style: TextStyle(
// //                                   fontSize: 35,
// //                                   fontWeight: FontWeight.bold,
// //                                   color: Color(0xFF233d63),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //           Column(
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Container(
// //                     // color: Colors.amber,
// //                     width: screenWidth,
// //                     height: 750,
// //                     child: FutureBuilder<List<Promo>>(
// //                       future: futurePromo,
// //                       builder: (context, snapshot) {
// //                         if (snapshot.connectionState ==
// //                             ConnectionState.waiting) {
// //                           return Center(child: CircularProgressIndicator());
// //                         } else if (snapshot.hasError) {
// //                           return Center(child: Text("${snapshot.error}"));
// //                         } else if (snapshot.hasData) {
// //                           List<Promo> posts = snapshot.data!;
// //                           return ListView.builder(
// //                             itemCount: posts.length,
// //                             itemBuilder: (context, index) {
// //                               return Card(
// //                                 margin: EdgeInsets.all(7.0),
// //                                 child: Column(
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   children: [
// //                                     Image.network(
// //                                       posts[index].gambar_banner,
// //                                       // width: double.infinity,
// //                                       // height: 200,
// //                                       fit: BoxFit.cover,
// //                                     ),
// //                                   ],
// //                                 ),
// //                               );
// //                             },
// //                           );
// //                         } else {
// //                           return Center(child: Text("No data available"));
// //                         }
// //                       },
// //                     ),

// //                     //  FutureBuilder<List<Promo>>(
// //                     //   future: futurePromo,
// //                     //   builder: (context, snapshot) {
// //                     //     if (snapshot.connectionState ==
// //                     //         ConnectionState.waiting) {
// //                     //       // return Center(child: CircularProgressIndicator());
// //                     //       return buildShimmer();
// //                     //     } else if (snapshot.hasError) {
// //                     //       return Center(child: Text("${snapshot.error}"));
// //                     //     } else if (snapshot.hasData) {
// //                     //       List<Promo> posts = snapshot.data!;
// //                     //       return Row(
// //                     //         children: posts.map((Promo) {
// //                     //           return Card(
// //                     //             margin: EdgeInsets.all(0),
// //                     //             child: Column(
// //                     //               crossAxisAlignment: CrossAxisAlignment.start,
// //                     //               children: [
// //                     //                 Image.network(
// //                     //                   Promo.gambar_banner.toString(),
// //                     //                   width: screenWidth,
// //                     //                   height: 100,
// //                     //                   fit: BoxFit.cover,
// //                     //                 ),
// //                     //               ],
// //                     //             ),
// //                     //           );
// //                     //         }).toList(),
// //                     //       );
// //                     //     } else {
// //                     //       return Center(child: Text("No data available"));
// //                     //     }
// //                     //   },
// //                     // ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget buildShimmer() {
// //     return SingleChildScrollView(
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Shimmer.fromColors(
// //             baseColor: Colors.grey[300]!,
// //             highlightColor: Colors.grey[100]!,
// //             child: Container(
// //               width: MediaQuery.of(context).size.width,
// //               height: 200,
// //               color: Colors.white,
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Shimmer.fromColors(
// //               baseColor: Colors.grey[300]!,
// //               highlightColor: Colors.grey[100]!,
// //               child: Container(
// //                 height: 24,
// //                 color: Colors.white,
// //               ),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Shimmer.fromColors(
// //               baseColor: Colors.grey[300]!,
// //               highlightColor: Colors.grey[100]!,
// //               child: Container(
// //                 height: 16,
// //                 color: Colors.white,
// //               ),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Shimmer.fromColors(
// //               baseColor: Colors.grey[300]!,
// //               highlightColor: Colors.grey[100]!,
// //               child: Container(
// //                 height: 16,
// //                 color: Colors.white,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shimmer/shimmer.dart';

// class Promo {
//   // final String id;

//   final String gambar_banner;

//   Promo({required this.gambar_banner});

//   factory Promo.fromJson(Map<String, dynamic> json) {
//     String id = json['id'].toString();
//     String imageName = json['gambar_banner'].toString();
//     String imageUrl = 'https://app.aag4u.co.id/public/image/banner/$imageName';
//     return Promo(
//       // id: json['id'],
//       gambar_banner: imageUrl.toString(),
//     );
//   }
// }

// class promoPage extends StatefulWidget {
//   const promoPage({super.key});

//   @override
//   State<promoPage> createState() => _promoPageState();
// }

// class _promoPageState extends State<promoPage> {
//   Future<List<Promo>>? futurePromo;
//   bool isConnected = true;

//   @override
//   void initState() {
//     super.initState();
//     futurePromo = fetchPromo();
//   }

//   // Future<List<Promo>> fetchPromo() async {
//   //   final response =
//   //       await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

//   //   if (response.statusCode == 200) {
//   //     List jsonResponse = json.decode(response.body);
//   //     return jsonResponse.map((data) => Promo.fromJson(data)).toList();
//   //   } else {
//   //     throw Exception('Failed to load blog posts');
//   //   }
//   // }

//   Future<List<Promo>> fetchPromo() async {
//     var isConnected = await InternetConnectionChecker().hasConnection;

//     if (isConnected) {
//       try {
//         final response = await http.get(
//           Uri.parse('https://app.aag4u.co.id/api/getBanner'),
//         );
//         if (response.statusCode == 200) {
//           List jsonResponse = json.decode(response.body);
//           List<Promo> promo =
//               jsonResponse.map((data) => Promo.fromJson(data)).toList();
//           return promo;
//         } else {
//           throw Exception('Failed to load blog posts');
//         }
//       } catch (e) {
//         print('Error fetching data: $e');
//         return _getPlaceholderPromo();
//       }
//     } else {
//       return _getPlaceholderPromo();
//     }
//   }

//   List<Promo> _getPlaceholderPromo() {
//     return [
//       Promo(
//         gambar_banner: 'images/assets/No_internet.png',
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;

//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 12.0, vertical: 15.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: screenWidth,
//                       height: 50,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Promo",
//                                 style: TextStyle(
//                                   fontSize: 35,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF233d63),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: screenWidth,
//                     height: 650,
//                     child: FutureBuilder<bool>(
//                       future: InternetConnectionChecker().hasConnection,
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return Center(child: CircularProgressIndicator());
//                         } else if (snapshot.hasError) {
//                           return Center(
//                               child: Text("Error: ${snapshot.error}"));
//                         } else if (snapshot.hasData && snapshot.data == true) {
//                           // Internet is available
//                           return FutureBuilder<List<Promo>>(
//                             future: futurePromo,
//                             builder: (context, snapshot) {
//                               if (snapshot.connectionState ==
//                                   ConnectionState.waiting) {
//                                 return Center(
//                                     child: CircularProgressIndicator());
//                               } else if (snapshot.hasError) {
//                                 return Center(
//                                     child: Text("Error: ${snapshot.error}"));
//                               } else if (snapshot.hasData) {
//                                 List<Promo> posts = snapshot.data!;
//                                 return ListView.builder(
//                                   itemCount: posts.length,
//                                   itemBuilder: (context, index) {
//                                     return Card(
//                                       margin: EdgeInsets.all(7.0),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Image.network(
//                                             posts[index].gambar_banner,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 );
//                               } else {
//                                 return Center(child: Text("No data available"));
//                               }
//                             },
//                           );
//                         } else {
//                           // No internet connection
//                           return Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   'images/assets/No_internet.png',
//                                   width: 200,
//                                   height: 200,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 SizedBox(height: 20),
//                                 Text(
//                                     'Please check your internet connection and try again.'),
//                                 SizedBox(height: 20),
//                                 ElevatedButton.icon(
//                                   onPressed: () async {
//                                     // Re-check the internet connection and refresh the data
//                                     bool connection =
//                                         await InternetConnectionChecker()
//                                             .hasConnection;
//                                     if (connection) {
//                                       setState(() {
//                                         isConnected = true;
//                                         futurePromo = fetchPromo();
//                                       });
//                                     } else {
//                                       setState(() {
//                                         isConnected = false;
//                                       });
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         SnackBar(
//                                             content: Text(
//                                                 'No internet connection available')),
//                                       );
//                                     }
//                                   },
//                                   icon: Icon(Icons.refresh),
//                                   label: Text('Refresh'),
//                                   style: ElevatedButton.styleFrom(
//                                     foregroundColor: Colors.white,
//                                     backgroundColor: Colors.blue, // Text color
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 20, vertical: 10),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildShimmer() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Shimmer.fromColors(
//             baseColor: Colors.grey[300]!,
//             highlightColor: Colors.grey[100]!,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 200,
//               color: Colors.white,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 height: 24,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 height: 16,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 height: 16,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
