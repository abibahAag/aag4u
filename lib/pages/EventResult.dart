import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class EventResult extends StatefulWidget {
  final int EventId;
  final String dated;

  EventResult({
    required this.EventId,
    required this.dated,
  });

  @override
  State<EventResult> createState() => _SurveyResultWidgetState();
}

class _SurveyResultWidgetState extends State<EventResult> {
  Map<String, dynamic>? eventData;

  @override
  void initState() {
    super.initState();
    _fetchSurveyData();
  }

  Future<Map<String, dynamic>> _fetchSurveyData() async {
    await initializeDateFormatting('id_ID', null);
    final response = await http.get(
      Uri.parse('https://app.aag4u.co.id/api/getEventOneBy/${widget.EventId}'),
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

  String formatDateID(String date) {
    final parsedDate = DateTime.parse(date);
    return DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width * 1;
    double containerWidth = MediaQuery.of(context).size.width * 0.9;
    double inWidth = MediaQuery.of(context).size.width * 0.8;

    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final List<dynamic> dropdownItems;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 101, 255),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            margin: EdgeInsets.only(top: screenHeight * 0.03),
            // color: Color.fromARGB(255, 18, 213, 70),
            // color: Colors.blue,
            width: screenWidth * 1.0,
            height: screenHeight * 1.5,
            // decoration: BoxDecoration(
            //     // color: Color.fromARGB(255, 18, 213, 70),
            //     ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // color: Colors.blue,
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
                                          'images/icons/successEvent.png',
                                          width: iconSize * 0.2),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Berhasil Bergabung',
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
                                    'Terima kasih telah ikut serta dalam acara kami,',
                                    style: TextStyle(
                                        fontSize: fontSize * 0.04,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Mohon bergabung 5 menit sebelum dimulai',
                                    style: TextStyle(
                                        fontSize: fontSize * 0.04,
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
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child:
                                            Text('Error: ${snapshot.error}'));
                                  } else if (snapshot.hasData) {
                                    final data = snapshot.data!;
                                    final eventData =
                                        data['event'] as Map<String, dynamic>;

                                    // final hama_lainnya =
                                    //     eventData['kategori']
                                    //         as String?;
                                    final kate =
                                        data['kategori'] as List<dynamic>;

                                    // Get the hama names from the list
                                    final kateNames = kate
                                        .map((kate) =>
                                            (kate as Map<String, dynamic>)[
                                                'name'] ??
                                            'No name')
                                        .join(', ');

                                    // Handle the conditions for displaying hama names and hama_lainnya
                                    String displayHamaData() {
                                      // if (hamaNames.isNotEmpty &&
                                      //     (hama_lainnya?.isNotEmpty ??
                                      //         false)) {
                                      //   // Both hamaNames and hama_lainnya have values
                                      //   return '$hamaNames, $hama_lainnya';
                                      // } else if (hamaNames.isNotEmpty &&
                                      // (hama_lainnya?.isEmpty ??
                                      //         true)) {
                                      //   // Only hamaNames has a value
                                      //   return hamaNames;
                                      // } else if (hamaNames.isEmpty &&
                                      //     (hama_lainnya?.isNotEmpty ??
                                      //         false)) {
                                      // Only hama_lainnya has a value
                                      return kateNames;
                                      // }
                                      // return 'No data available';
                                    }

                                    String _formatDateTimeToOriginal(
                                        String dateTime) {
                                      if (dateTime == 'N/A') return 'N/A';

                                      DateTime parsedDate =
                                          DateTime.parse(dateTime)
                                              .toUtc()
                                              .add(Duration(hours: 7));
                                      String formattedDateTime =
                                          DateFormat('yyyy-MM-dd HH:mm:ss')
                                              .format(parsedDate);

                                      return formattedDateTime;
                                    }

                                    return Column(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          // mainAxisAlignment:
                                          // MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 30),
                                              child: Column(children: [
                                                ClipPath(
                                                  clipper: TsClip3(),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: screenWidth * 0.9,
                                                    height: screenHeight * 0.8,
                                                    // color: Color.fromARGB(255, 16, 195, 201),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    // color: Color.fromARGB(255, 222, 26, 26),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 30),
                                                              child: Container(
                                                                // color: const Color
                                                                //     .fromARGB(
                                                                //     255,
                                                                //     57,
                                                                //     7,
                                                                //     255),
                                                                width:
                                                                    screenWidth *
                                                                        0.85,
                                                                height:
                                                                    screenHeight *
                                                                        0.7,
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      // mainAxisAlignment:
                                                                      //     MainAxisAlignment
                                                                      //         .start,
                                                                      children: [
                                                                        Column(
                                                                          // crossAxisAlignment:
                                                                          //     CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(
                                                                                left: 0,
                                                                              ),
                                                                              child: Row(
                                                                                children: [
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    top: 10,
                                                                                                  ),
                                                                                                  child: Image.asset(
                                                                                                    'images/icons/aagu.png',
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
                                                                                                          alignment: Alignment.topRight,
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsets.only(
                                                                                                              top: 0,
                                                                                                            ),
                                                                                                            child: Column(
                                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Row(
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'WAKTU PERMINTAAN',
                                                                                                                      style: TextStyle(fontSize: fontSize * 0.03),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                SizedBox(height: 5), // Menambahkan jarak antara teks

                                                                                                                Text(
                                                                                                                  _formatDateTimeToOriginal(widget.dated ?? 'N/A'),
                                                                                                                  style: TextStyle(fontSize: fontSize * 0.03),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
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
                                                                                      SizedBox(
                                                                                        height: screenHeight * 0.03,
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Column(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Container(
                                                                                                // color: Colors.blue,
                                                                                                // width: inWidth,
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    top: 10,
                                                                                                  ),
                                                                                                  child: Column(
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            child: Text(
                                                                                                              'KATEGORI',
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
                                                                                                                  // width: inWidth,
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
                                                                                        height: screenHeight * 0.03,
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        children: [
                                                                                          Column(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Container(
                                                                                                // width: inWidth,
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    top: 10,
                                                                                                  ),
                                                                                                  child: Column(
                                                                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            // color: Colors.blue,
                                                                                                            // width: inWidth,
                                                                                                            child: Text(
                                                                                                              'TEMA',
                                                                                                              style: TextStyle(fontSize: fontSize * 0.03, color: Colors.grey),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        height: screenHeight * 0.01,
                                                                                                      ),
                                                                                                      Container(
                                                                                                        // color: const Color.fromARGB(255, 68, 255, 77),
                                                                                                        width: screenWidth * 0.80,
                                                                                                        height: screenHeight * 0.06,
                                                                                                        child: Row(
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Flexible(
                                                                                                              // Agar teks tetap dalam batas container
                                                                                                              child: Text(
                                                                                                                eventData['judul'],
                                                                                                                style: TextStyle(
                                                                                                                  fontSize: fontSize * 0.03,
                                                                                                                  color: Colors.black,
                                                                                                                  // fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                                maxLines: 4,
                                                                                                                overflow: TextOverflow.visible,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      )
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: screenHeight * 0.02,
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: Alignment.centerLeft,
                                                                                            child: Container(
                                                                                              // color: Colors.blue,
                                                                                              // width: inWidth,
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
                                                                                                            'TANGGAL ',
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
                                                                                                                      // color: Colors.blue,
                                                                                                                      // width: inWidth,
                                                                                                                      child: Text(
                                                                                                                        formatDateID(eventData['tgl']),
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
                                                                                        height: screenHeight * 0.03,
                                                                                      ),
                                                                                      Column(
                                                                                        children: [
                                                                                          Row(
                                                                                            children: [
                                                                                              Container(
                                                                                                // color: Colors.blue,
                                                                                                // width: inWidth,
                                                                                                child: Column(
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          child: Text(
                                                                                                            'WAKTU ',
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
                                                                                                                    '${formatTime(eventData['mulai'])} - ${formatTime(eventData['akhir'])} WIB',
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
                                                                                        ],
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: screenHeight * 0.03,
                                                                                      ),
                                                                                      Column(
                                                                                        children: [
                                                                                          Row(
                                                                                            children: [
                                                                                              Container(
                                                                                                // color: Colors.blue,
                                                                                                // width: inWidth,
                                                                                                child: Column(
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          child: Text(
                                                                                                            'LOKASI',
                                                                                                            style: TextStyle(fontSize: fontSize * 0.03, color: Colors.grey),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    // Row(
                                                                                                    //   children: [
                                                                                                    //     Column(
                                                                                                    //       children: [
                                                                                                    //         Column(
                                                                                                    //           // mainAxisAlignment:
                                                                                                    //           //     MainAxisAlignment.start,
                                                                                                    //           children: [
                                                                                                    //             Text(
                                                                                                    //               '${surveyData['kota'] ?? 'N/A'}',
                                                                                                    //               style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 7, 10, 113), fontWeight: FontWeight.bold),
                                                                                                    //               // maxLines: 3,
                                                                                                    //               overflow: TextOverflow.visible,
                                                                                                    //               // softWrap: true,
                                                                                                    //             ),
                                                                                                    //           ],
                                                                                                    //         ),
                                                                                                    //       ],
                                                                                                    //     ),
                                                                                                    //   ],
                                                                                                    // ),

                                                                                                    Row(
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsets.only(top: 5, left: 0),
                                                                                                          child: Column(
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              // Add some spacing
                                                                                                              Container(
                                                                                                                // width: inWidth,
                                                                                                                // color: Colors.blue,
                                                                                                                child: Text(
                                                                                                                  '${eventData['lokasi'] ?? 'N/A'}',
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
                                                                                        height: screenHeight * 0.06,
                                                                                      ),
                                                                                      Center(
                                                                                        child: Column(
                                                                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Container(
                                                                                                  // color: const Color.fromARGB(255, 243, 33, 117),
                                                                                                  width: screenWidth * 0.80,
                                                                                                  child: Column(
                                                                                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          ElevatedButton(
                                                                                                              style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blue),
                                                                                                              onPressed: () {
                                                                                                                Navigator.pushAndRemoveUntil(
                                                                                                                  context,
                                                                                                                  PageRouteBuilder(
                                                                                                                    pageBuilder: (context, animation, secondaryAnimation) => homePage(
                                                                                                                      isRegistered: false,
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
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Center(child: Text('No data found'));
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
