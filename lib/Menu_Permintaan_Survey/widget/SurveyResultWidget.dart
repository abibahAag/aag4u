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
//     double screenWidth  * 0.5 = MediaQuery.of(context).size.width * 0.8;
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
//                                                                         Row(
//                                                                           children: [
//                                                                             Container(
//                                                                               child: Text(
//                                                                                 'MASALAH HAMA ',
//                                                                                 style: TextStyle(fontSize: 12, color: Colors.grey),
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                         Row(
//                                                                           children: [
//                                                                             Padding(
//                                                                               padding: const EdgeInsets.only(top: 10, left: 0),
//                                                                               child: Column(
//                                                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                 children: [
//                                                                                   // Add some spacing
//                                                                                   Text(
//                                                                                     hamaNames.isNotEmpty ? hamaNames : 'No data',
//                                                                                     style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 7, 10, 113), fontWeight: FontWeight.bold),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ),
//                                                                           ],
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
//                                                                             170,
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
//                                                                             190,
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
//                                                                             230,
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
//                                                                             250,
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
//                                                                             inWidth,
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
//                                                                             310,
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
//                                                                             350,
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
//                                                                             370,
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
//                                                                                 MaterialPageRoute(builder: (context) => homePage()),
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class SurveyResultWidget extends StatefulWidget {
  final int surveyId;

  SurveyResultWidget({required this.surveyId});

  @override
  State<SurveyResultWidget> createState() => _SurveyResultWidgetState();
}

class _SurveyResultWidgetState extends State<SurveyResultWidget> {
  Map<String, dynamic>? surveyData;

  @override
  void initState() {
    super.initState();
    _fetchSurveyData();
  }

  Future<Map<String, dynamic>> _fetchSurveyData() async {
    final response = await http.get(
      Uri.parse('https://app.aag4u.co.id/api/getSurveyBy/${widget.surveyId}'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load survey data');
    }
  }

  String formatTanggal(String inputDate) {
    // Parse tanggal dari format string 'yyyy-MM-dd'
    DateTime dateTime = DateTime.parse(inputDate);

    // Format tanggal ke 'dd MMM yyyy'
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);

    return formattedDate;
  }

  String formatTime(String inputTime) {
    // Parse string time '15:30:00' ke DateTime
    DateTime dateTime = DateFormat('HH:mm:ss').parse(inputTime);

    // Format waktu ke 'HH:mm'
    String formattedTime = DateFormat('HH:00').format(dateTime);

    return formattedTime;
  }

  // void main() {
  //   String isoDate = ({surveyData['wa'] ?? 'N/A'});

  //   // Parse the ISO 8601 string to a DateTime object
  //   DateTime dateTime = DateTime.parse(isoDate);

  //   // Format the date and time separately
  //   String formattedDate =
  //       DateFormat('d MMMM yyyy').format(dateTime); // e.g., "16 August 2024"
  //   String formattedTime =
  //       DateFormat('HH:mm').format(dateTime); // e.g., "14:23"

  //   // Combine the formatted date and time
  //   String formattedDateTime = "$formattedDate | $formattedTime";

  //   print(formattedDateTime); // Output: "16 August 2024 | 14:23"
  // }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width ;
    double containerWidth = MediaQuery.of(context).size.width * 0.9;
    double inWidth = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final List<dynamic> dropdownItems;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 213, 70),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            margin: EdgeInsets.only(top: screenWidth * 0.08),
            // color: Color.fromARGB(255, 18, 213, 70),
            // color: Colors.blue,
            // width: screenWidth,
            // height: screenHeight,
            // decoration: BoxDecoration(
            //     // color: Color.fromARGB(255, 18, 213, 70),
            //     ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              // color: const Color.fromARGB(255, 243, 33, 135),
                              margin: EdgeInsets.only(top: 0),
                              child: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // Ukuran kolom sesuai dengan kontennya
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'images/icons/done.png',
                                                  width: iconSize * 0.15),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Permintaan Berhasil',
                                            style: TextStyle(
                                                fontSize: fontSize * 0.04,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontFamily: 'Roboto'),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Permintaanmu untuk survey telah di terima,',
                                            style: TextStyle(
                                                fontSize: fontSize * 0.03,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            'Mohon menunggu respon dari kami',
                                            style: TextStyle(
                                                fontSize: fontSize * 0.03,
                                                color: Colors.white),
                                          )
                                        ],
                                      )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      FutureBuilder<Map<String, dynamic>>(
                                        future: _fetchSurveyData(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else if (snapshot.hasError) {
                                            return Center(
                                                child: Text(
                                                    'Error: ${snapshot.error}'));
                                          } else if (snapshot.hasData) {
                                            final data = snapshot.data!;
                                            final surveyData = data['survey']
                                                as Map<String, dynamic>;

                                            final hama_lainnya =
                                                surveyData['hama_lainnya']
                                                    as String?;
                                            final surveyhama =
                                                data['hama'] as List<dynamic>;

                                            // Get the hama names from the list
                                            final hamaNames = surveyhama
                                                .map((hama) =>
                                                    (hama as Map<String,
                                                            dynamic>)[
                                                        'nama_hama'] ??
                                                    'No name')
                                                .join(', ');

                                            // Handle the conditions for displaying hama names and hama_lainnya
                                            String displayHamaData() {
                                              if (hamaNames.isNotEmpty &&
                                                  (hama_lainnya?.isNotEmpty ??
                                                      false)) {
                                                // Both hamaNames and hama_lainnya have values
                                                return '$hamaNames, $hama_lainnya';
                                              } else if (hamaNames.isNotEmpty &&
                                                  (hama_lainnya?.isEmpty ??
                                                      true)) {
                                                // Only hamaNames has a value
                                                return hamaNames;
                                              } else if (hamaNames.isEmpty &&
                                                  (hama_lainnya?.isNotEmpty ??
                                                      false)) {
                                                // Only hama_lainnya has a value
                                                return hama_lainnya!;
                                              }
                                              return 'No data available';
                                            }

                                            String _formatDateTimeToOriginal(
                                                String dateTime) {
                                              if (dateTime == 'N/A')
                                                return 'N/A';

                                              DateTime parsedDate =
                                                  DateTime.parse(dateTime)
                                                      .toUtc()
                                                      .add(Duration(hours: 7));
                                              String formattedDateTime =
                                                  DateFormat(
                                                          'yyyy-MM-dd HH:mm:ss')
                                                      .format(parsedDate);

                                              return formattedDateTime;
                                            }

                                            return Column(
                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            30),
                                                                child: Column(
                                                                    children: [
                                                                      Container(
                                                                        // color: Colors
                                                                        //     .blue,
                                                                        width: screenWidth *
                                                                            1.0,
                                                                        height: screenWidth *
                                                                            2.0,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Column(
                                                                                  children: [
                                                                                    ClipPath(
                                                                                      clipper: TsClip3(),
                                                                                      child: Container(
                                                                                        // width: screenWidth * 0.9,
                                                                                        // height: screenHeight * 0.8,
                                                                                        color: Color.fromARGB(255, 255, 255, 255),
                                                                                        // color: Color.fromARGB(255, 222, 26, 26),
                                                                                        padding: EdgeInsetsDirectional.only(bottom: 20),
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(top: 30),
                                                                                                  child: Container(
                                                                                                    // color: Colors.amber,
                                                                                                    // width: screenWidth * 0.9,
                                                                                                    // height: screenHeight * 0.7,
                                                                                                    child: Stack(
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                                                                                                          child: Row(
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Column(
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            // color: Colors.blue,
                                                                                                                            // width: screenWidth * 0.8,
                                                                                                                            padding: EdgeInsetsDirectional.only(end: 20),
                                                                                                                            child: Column(
                                                                                                                              children: [
                                                                                                                                Row(
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                  children: [
                                                                                                                                    Padding(
                                                                                                                                      padding: const EdgeInsets.only(
                                                                                                                                        top: 10,
                                                                                                                                      ),
                                                                                                                                      child: Image.asset(
                                                                                                                                        'images/new_logo.png',
                                                                                                                                        width: iconSize * 0.2,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    SizedBox(
                                                                                                                                      width: screenWidth * 0.3,
                                                                                                                                    ),
                                                                                                                                    Column(
                                                                                                                                      children: [
                                                                                                                                        Row(
                                                                                                                                          // mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                          children: [
                                                                                                                                            Align(
                                                                                                                                              alignment: Alignment.topCenter,
                                                                                                                                              child: Column(
                                                                                                                                                children: [
                                                                                                                                                  Row(
                                                                                                                                                    children: [
                                                                                                                                                      Text(
                                                                                                                                                        'WAKTU PERMINTAAN',
                                                                                                                                                        style: TextStyle(fontSize: fontSize * 0.03),
                                                                                                                                                        maxLines: 3,
                                                                                                                                                        overflow: TextOverflow.visible,
                                                                                                                                                        softWrap: true,
                                                                                                                                                      ),
                                                                                                                                                    ],
                                                                                                                                                  ),

                                                                                                                                                  SizedBox(height: 5), // Menambahkan jarak antara teks
                                                                                                                                                  Container(
                                                                                                                                                    width: screenWidth * 0.30,
                                                                                                                                                    // color: const Color.fromARGB(255, 33, 243, 68),
                                                                                                                                                    child: Text(
                                                                                                                                                      _formatDateTimeToOriginal(surveyData['created_at'] ?? 'N/A'),
                                                                                                                                                      // '14 August 2024 | 14:30',
                                                                                                                                                      style: TextStyle(fontSize: fontSize * 0.03),
                                                                                                                                                      maxLines: 3,
                                                                                                                                                      overflow: TextOverflow.visible,
                                                                                                                                                      softWrap: true,
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  SizedBox(
                                                                                                                    height: screenWidth * 0.05,
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            // color: Colors.blue,
                                                                                                                            // width: screenWidth * 0.5,
                                                                                                                            child: Padding(
                                                                                                                              padding: const EdgeInsets.only(
                                                                                                                                top: 0,
                                                                                                                              ),
                                                                                                                              child: Column(
                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  Row(
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      Container(
                                                                                                                                        child: Text(
                                                                                                                                          'MASALAH HAMA ',
                                                                                                                                          style: TextStyle(fontSize: fontSize * 0.03, color: Colors.grey),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                  Row(
                                                                                                                                    children: [
                                                                                                                                      Padding(
                                                                                                                                        padding: const EdgeInsets.only(top: 5, left: 0),
                                                                                                                                        child: Column(
                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                          children: [
                                                                                                                                            // Add some spacing
                                                                                                                                            Container(
                                                                                                                                              width: screenWidth * 0.8,
                                                                                                                                              // color: const Color.fromARGB(255, 7, 255, 172),
                                                                                                                                              child: Column(
                                                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                children: [
                                                                                                                                                  Text(
                                                                                                                                                    displayHamaData(),
                                                                                                                                                    style: TextStyle(
                                                                                                                                                      fontSize: fontSize * 0.03,
                                                                                                                                                      color: Color.fromARGB(255, 7, 10, 113),
                                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                                    ),
                                                                                                                                                    maxLines: 3,
                                                                                                                                                    overflow: TextOverflow.visible,
                                                                                                                                                    softWrap: true,
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  SizedBox(
                                                                                                                    height: screenWidth * 0.03,
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            // color: const Color.fromARGB(255, 33, 243, 72),
                                                                                                                            width: screenWidth * 0.8,
                                                                                                                            child: Padding(
                                                                                                                              padding: const EdgeInsets.only(
                                                                                                                                top: 10,
                                                                                                                              ),
                                                                                                                              child: Column(
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  Row(
                                                                                                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      Container(
                                                                                                                                        child: Text(
                                                                                                                                          'PERMINTAAN SURVEY',
                                                                                                                                          style: TextStyle(fontSize: fontSize * 0.03, color: Colors.grey),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                  Row(
                                                                                                                                    children: [
                                                                                                                                      Padding(
                                                                                                                                        padding: const EdgeInsets.only(top: 5, left: 0),
                                                                                                                                        child: Column(
                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                          children: [
                                                                                                                                            // Add some spacing
                                                                                                                                            Container(
                                                                                                                                              // width: screenWidth * 0.5,
                                                                                                                                              // color: Colors.blue,
                                                                                                                                              child: Row(
                                                                                                                                                children: [
                                                                                                                                                  Text(
                                                                                                                                                    surveyData['jadwal'] != null && surveyData['jadwal'].isNotEmpty ? formatTanggal(surveyData['jadwal']) : 'N/A',
                                                                                                                                                    overflow: TextOverflow.clip,
                                                                                                                                                    style: TextStyle(fontSize: fontSize * 0.03, color: Color.fromARGB(255, 7, 10, 113), fontWeight: FontWeight.bold),
                                                                                                                                                  ),
                                                                                                                                                  Text(' - '),
                                                                                                                                                  Text(
                                                                                                                                                    surveyData['jam'] != null && surveyData['jam'].isNotEmpty
                                                                                                                                                        ? DateFormat.Hm().format(DateTime.parse('${surveyData['jadwal']} ${surveyData['jam']}')) // Parse and format
                                                                                                                                                        : 'N/A',
                                                                                                                                                    overflow: TextOverflow.clip,
                                                                                                                                                    style: TextStyle(
                                                                                                                                                      fontSize: fontSize * 0.03,
                                                                                                                                                      color: Color.fromARGB(255, 7, 10, 113),
                                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  SizedBox(
                                                                                                                    height: screenWidth * 0.03,
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: Alignment.centerLeft,
                                                                                                                        child: Container(
                                                                                                                          width: screenWidth * 0.8,
                                                                                                                          // color: const Color.fromARGB(255, 7, 255, 102),
                                                                                                                          child: Padding(
                                                                                                                            padding: const EdgeInsets.only(left: 0),
                                                                                                                            child: Column(
                                                                                                                              // mainAxisAlignment:
                                                                                                                              //     MainAxisAlignment.start,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Row(
                                                                                                                                  children: [
                                                                                                                                    Container(
                                                                                                                                      child: Text(
                                                                                                                                        'WHATSAPP ',
                                                                                                                                        style: TextStyle(fontSize: fontSize * 0.03, color: Colors.grey),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                                Row(
                                                                                                                                  children: [
                                                                                                                                    Container(
                                                                                                                                      child: Padding(
                                                                                                                                        padding: const EdgeInsets.only(
                                                                                                                                          top: 5,
                                                                                                                                        ),
                                                                                                                                        child: Column(
                                                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                          children: [
                                                                                                                                            Row(
                                                                                                                                              children: [
                                                                                                                                                Container(
                                                                                                                                                  // color: Colors.blu/
                                                                                                                                                  child: Text(
                                                                                                                                                    '${surveyData['wa'] ?? 'N/A'}',
                                                                                                                                                    overflow: TextOverflow.clip,
                                                                                                                                                    style: TextStyle(fontSize: fontSize * 0.03, color: Color.fromARGB(255, 7, 10, 113), fontWeight: FontWeight.bold),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ],
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  SizedBox(
                                                                                                                    height: screenWidth * 0.03,
                                                                                                                  ),
                                                                                                                  Column(
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: Alignment.centerLeft,
                                                                                                                        child: Row(
                                                                                                                          children: [
                                                                                                                            Container(
                                                                                                                              // color: Colors.blue,
                                                                                                                              width: screenWidth * 0.8,
                                                                                                                              child: Column(
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  Row(
                                                                                                                                    children: [
                                                                                                                                      Container(
                                                                                                                                        child: Text(
                                                                                                                                          'PROVINSI ',
                                                                                                                                          style: TextStyle(fontSize: fontSize * 0.03, color: Colors.grey),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                  Row(
                                                                                                                                    children: [
                                                                                                                                      Column(
                                                                                                                                        children: [
                                                                                                                                          Container(
                                                                                                                                            child: Column(
                                                                                                                                              // mainAxisAlignment:
                                                                                                                                              //     MainAxisAlignment.start,
                                                                                                                                              children: [
                                                                                                                                                Text(
                                                                                                                                                  '${surveyData['provinsi'] ?? 'N/A'}',
                                                                                                                                                  // 'DKI Jakarta',
                                                                                                                                                  style: TextStyle(fontSize: fontSize * 0.03, color: Color.fromARGB(255, 7, 10, 113), fontWeight: FontWeight.bold),
                                                                                                                                                ),
                                                                                                                                              ],
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  SizedBox(
                                                                                                                    height: screenWidth * 0.03,
                                                                                                                  ),
                                                                                                                  Column(
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: screenWidth * 0.8,
                                                                                                                            // color: Colors.blue,
                                                                                                                            child: Column(
                                                                                                                              // mainAxisAlignment:
                                                                                                                              //     MainAxisAlignment.start,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Row(
                                                                                                                                  children: [
                                                                                                                                    Container(
                                                                                                                                      child: Text(
                                                                                                                                        'KOTA / KAB',
                                                                                                                                        style: TextStyle(fontSize: fontSize * 0.03, color: Colors.grey),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                                Row(
                                                                                                                                  children: [
                                                                                                                                    Padding(
                                                                                                                                      padding: const EdgeInsets.only(top: 5, left: 0),
                                                                                                                                      child: Column(
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                        children: [
                                                                                                                                          // Add some spacing
                                                                                                                                          Container(
                                                                                                                                            width: screenWidth * 0.8,
                                                                                                                                            // color: const Color.fromARGB(255, 33, 243, 79),
                                                                                                                                            child: Text(
                                                                                                                                              '${surveyData['kota'] ?? 'N/A'}',
                                                                                                                                              // overflow: TextOverflow.clip,
                                                                                                                                              style: TextStyle(fontSize: fontSize * 0.03, color: Color.fromARGB(255, 7, 10, 113), fontWeight: FontWeight.bold),
                                                                                                                                              maxLines: 3,
                                                                                                                                              overflow: TextOverflow.visible,
                                                                                                                                              softWrap: true,
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  SizedBox(
                                                                                                                    height: screenWidth * 0.03,
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            // color: Colors.red,
                                                                                                                            width: screenWidth * 0.8,
                                                                                                                            child: Column(
                                                                                                                              // mainAxisAlignment:
                                                                                                                              //     MainAxisAlignment.start,
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Row(
                                                                                                                                  children: [
                                                                                                                                    Container(
                                                                                                                                      child: Text(
                                                                                                                                        'ALAMAT LENGKAP ',
                                                                                                                                        style: TextStyle(fontSize: fontSize * 0.03, color: Colors.grey),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                                // SizedBox(
                                                                                                                                //   height: 15,
                                                                                                                                // ),
                                                                                                                                Row(
                                                                                                                                  children: [
                                                                                                                                    Column(
                                                                                                                                      children: [
                                                                                                                                        Container(
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Row(
                                                                                                                                                children: [
                                                                                                                                                  Container(
                                                                                                                                                    // color: Colors.blue,
                                                                                                                                                    width: screenWidth * 0.8,
                                                                                                                                                    child: Text(
                                                                                                                                                      '${surveyData['alamat'] ?? 'N/A'}',
                                                                                                                                                      // overflow: TextOverflow.clip,
                                                                                                                                                      style: TextStyle(fontSize: fontSize * 0.03, color: Color.fromARGB(255, 7, 10, 113), fontWeight: FontWeight.bold),
                                                                                                                                                      maxLines: 3,
                                                                                                                                                      overflow: TextOverflow.visible,
                                                                                                                                                      softWrap: true,
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  SizedBox(
                                                                                                                    height: screenWidth * 0.06,
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            // color: const Color.fromARGB(255, 240, 243, 33),
                                                                                                                            width: screenWidth * 0.8,
                                                                                                                            child: Column(
                                                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Row(
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                  children: [
                                                                                                                                    ElevatedButton(
                                                                                                                                        style: ElevatedButton.styleFrom(
                                                                                                                                          foregroundColor: Colors.white,
                                                                                                                                          backgroundColor: Colors.blue,
                                                                                                                                        ),
                                                                                                                                        onPressed: () {
                                                                                                                                          Navigator.pushAndRemoveUntil(
                                                                                                                                            context,
                                                                                                                                            PageRouteBuilder(
                                                                                                                                              pageBuilder: (context, animation, secondaryAnimation) => homePage(
                                                                                                                                                isRegistered: false,
                                                                                                                                                // login: false,
                                                                                                                                                isLoggedIn: false,
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            (route) => false, // Menghapus semua rute sebelumnya
                                                                                                                                          );
                                                                                                                                        },
                                                                                                                                        child: Text(
                                                                                                                                          'Ke Home',
                                                                                                                                          style: TextStyle(fontSize: fontSize * 0.03),
                                                                                                                                        )),
                                                                                                                                  ],
                                                                                                                                )
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      // SizedBox(height: 30),
                                                                    ]),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          } else {
                                            return Center(
                                                child: Text('No data found'));
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

// String _generateHamaDisplayText(String hamaNames, String hama_lainnya) {
//   if (hama_lainnya != null && hamaNames == null) {
//     return ' $hama_lainnya';
//   } else if (hamaNames != null && hama_lainnya == null) {
//     return ' $hamaNames ++';
//   } else if (hamaNames != null && hama_lainnya != null) {
//     return ' $hamaNames, $hama_lainnya';
//   } else {
//     return 'No hama data available.';
//   }
// }

class TsClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start the path at the top-left corner
    path.moveTo(0, 0);

    // Variables to control wave creation
    var curXPos = 0.0;
    var curYPos = 0.0;
    var increment = size.width / 20;

    // Create the arc pattern along the top edge, with the wave going upwards
    while (curXPos < size.width) {
      curXPos += increment;
      path.arcToPoint(
        Offset(curXPos, curYPos == 0 ? 20 : 0), // Move the wave upwards
        radius: Radius.circular(5), // Adjust the radius for smoother arcs
        clockwise: curYPos == 0,
      );
      curYPos =
          curYPos == 0 ? 10 : 0; // Alternate Y position to create the wave
    }

    // Draw the path down the right side, across the bottom, and back up the left side
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TsClip3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // Start the path at the top-left corner
    path.moveTo(0, 0);

    // Initialize the current positions at the top-left corner
    var curXPos = 0.0;
    var curYPos = 0.0;

    // Set the wave increment based on the width
    var increment = size.width / 30;

    // Create the wave pattern along the top edge
    while (curXPos < size.width) {
      curXPos += increment;
      curYPos =
          curYPos == 0 ? 10 : 0; // Invert the wave pattern for the top edge
      path.lineTo(curXPos, curYPos);
    }

    // Draw the path down the right side, across the bottom, and back up the left side
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
