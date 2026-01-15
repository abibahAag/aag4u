// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/pages/homepage.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// class SurveyResultWidget extends StatefulWidget {
//   final int surveyId;

//   SurveyResultWidget({required this.surveyId});

//   @override
//   State<SurveyResultWidget> createState() => _SurveyResultWidgetState();
// }

// class _SurveyResultWidgetState extends State<SurveyResultWidget> {
//   Map<String, dynamic>? surveyData;

//   @override
//   void initState() {
//     super.initState();
//     _fetchSurveyData();
//   }

//   Future<Map<String, dynamic>> _fetchSurveyData() async {
//     final response = await http.get(
//       Uri.parse('https://app.aag4u.co.id/api/getSurveyBy/${widget.surveyId}'),
//     );

//     if (response.statusCode == 200) {
//       return json.decode(response.body) as Map<String, dynamic>;
//     } else {
//       throw Exception('Failed to load survey data');
//     }
//   }

//   // void main() {
//   //   String isoDate = ({surveyData['wa'] ?? 'N/A'});

//   //   // Parse the ISO 8601 string to a DateTime object
//   //   DateTime dateTime = DateTime.parse(isoDate);

//   //   // Format the date and time separately
//   //   String formattedDate =
//   //       DateFormat('d MMMM yyyy').format(dateTime); // e.g., "16 August 2024"
//   //   String formattedTime =
//   //       DateFormat('HH:mm').format(dateTime); // e.g., "14:23"

//   //   // Combine the formatted date and time
//   //   String formattedDateTime = "$formattedDate | $formattedTime";

//   //   print(formattedDateTime); // Output: "16 August 2024 | 14:23"
//   // }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;
//     double inWidth = MediaQuery.of(context).size.width * 0.8;
//     final List<dynamic> dropdownItems;

//     return Scaffold(
//       // scrollDirection: Axis.vertical,
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: _fetchSurveyData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final data = snapshot.data!;
//             final surveyData = data['survey'] as Map<String, dynamic>;
//             final surveyhama = data['hama'] as List<dynamic>;

//             final hamaNames = surveyhama
//                 .map((hama) =>
//                     (hama as Map<String, dynamic>)['nama_hama'] ?? 'No name')
//                 .join(', ');

//             String _formatDateTimeToOriginal(String dateTime) {
//               if (dateTime == 'N/A') return 'N/A';

//               // Parse the string to DateTime
//               DateTime parsedDate =
//                   DateTime.parse(dateTime).toUtc().add(Duration(hours: 7));

//               // Format the date and time to original format
//               String formattedDateTime =
//                   DateFormat('yyyy-MM-dd HH:mm:ss').format(parsedDate);

//               return formattedDateTime;
//             }

