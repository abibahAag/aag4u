// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/template/navbar.dart';
// import 'package:http/http.dart' as http;
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

//   @override
//   void initState() {
//     super.initState();
//     futurePromo = fetchPromo();
//   }

//   Future<List<Promo>> fetchPromo() async {
//     final response =
//         await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => Promo.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load blog posts');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;

//     return Scaffold(
//       appBar: Navbar(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12.0, vertical: 15.0),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: screenWidth,
//                           height: 50,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(24),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Promo",
//                                     style: TextStyle(
//                                       fontSize: 35,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF233d63),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         // color: Colors.amber,
//                         width: screenWidth,
//                         height: 750,
//                         child: FutureBuilder<List<Promo>>(
//                           future: futurePromo,
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return Center(child: CircularProgressIndicator());
//                             } else if (snapshot.hasError) {
//                               return Center(child: Text("${snapshot.error}"));
//                             } else if (snapshot.hasData) {
//                               List<Promo> posts = snapshot.data!;
//                               return ListView.builder(
//                                 itemCount: posts.length,
//                                 itemBuilder: (context, index) {
//                                   return Card(
//                                     margin: EdgeInsets.all(7.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Image.network(
//                                           posts[index].gambar_banner,
//                                           // width: double.infinity,
//                                           // height: 200,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               );
//                             } else {
//                               return Center(child: Text("No data available"));
//                             }
//                           },
//                         ),

//                         //  FutureBuilder<List<Promo>>(
//                         //   future: futurePromo,
//                         //   builder: (context, snapshot) {
//                         //     if (snapshot.connectionState ==
//                         //         ConnectionState.waiting) {
//                         //       // return Center(child: CircularProgressIndicator());
//                         //       return buildShimmer();
//                         //     } else if (snapshot.hasError) {
//                         //       return Center(child: Text("${snapshot.error}"));
//                         //     } else if (snapshot.hasData) {
//                         //       List<Promo> posts = snapshot.data!;
//                         //       return Row(
//                         //         children: posts.map((Promo) {
//                         //           return Card(
//                         //             margin: EdgeInsets.all(0),
//                         //             child: Column(
//                         //               crossAxisAlignment: CrossAxisAlignment.start,
//                         //               children: [
//                         //                 Image.network(
//                         //                   Promo.gambar_banner.toString(),
//                         //                   width: screenWidth,
//                         //                   height: 100,
//                         //                   fit: BoxFit.cover,
//                         //                 ),
//                         //               ],
//                         //             ),
//                         //           );
//                         //         }).toList(),
//                         //       );
//                         //     } else {
//                         //       return Center(child: Text("No data available"));
//                         //     }
//                         //   },
//                         // ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),

//           // Column(
//           //   mainAxisAlignment: MainAxisAlignment.center,
//           //   children: [
//           //     Row(
//           //       mainAxisAlignment: MainAxisAlignment.center,
//           //       children: [
//           //         Padding(
//           //           padding: EdgeInsets.all(0),
//           //           child: Container(
//           //               child: Column(
//           //             children: [
//           //               Row(
//           //                 children: [
//           //                   Text(
//           //                     "PROMO",
//           //                     style: TextStyle(
//           //                       fontSize: 25,

//           //                     ),
//           //                   )
//           //                     ],
//           //                   ),
//           //                   SizedBox(
//           //                     height: 10,
//           //                   ),
//           //                 Row(
//           //                 children: [
//           //                   Column(
//           //                     children: [
//           //                       Container(
//           //                         child: Text(
//           //                           "COMING SOON",
//           //                           style: TextStyle(
//           //                             fontSize: 35,
//           //                             fontWeight: FontWeight.bold,
//           //                           ),
//           //                         ),
//           //                       )
//           //                     ],
//           //                   )
//           //                 ],
//           //               )
//           //             ],
//           //           )),
//           //         ),
//           //       ],
//           //     )
//           //   ],
//           // ),
//         ),
//       ),
//       // bottomNavigationBar: HomeBottomNavBar(),
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