//             return Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 18, 213, 70),
//                 ),
//                 child: Stack(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(top: 40),
//                           child: Column(
//                             mainAxisSize: MainAxisSize
//                                 .min, // Ukuran kolom sesuai dengan kontennya
//                             children: [
//                               Image.asset('images/icons/done.png', width: 70),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Text(
//                                 'Permintaan Berhasil',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                     fontFamily: 'Roboto'),
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Text(
//                                 'Permintaanmu untuk survey telah di terima,',
//                                 style: TextStyle(
//                                     fontSize: 10, color: Colors.white),
//                               ),
//                               Text(
//                                 'Mohon menunggu respon dari kami',
//                                 style: TextStyle(
//                                     fontSize: 10, color: Colors.white),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(top: 230),
//                                         child: Column(children: [
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 30.0,
//                                             ),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   // mainAxisAlignment: MainAxisAlignment.center,
//                                                   children: [
//                                                     Column(
//                                                       children: [
//                                                         ClipPath(
//                                                           clipper: TsClip3(),
//                                                           child: Container(
//                                                             width: 300,
//                                                             height: 500,
//                                                             color:
//                                                                 Color.fromARGB(
//                                                                     255,
//                                                                     255,
//                                                                     255,
//                                                                     255),
//                                                             child: Stack(
//                                                               children: [
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topLeft,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top: 30,
//                                                                         left:
//                                                                             10),
//                                                                     child: Image
//                                                                         .asset(
//                                                                       'images/new_logo.png',
//                                                                       width: 70,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .topRight,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top: 30,
//                                                                         right:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       crossAxisAlignment:
//                                                                           CrossAxisAlignment
//                                                                               .end,
//                                                                       children: [
//                                                                         Text(
//                                                                           'WAKTU PERMINTAAN',
//                                                                           style:
//                                                                               TextStyle(fontSize: 10),
//                                                                         ),
//                                                                         SizedBox(
//                                                                             height:
//                                                                                 5), // Menambahkan jarak antara teks
//                                                                         Text(
//                                                                           _formatDateTimeToOriginal(surveyData['created_at'] ??
//                                                                               'N/A'),
//                                                                           // '14 August 2024 | 14:30',
//                                                                           style:
//                                                                               TextStyle(fontSize: 10),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .centerLeft,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top:
//                                                                             100,
//                                                                         left:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       // mainAxisAlignment:
//                                                                       //     MainAxisAlignment.start,
//                                                                       children: [
//                                                                         Text(
//                                                                           'MASALAH HAMA ',
//                                                                           style: TextStyle(
//                                                                               fontSize: 12,
//                                                                               color: Colors.grey),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .centerLeft,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top:
//                                                                             120,
//                                                                         left:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       crossAxisAlignment:
//                                                                           CrossAxisAlignment
//                                                                               .start,
//                                                                       children: [
//                                                                         // Add some spacing
//                                                                         Text(
//                                                                           hamaNames.isNotEmpty
//                                                                               ? hamaNames
//                                                                               : 'No data',
//                                                                           style: TextStyle(
//                                                                               fontSize: 14,
//                                                                               color: Color.fromARGB(255, 7, 10, 113),
//                                                                               fontWeight: FontWeight.bold),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 // Align(
//                                                                 //   alignment:
//                                                                 //       Alignment
//                                                                 //           .centerLeft,
//                                                                 //   child:
//                                                                 //       Padding(
//                                                                 //     padding: const EdgeInsets
//                                                                 //         .only(
//                                                                 //         top:
//                                                                 //             120,
//                                                                 //         left:
//                                                                 //             10),
//                                                                 //     child:
//                                                                 //         Column(
//                                                                 //       // mainAxisAlignment:
//                                                                 //       //     MainAxisAlignment.start,
//                                                                 //       children: [
//                                                                 //         // Text(
//                                                                 //         //   '${surveyData['provinsi'] ?? 'N/A'}',
//                                                                 //         //   style: TextStyle(
//                                                                 //         //       fontSize: 14,
//                                                                 //         //       color: Color.fromARGB(255, 7, 10, 113),
//                                                                 //         //       fontWeight: FontWeight.bold),
//                                                                 //         // ),
//                                                                 //         Expanded(
//                                                                 //           child:
//                                                                 //               ListView.builder(
//                                                                 //             itemCount:
//                                                                 //                 surveyhama.length,
//                                                                 //             itemBuilder:
//                                                                 //                 (context, index) {
//                                                                 //               final hama = surveyhama[index] as Map<String, dynamic>;
//                                                                 //               return ListTile(
//                                                                 //                 title: Text(hama['nama_hama'] ?? 'No name'),
//                                                                 //               );
//                                                                 //             },
//                                                                 //           ),
//                                                                 //         )
//                                                                 //       ],
//                                                                 //     ),
//                                                                 //   ),
//                                                                 // ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .centerLeft,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top:
//                                                                             160,
//                                                                         left:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       // mainAxisAlignment:
//                                                                       //     MainAxisAlignment.start,
//                                                                       children: [
//                                                                         Text(
//                                                                           'WHATSAPP ',
//                                                                           style: TextStyle(
//                                                                               fontSize: 12,
//                                                                               color: Colors.grey),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .centerLeft,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top:
//                                                                             180,
//                                                                         left:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       // mainAxisAlignment:
//                                                                       //     MainAxisAlignment.start,
//                                                                       children: [
//                                                                         Text(
//                                                                           '${surveyData['wa'] ?? 'N/A'}',
//                                                                           style: TextStyle(
//                                                                               fontSize: 14,
//                                                                               color: Color.fromARGB(255, 7, 10, 113),
//                                                                               fontWeight: FontWeight.bold),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .centerLeft,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top:
//                                                                             220,
//                                                                         left:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       // mainAxisAlignment:
//                                                                       //     MainAxisAlignment.start,
//                                                                       children: [
//                                                                         Text(
//                                                                           'PROVINSI ',
//                                                                           style: TextStyle(
//                                                                               fontSize: 12,
//                                                                               color: Colors.grey),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .centerLeft,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top:
//                                                                             240,
//                                                                         left:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       // mainAxisAlignment:
//                                                                       //     MainAxisAlignment.start,
//                                                                       children: [
//                                                                         Text(
//                                                                           '${surveyData['provinsi'] ?? 'N/A'}',
//                                                                           // 'DKI Jakarta',
//                                                                           style: TextStyle(
//                                                                               fontSize: 14,
//                                                                               color: Color.fromARGB(255, 7, 10, 113),
//                                                                               fontWeight: FontWeight.bold),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .centerLeft,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top:
//                                                                             280,
//                                                                         left:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       // mainAxisAlignment:
//                                                                       //     MainAxisAlignment.start,
//                                                                       children: [
//                                                                         Text(
//                                                                           'KOTA / KAB',
//                                                                           style: TextStyle(
//                                                                               fontSize: 12,
//                                                                               color: Colors.grey),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .centerLeft,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top:
//                                                                             300,
//                                                                         left:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       // mainAxisAlignment:
//                                                                       //     MainAxisAlignment.start,
//                                                                       children: [
//                                                                         Text(
//                                                                           '${surveyData['kota'] ?? 'N/A'}',
//                                                                           style: TextStyle(
//                                                                               fontSize: 14,
//                                                                               color: Color.fromARGB(255, 7, 10, 113),
//                                                                               fontWeight: FontWeight.bold),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .centerLeft,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top:
//                                                                             340,
//                                                                         left:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       // mainAxisAlignment:
//                                                                       //     MainAxisAlignment.start,
//                                                                       children: [
//                                                                         Text(
//                                                                           'ALAMAT LENGKAP ',
//                                                                           style: TextStyle(
//                                                                               fontSize: 12,
//                                                                               color: Colors.grey),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .centerLeft,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top:
//                                                                             360,
//                                                                         left:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       // mainAxisAlignment:
//                                                                       //     MainAxisAlignment.start,
//                                                                       children: [
//                                                                         Text(
//                                                                           '${surveyData['alamat'] ?? 'N/A'}',
//                                                                           style: TextStyle(
//                                                                               fontSize: 14,
//                                                                               color: Color.fromARGB(255, 7, 10, 113),
//                                                                               fontWeight: FontWeight.bold),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Align(
//                                                                   alignment:
//                                                                       Alignment
//                                                                           .centerRight,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding: const EdgeInsets
//                                                                         .only(
//                                                                         top:
//                                                                             440,
//                                                                         right:
//                                                                             10),
//                                                                     child:
//                                                                         Column(
//                                                                       // mainAxisAlignment:
//                                                                       //     MainAxisAlignment.start,
//                                                                       children: [
//                                                                         ElevatedButton(
//                                                                             style:
//                                                                                 ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blue),
//                                                                             onPressed: () {
//                                                                               Navigator.push(
//                                                                                 context,
//                                                                                 MaterialPageRoute(builder: (context) => homePage(isRegistered: false, isLoggedIn: false)),
//                                                                               );
//                                                                             },
//                                                                             child: Text('Ke Home'))
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                           // SizedBox(height: 30),
//                                         ]),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ));
//           } else {
//             return Center(child: Text('No data found'));
//           }
//         },
//       ),
//     );
//   }
// }

// class TsClip2 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     // Start the path at the top-left corner
//     path.moveTo(0, 0);

//     // Variables to control wave creation
//     var curXPos = 0.0;
//     var curYPos = 0.0;
//     var increment = size.width / 20;

//     // Create the arc pattern along the top edge, with the wave going upwards
//     while (curXPos < size.width) {
//       curXPos += increment;
//       path.arcToPoint(
//         Offset(curXPos, curYPos == 0 ? 20 : 0), // Move the wave upwards
//         radius: Radius.circular(5), // Adjust the radius for smoother arcs
//         clockwise: curYPos == 0,
//       );
//       curYPos =
//           curYPos == 0 ? 10 : 0; // Alternate Y position to create the wave
//     }

//     // Draw the path down the right side, across the bottom, and back up the left side
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class TsClip3 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     // Start the path at the top-left corner
//     path.moveTo(0, 0);

//     // Initialize the current positions at the top-left corner
//     var curXPos = 0.0;
//     var curYPos = 0.0;

//     // Set the wave increment based on the width
//     var increment = size.width / 30;

//     // Create the wave pattern along the top edge
//     while (curXPos < size.width) {
//       curXPos += increment;
//       curYPos =
//           curYPos == 0 ? 10 : 0; // Invert the wave pattern for the top edge
//       path.lineTo(curXPos, curYPos);
//     }

//     // Draw the path down the right side, across the bottom, and back up the left side
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close(); // Close the path

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }


// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class SurveyResultPage extends StatefulWidget {
// //   final int surveyId;

// //   SurveyResultPage({required this.surveyId});

// //   @override
// //   _SurveyResultPageState createState() => _SurveyResultPageState();
// // }

// // class _SurveyResultPageState extends State<SurveyResultPage> {
// //   Map<String, dynamic>? surveyData;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchSurveyData();
// //   }

// //   Future<Map<String, dynamic>> _fetchSurveyData() async {
// //     final response = await http.get(
// //       Uri.parse('https://app.aag4u.co.id/api/getSurveyBy/${widget.surveyId}'),
// //     );

// //     if (response.statusCode == 200) {
// //       return json.decode(response.body) as Map<String, dynamic>;
// //     } else {
// //       throw Exception('Failed to load survey data');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Survey Data'),
// //       ),
// //       body: FutureBuilder<Map<String, dynamic>>(
// //         future: _fetchSurveyData(),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (snapshot.hasData) {
// //             final data = snapshot.data!;
// //             final surveyData = data['survey'] as Map<String, dynamic>;

// //             return Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text('Provinsi: ${surveyData['provinsi'] ?? 'N/A'}'),
// //                   Text('Kota: ${surveyData['kota'] ?? 'N/A'}'),
// //                   Text('Alamat: ${surveyData['alamat'] ?? 'N/A'}'),
// //                   // Tambahkan widget lain sesuai dengan data yang ingin ditampilkan
// //                 ],
// //               ),
// //             );
// //           } else {
// //             return Center(child: Text('No data found'));
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
