// // import 'dart:convert';
// // import 'dart:ffi';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_aag4u/Menu_simulasi_harga/widget/HasilHargaWidget.dart';
// // import 'package:http/http.dart' as http;

// // // Model class for Cabang
// // class Cabang {
// //   final int id;
// //   final String nama_cabang;

// //   Cabang({required this.id, required this.nama_cabang});

// //   factory Cabang.fromJson(Map<String, dynamic> json) {
// //     return Cabang(
// //       id: json['id'],
// //       nama_cabang: json['nama_cabang'],
// //     );
// //   }
// // }

// // // class Luasan {
// // //   final int id;
// // //   final String ukuran_luasan;

// // //   Luasan({required this.id, required this.ukuran_luasan});

// // //   factory Luasan.fromJson(Map<String, dynamic> json) {
// // //     return Luasan(
// // //       id: json['id'],
// // //       ukuran_luasan: json['ukuran_luasan'],
// // //     );
// // //   }
// // // }

// // // Model class for Pekerjaan
// // class Pekerjaan {
// //   final int id;
// //   final String nama_pekerjaan;

// //   Pekerjaan({required this.id, required this.nama_pekerjaan});

// //   factory Pekerjaan.fromJson(Map<String, dynamic> json) {
// //     return Pekerjaan(
// //       id: json['id'],
// //       nama_pekerjaan: json['nama_pekerjaan'],
// //     );
// //   }
// // }

// // // Model class for Segment
// // class Segment {
// //   final int id;
// //   final String area_segmentasi;

// //   Segment({required this.id, required this.area_segmentasi});

// //   factory Segment.fromJson(Map<String, dynamic> json) {
// //     return Segment(
// //       id: json['id'],
// //       area_segmentasi: json['area_segmentasi'],
// //     );
// //   }
// // }

// // class SimulasiHargaWidget extends StatefulWidget {
// //   @override
// //   _SimulasiHargaWidgetState createState() => _SimulasiHargaWidgetState();
// // }

// // class _SimulasiHargaWidgetState extends State<SimulasiHargaWidget> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _formKey2 = GlobalKey<FormState>();

// //   Future<List<Cabang>>? futureCabang;
// //   Future<List<Pekerjaan>>? futurePekerjaan;
// //   Future<List<Segment>>? futureSegment;
// //   List<dynamic> dropdownItems = [];

// //   // List<Map<String, dynamic>> dropdownItems = [];
// //   // List<dynamic> futureHarga = [];

// //   Cabang? selectedCabang;
// //   Pekerjaan? selectedPekerjaan;
// //   Segment? selectedSegment;
// //   String? selectedItem;
// //   String? futureHarga;
// //      String? selectedPrice;

// //   String? harga; // Variable untuk menyimpan harga

// //   @override
// //   void initState() {
// //     super.initState();
// //     futureCabang = fetchCabang();
// //     futurePekerjaan = fetchPekerjaan();
// //     futureSegment = fetchSegment();
// //     //  fetchDropdownItems();
// //   }

// //   Future<List<Cabang>> fetchCabang() async {
// //     final response =
// //         await http.get(Uri.parse('https://www.app.aag4u.co.id/api/getBranch'));
// //     if (response.statusCode == 200) {
// //       List jsonResponse = json.decode(response.body);
// //       return jsonResponse.map((data) => Cabang.fromJson(data)).toList();
// //     } else {
// //       throw Exception('Failed to load cabang');
// //     }
// //   }

// //   Future<List<Pekerjaan>> fetchPekerjaan() async {
// //     final response =
// //         await http.get(Uri.parse('https://www.app.aag4u.co.id/api/getWork'));
// //     if (response.statusCode == 200) {
// //       List jsonResponse = json.decode(response.body);
// //       return jsonResponse.map((data) => Pekerjaan.fromJson(data)).toList();
// //     } else {
// //       throw Exception('Failed to load pekerjaan');
// //     }
// //   }

// //   Future<List<Segment>> fetchSegment() async {
// //     final response =
// //         await http.get(Uri.parse('https://www.app.aag4u.co.id/api/getSegment'));
// //     if (response.statusCode == 200) {
// //       List jsonResponse = json.decode(response.body);
// //       return jsonResponse.map((data) => Segment.fromJson(data)).toList();
// //     } else {
// //       throw Exception('Failed to load Segment');
// //     }
// //   }

// //   void _submitForm() async {
// //     if (_formKey.currentState!.validate()) {
// //       _formKey.currentState!.save();
// //       // Create data to send
// //       final data = {
// //         'cabang': selectedCabang?.id,
// //         'kerjaan': selectedPekerjaan?.id,
// //         'segmen': selectedSegment?.id,
// //       };

// //       // Send data to the API
// //       final response = await http.post(
// //         Uri.parse('https://app.aag4u.co.id/api/getAreaBy'),
// //         headers: {'Content-Type': 'application/json'},
// //         // body: json.encode({'luasan': selectedItem}),
// //         body: json.encode(data),
// //       );

// //       if (response.statusCode == 200) {
// //         // Handle successful response
// //         final responseData = json.decode(response.body) as List<dynamic>;
// //         setState(() {
// //           dropdownItems = responseData;
// //         });
// //          // Navigate to the next page
// //          print(dropdownItems);
// //           Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => HasilHargaWidget(dropdownItems: dropdownItems),
// //           ),
// //         );
// //       } else {
// //         // Handle error response
// //         print('Failed to submit data: ${response.statusCode}');
// //       }
// //     }
// //   }

// //   void _cekFormm() async {
// //     if (_formKey2.currentState!.validate()) {
// //       _formKey2.currentState!.save();
// //       // Create data to send
// //       final data = {
// //         'luasan': dropdownItems,
// //       };

// //       // print('hjhjhjhj ${dropdownItems}  ');

// //       // Send data to the AP/I
// //       final response = await http.post(
// //         Uri.parse('https://app.aag4u.co.id/api/getResult'),
// //         headers: {'Content-Type': 'application/json'},
// //       // body: json.encode({'luasan': selectedItem}),
// //         body: json.encode(data),
// //       );

// //       // if (response.statusCode == 200) {
// //       //   final responseData = json.decode(response.body);
// //       //    if (responseData != null &&
// //       //       responseData['data'] != null &&
// //       //       responseData['data']['harga'] != null) {
// //       //     setState(() {
// //       //       futureHarga = responseData['data']['harga'].toString();
// //       //     });

// //       // } else {
// //       //   print('Failed to submit data: ${response.statusCode}');
// //       // }
// //       // }
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width * 0.9;
// //     double inWidth = MediaQuery.of(context).size.width * 0.8;

// //     return SingleChildScrollView(
// //         scrollDirection: Axis.vertical,
// //         child: Column(
// //             // crossAxisAlignment: CrossAxisAlignment.center,

// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 12.0, vertical: 15.0),
// //                     child: Column(
// //                       children: [
// //                         Container(
// //                           width: screenWidth,
// //                           height: 100,
// //                           alignment: Alignment.center,
// //                           decoration: BoxDecoration(
// //                             color: Color(0xFF233d63),
// //                             borderRadius: BorderRadius.circular(24),
// //                           ),
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               Row(
// //                                 mainAxisAlignment: MainAxisAlignment.center,
// //                                 children: [
// //                                   Text(
// //                                     "Simulasi Harga",
// //                                     style: TextStyle(
// //                                         fontSize: 35,
// //                                         fontWeight: FontWeight.bold,
// //                                         color: Colors.white),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(
// //                   horizontal: 12.0,
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Column(
// //                           children: [
// //                             Container(
// //                               width: screenWidth,
// //                               decoration: BoxDecoration(
// //                                 border: Border.all(
// //                                     style: BorderStyle.solid,
// //                                     color: Colors.grey),
// //                                 borderRadius:
// //                                     BorderRadius.all(Radius.circular(24)),
// //                               ),
// //                               child: Form(
// //                                 key: _formKey,
// //                                 child: Row(
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: [
// //                                       Column(
// //                                         children: [
// //                                           Container(
// //                                             // color: Colors.amber,
// //                                             // width: inWidth,
// //                                             height: 420,
// //                                             alignment: Alignment.center,
// //                                             child: Column(
// //                                               children: [
// //                                                 Row(
// //                                                   children: [
// //                                                     Padding(
// //                                                       padding:
// //                                                           const EdgeInsets.only(
// //                                                         top: 10,
// //                                                         bottom: 10,
// //                                                       ),
// //                                                       child: Column(
// //                                                         children: [
// //                                                           Row(
// //                                                             children: [
// //                                                               Column(
// //                                                                 children: [
// //                                                                   Container(
// //                                                                     child:
// //                                                                         Column(
// //                                                                       crossAxisAlignment:
// //                                                                           CrossAxisAlignment
// //                                                                               .start,
// //                                                                       children: [
// //                                                                         Row(
// //                                                                           children: [
// //                                                                             Column(
// //                                                                               children: <Widget>[
// //                                                                                 Container(
// //                                                                                   // color: Colors.blue,
// //                                                                                   // width:,

// //                                                                                   height: 30,
// //                                                                                   child: Text(
// //                                                                                     "CABANG",
// //                                                                                     style: TextStyle(
// //                                                                                       fontSize: 15,
// //                                                                                       fontWeight: FontWeight.bold,
// //                                                                                     ),
// //                                                                                   ),
// //                                                                                 )
// //                                                                               ],
// //                                                                             )
// //                                                                           ],
// //                                                                         ),
// //                                                                         Row(
// //                                                                           children: [
// //                                                                             Padding(
// //                                                                               padding: const EdgeInsets.all(0),
// //                                                                               child: Column(
// //                                                                                 children: [
// //                                                                                   FutureBuilder<List<Cabang>>(
// //                                                                                     future: futureCabang,
// //                                                                                     builder: (context, snapshot) {
// //                                                                                       if (snapshot.connectionState == ConnectionState.waiting) {
// //                                                                                         return Center(child: CircularProgressIndicator());
// //                                                                                       } else if (snapshot.hasError) {
// //                                                                                         return Center(child: Text('Error: ${snapshot.error}'));
// //                                                                                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //                                                                                         return Center(child: Text(''));
// //                                                                                       } else {
// //                                                                                         return Container(
// //                                                                                           width: inWidth,
// //                                                                                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //                                                                                           decoration: BoxDecoration(
// //                                                                                             borderRadius: BorderRadius.circular(8.0),
// //                                                                                             border: Border.all(color: Colors.grey),
// //                                                                                           ),
// //                                                                                           child: DropdownButtonFormField<Cabang>(
// //                                                                                             hint: Text('Pilih Cabang'),
// //                                                                                             value: selectedCabang,
// //                                                                                             onChanged: (Cabang? newValue) {
// //                                                                                               setState(() {
// //                                                                                                 selectedCabang = newValue;
// //                                                                                               });
// //                                                                                             },
// //                                                                                             items: snapshot.data!.map<DropdownMenuItem<Cabang>>((Cabang cabang) {
// //                                                                                               return DropdownMenuItem<Cabang>(
// //                                                                                                 value: cabang,
// //                                                                                                 child: Text(cabang.nama_cabang),
// //                                                                                               );
// //                                                                                             }).toList(),
// //                                                                                             isExpanded: true,
// //                                                                                             // validator: (value) => value == null ? 'Pilih Cabang' : null,
// //                                                                                             validator: (value) {
// //                                                                                               if (value == null) {
// //                                                                                                 return 'Pilih Cabang';
// //                                                                                               }
// //                                                                                               return null;
// //                                                                                             },
// //                                                                                             onSaved: (value) {
// //                                                                                               selectedCabang = value;
// //                                                                                             },

// //                                                                                             decoration: InputDecoration(
// //                                                                                               enabledBorder: UnderlineInputBorder(
// //                                                                                                 borderSide: BorderSide(color: Colors.grey),
// //                                                                                               ),
// //                                                                                               focusedBorder: UnderlineInputBorder(
// //                                                                                                 borderSide: BorderSide(color: Colors.grey),
// //                                                                                               ),
// //                                                                                             ),
// //                                                                                           ),
// //                                                                                         );
// //                                                                                       }
// //                                                                                     },
// //                                                                                   ),
// //                                                                                 ],
// //                                                                               ),
// //                                                                             ),
// //                                                                           ],
// //                                                                         ),
// //                                                                       ],
// //                                                                     ),
// //                                                                   ),
// //                                                                 ],
// //                                                               ),
// //                                                             ],
// //                                                           ),
// //                                                           SizedBox(height: 25),
// //                                                           Row(
// //                                                             children: [
// //                                                               Column(
// //                                                                 children: [
// //                                                                   Container(
// //                                                                     child:
// //                                                                         Column(
// //                                                                       crossAxisAlignment:
// //                                                                           CrossAxisAlignment
// //                                                                               .start,
// //                                                                       children: [
// //                                                                         Row(
// //                                                                           children: [
// //                                                                             Column(
// //                                                                               children: <Widget>[
// //                                                                                 Container(
// //                                                                                   // color: Colors.blue,
// //                                                                                   // width:,

// //                                                                                   height: 30,
// //                                                                                   child: Text(
// //                                                                                     "PEKERJAAN",
// //                                                                                     style: TextStyle(
// //                                                                                       fontSize: 15,
// //                                                                                       fontWeight: FontWeight.bold,
// //                                                                                     ),
// //                                                                                   ),
// //                                                                                 )
// //                                                                               ],
// //                                                                             )
// //                                                                           ],
// //                                                                         ),
// //                                                                         Row(
// //                                                                           children: [
// //                                                                             Padding(
// //                                                                               padding: const EdgeInsets.all(.0),
// //                                                                               child: Column(
// //                                                                                 children: [
// //                                                                                   FutureBuilder<List<Pekerjaan>>(
// //                                                                                     future: futurePekerjaan,
// //                                                                                     builder: (context, snapshot) {
// //                                                                                       if (snapshot.connectionState == ConnectionState.waiting) {
// //                                                                                         return Center(child: CircularProgressIndicator());
// //                                                                                       } else if (snapshot.hasError) {
// //                                                                                         return Center(child: Text('Error: ${snapshot.error}'));
// //                                                                                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //                                                                                         return Center(child: Text('No Data Available'));
// //                                                                                       } else {
// //                                                                                         return Container(
// //                                                                                           width: inWidth,
// //                                                                                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //                                                                                           decoration: BoxDecoration(
// //                                                                                             borderRadius: BorderRadius.circular(8.0),
// //                                                                                             border: Border.all(color: Colors.grey),
// //                                                                                           ),
// //                                                                                           child: DropdownButtonFormField<Pekerjaan>(
// //                                                                                             hint: Text('Pilih Pekerjaan'),
// //                                                                                             value: selectedPekerjaan,
// //                                                                                             onChanged: (Pekerjaan? newValue) {
// //                                                                                               setState(() {
// //                                                                                                 selectedPekerjaan = newValue;
// //                                                                                               });
// //                                                                                             },
// //                                                                                             items: snapshot.data!.map<DropdownMenuItem<Pekerjaan>>((Pekerjaan pekerjaan) {
// //                                                                                               return DropdownMenuItem<Pekerjaan>(
// //                                                                                                 value: pekerjaan,
// //                                                                                                 child: Text(pekerjaan.nama_pekerjaan),
// //                                                                                               );
// //                                                                                             }).toList(),
// //                                                                                             isExpanded: true,
// //                                                                                             // validator: (value) => value == null ? 'Pilih Pekerjaan' : null,

// //                                                                                             validator: (value) {
// //                                                                                               if (value == null) {
// //                                                                                                 return 'Pilih Pekerjaan';
// //                                                                                               }
// //                                                                                               return null;
// //                                                                                             },
// //                                                                                             onSaved: (value) {
// //                                                                                               selectedPekerjaan = value;
// //                                                                                             },
// //                                                                                             decoration: InputDecoration(
// //                                                                                               enabledBorder: UnderlineInputBorder(
// //                                                                                                 borderSide: BorderSide(color: Colors.grey),
// //                                                                                               ),
// //                                                                                               focusedBorder: UnderlineInputBorder(
// //                                                                                                 borderSide: BorderSide(color: Colors.grey),
// //                                                                                               ),
// //                                                                                             ),
// //                                                                                           ),
// //                                                                                         );
// //                                                                                       }
// //                                                                                     },
// //                                                                                   ),
// //                                                                                 ],
// //                                                                               ),
// //                                                                             ),
// //                                                                           ],
// //                                                                         ),
// //                                                                       ],
// //                                                                     ),
// //                                                                   ),
// //                                                                 ],
// //                                                               ),
// //                                                             ],
// //                                                           ),
// //                                                           SizedBox(height: 25),
// //                                                           Row(
// //                                                             children: [
// //                                                               Column(
// //                                                                 children: [
// //                                                                   Container(
// //                                                                     child:
// //                                                                         Column(
// //                                                                       crossAxisAlignment:
// //                                                                           CrossAxisAlignment
// //                                                                               .start,
// //                                                                       children: [
// //                                                                         Row(
// //                                                                           children: [
// //                                                                             Column(
// //                                                                               children: <Widget>[
// //                                                                                 Container(
// //                                                                                   // color: Colors.blue,
// //                                                                                   // width:,

// //                                                                                   height: 30,
// //                                                                                   child: Text(
// //                                                                                     "SEGMENT",
// //                                                                                     style: TextStyle(
// //                                                                                       fontSize: 15,
// //                                                                                       fontWeight: FontWeight.bold,
// //                                                                                     ),
// //                                                                                   ),
// //                                                                                 )
// //                                                                               ],
// //                                                                             )
// //                                                                           ],
// //                                                                         ),
// //                                                                         Row(
// //                                                                           children: [
// //                                                                             Padding(
// //                                                                               padding: const EdgeInsets.all(.0),
// //                                                                               child: Column(
// //                                                                                 children: [
// //                                                                                   FutureBuilder<List<Segment>>(
// //                                                                                     future: futureSegment,
// //                                                                                     builder: (context, snapshot) {
// //                                                                                       if (snapshot.connectionState == ConnectionState.waiting) {
// //                                                                                         return Center(child: CircularProgressIndicator());
// //                                                                                       } else if (snapshot.hasError) {
// //                                                                                         return Center(child: Text('Error: ${snapshot.error}'));
// //                                                                                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //                                                                                         return Center(child: Text('No Data Available'));
// //                                                                                       } else {
// //                                                                                         return Container(
// //                                                                                           width: inWidth,
// //                                                                                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //                                                                                           decoration: BoxDecoration(
// //                                                                                             borderRadius: BorderRadius.circular(8.0),
// //                                                                                             border: Border.all(color: Colors.grey),
// //                                                                                           ),
// //                                                                                           child: DropdownButtonFormField<Segment>(
// //                                                                                             hint: Text('Pilih Segment'),
// //                                                                                             value: selectedSegment,
// //                                                                                             onChanged: (Segment? newValue) {
// //                                                                                               setState(() {
// //                                                                                                 selectedSegment = newValue;
// //                                                                                               });
// //                                                                                             },
// //                                                                                             items: snapshot.data!.map<DropdownMenuItem<Segment>>((Segment segment) {
// //                                                                                               return DropdownMenuItem<Segment>(
// //                                                                                                 value: segment,
// //                                                                                                 child: Text(segment.area_segmentasi),
// //                                                                                               );
// //                                                                                             }).toList(),
// //                                                                                             isExpanded: true,
// //                                                                                             // validator: (value) => value == null ? 'Pilih Segment' : null,

// //                                                                                             validator: (value) {
// //                                                                                               if (value == null) {
// //                                                                                                 return 'Pilih Segment';
// //                                                                                               }
// //                                                                                               return null;
// //                                                                                             },
// //                                                                                             onSaved: (value) {
// //                                                                                               selectedSegment = value;
// //                                                                                             },
// //                                                                                             decoration: InputDecoration(
// //                                                                                               enabledBorder: UnderlineInputBorder(
// //                                                                                                 borderSide: BorderSide(color: Colors.grey),
// //                                                                                               ),
// //                                                                                               focusedBorder: UnderlineInputBorder(
// //                                                                                                 borderSide: BorderSide(color: Colors.grey),
// //                                                                                               ),
// //                                                                                             ),
// //                                                                                           ),
// //                                                                                         );
// //                                                                                       }
// //                                                                                     },
// //                                                                                   ),
// //                                                                                 ],
// //                                                                               ),
// //                                                                             ),
// //                                                                           ],
// //                                                                         ),
// //                                                                       ],
// //                                                                     ),
// //                                                                   ),
// //                                                                 ],
// //                                                               ),
// //                                                             ],
// //                                                           ),
// //                                                           SizedBox(height: 30),
// //                                                           Padding(
// //                                                             padding:
// //                                                                 const EdgeInsets
// //                                                                     .only(
// //                                                                     left: 150),
// //                                                             child: Row(
// //                                                               children: [
// //                                                                 ElevatedButton(
// //                                                                   style:
// //                                                                       ButtonStyle(
// //                                                                     backgroundColor: MaterialStateProperty.all<
// //                                                                             Color>(
// //                                                                         Color(
// //                                                                             0xFF233d63)),
// //                                                                   ),
// //                                                                   onPressed:
// //                                                                       _submitForm,
// //                                                                   child: Row(
// //                                                                     mainAxisAlignment:
// //                                                                         MainAxisAlignment
// //                                                                             .end,
// //                                                                     children: [
// //                                                                       Text(
// //                                                                         'Next',
// //                                                                         style: TextStyle(
// //                                                                             color:
// //                                                                                 Colors.white),
// //                                                                       ),
// //                                                                     ],
// //                                                                   ),
// //                                                                 ),
// //                                                               ],
// //                                                             ),
// //                                                           ),
// //                                                         ],
// //                                                       ),
// //                                                     ),
// //                                                   ],
// //                                                 ),
// //                                               ],
// //                                             ),
// //                                           ),
// //                                         ],
// //                                       ),
// //                                     ]),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),

// //                   ],
// //                 ),
// //               ),
// //             ]));
// //   }
// // }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_Simulasi_harga/widget/SurveyResultWidget.dart';
// import 'package:http/http.dart' as http;

// // Model class for Cabang
// class Hama {
//   final int id;
//   final String nama_hama;

//   Hama({required this.id, required this.nama_hama});

//   factory Hama.fromJson(Map<String, dynamic> json) {
//     return Hama(
//       id: json['id'],
//       nama_hama: json['nama_hama'],
//     );
//   }
// }

// class HamaItem {
//   final int id;
//   final String nama_hama;

//   HamaItem({required this.id, required this.nama_hama});

//   factory HamaItem.fromJson(Map<String, dynamic> json) {
//     return HamaItem(
//       id: json['id'],
//       nama_hama: json['nama_hama'],
//     );
//   }
// }

// // Model class for Pekerjaan
// class Provinsi {
//   final int id;
//   final String name;

//   Provinsi({required this.id, required this.name});

//   factory Provinsi.fromJson(Map<String, dynamic> json) {
//     return Provinsi(
//       id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
//       name: json['name'],
//     );
//   }
// }

// // Model class for Segment
// class Kota {
//   final int id;
//   final String name;

//   Kota({required this.id, required this.name});

//   factory Kota.fromJson(Map<String, dynamic> json) {
//     return Kota(
//       id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
//       name: json['name'],
//     );
//   }
// }

// class SimulasiHargaWidget extends StatefulWidget {
//   const SimulasiHargaWidget({super.key});
//   @override
//   _SimulasiHargaWidgetState createState() => _SimulasiHargaWidgetState();
// }

// class _SimulasiHargaWidgetState extends State<SimulasiHargaWidget> {
//   final _formKey = GlobalKey<FormState>();
//   final _formKey2 = GlobalKey<FormState>();

//   final TextEditingController _alamatController = TextEditingController();
//   final TextEditingController _waController = TextEditingController();

//   // List<String> _selectedItem = [];
//   Future<List<String>>? futureHama;
//   Future<List<Provinsi>>? futureProvinsi;
//   Future<List<Kota>>? futureKota;
//   // List<dynamic> dropdownItems = [];
//   late Future<List<HamaItem>> _futureItems;
//   // Set<int> _selectedItems = {}; // Use Set<int> to store IDs

//   List<Map<String, dynamic>> _selectedItems = [];
//   // List<dynamic> futureHarga = [];

//   HamaItem? _selectedItem;
//   // Hama? selectedHama;
//   Provinsi? selectedProvinsi;
//   Kota? selectedKota;
//   String? selectedItem;
//   String? futureHarga;
//   String? selectedPrice;

//   String? harga; // Variable untuk menyimpan harga

//   @override
//   void initState() {
//     super.initState();
//     // futureHama = fetchItems();
//     futureProvinsi = fetchProvinsi();

//     _futureItems = fetchItems();
//     _fetchItems();

//     // futureKota = fetchKota();
//     //  fetchDropdownItems();
//   }

//   void _onHamaSelected(HamaItem item) {
//     setState(() {
//       _selectedItem = item;
//     });
//   }

//   Future<List<HamaItem>> fetchItems() async {
//     final response =
//         await http.get(Uri.parse('https://app.aag4u.co.id/api/getPest'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((item) => HamaItem.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load items');
//     }
//   }

//   Future<List<Provinsi>> fetchProvinsi() async {
//     final response = await http.get(Uri.parse(
//         'https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json'));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => Provinsi.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load Provinsi');
//     }
//   }

//   Future<List<Kota>> fetchKota(int provinsiId) async {
//     final response = await http.get(Uri.parse(
//         'https://www.emsifa.com/api-wilayah-indonesia/api/regencies/$provinsiId.json'));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => Kota.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load Segment');
//     }
//   }

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       List<int> selectedHamaIds = _selectedItemIds.toList();

//       final data = {
//         'hama': selectedHamaIds,
//         'provinsi': selectedProvinsi?.name,
//         'kota': selectedKota?.name,
//         'alamat': _alamatController.text,
//         'wa': _waController.text,
//       };

//       print('Request data: $data');

//       final response = await http.post(
//         Uri.parse('https://app.aag4u.co.id/api/survey'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(data),
//       );

//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body) as Map<String, dynamic>;
//         final surveyId = responseData['idi'];

//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SurveyResultWidget(surveyId: surveyId),
//           ),
//         );
//       } else {
//         print('Failed to submit data: ${response.statusCode}');
//       }
//     }
//   }

//   List<HamaItem> _items = [];
//   Set<int> _selectedItemIds = {};
//   String? _selectedText;

//   Future<void> _fetchItems() async {
//     try {
//       _items = await fetchItems();
//       setState(() {});
//     } catch (error) {
//       print('Error fetching items: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;
//     double titleWidth = MediaQuery.of(context).size.width * 0.8;

//     double inWidth = MediaQuery.of(context).size.width * 0.8;
//     double inputWidth = MediaQuery.of(context).size.width * 0.8;

//     return Scaffold(
//       appBar: AppBar(
//           automaticallyImplyLeading: true,
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
//           children: [
//             SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 12.0, vertical: 15.0),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   width: screenWidth,
//                                   height: 100,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFF233d63),
//                                     borderRadius: BorderRadius.circular(24),
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             "Permintaan Survey",
//                                             style: TextStyle(
//                                                 fontSize: 25,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 0, right: 0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Container(
//                                       width: screenWidth,
//                                       height: 750,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             style: BorderStyle.solid,
//                                             color: Colors.grey),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(24)),
//                                       ),
//                                       child: Form(
//                                         key: _formKey,
//                                         child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Column(
//                                                 children: [
//                                                   Row(
//                                                     // mainAxisAlignment: MainAxisAlignment.center,
//                                                     children: [
//                                                       Container(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                                 top: 10),
//                                                         child: Center(
//                                                           child: Column(
//                                                             // crossAxisAlignment:
//                                                             //     CrossAxisAlignment.center,
//                                                             children: [
//                                                               Row(
//                                                                 children: [
//                                                                   Container(
//                                                                     // color: Colors.amber,
//                                                                     width:
//                                                                         inWidth,
//                                                                     height: 700,
//                                                                     alignment:
//                                                                         Alignment
//                                                                             .center,
//                                                                     child:
//                                                                         Padding(
//                                                                       padding:
//                                                                           const EdgeInsets
//                                                                               .only(
//                                                                         top: 10,
//                                                                         bottom:
//                                                                             10,
//                                                                       ),
//                                                                       child:
//                                                                           Column(
//                                                                         children: [
//                                                                           Row(
//                                                                             children: [
//                                                                               Column(
//                                                                                 children: [
//                                                                                   Container(
//                                                                                     child: Column(
//                                                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                       children: [
//                                                                                         Row(
//                                                                                           children: [
//                                                                                             Column(
//                                                                                               children: <Widget>[
//                                                                                                 Container(
//                                                                                                   // color: Colors.blue,
//                                                                                                   // width:,

//                                                                                                   height: 30,
//                                                                                                   child: Text(
//                                                                                                     "HAMA",
//                                                                                                     style: TextStyle(
//                                                                                                       fontSize: 15,
//                                                                                                       fontWeight: FontWeight.bold,
//                                                                                                     ),
//                                                                                                   ),
//                                                                                                 )
//                                                                                               ],
//                                                                                             )
//                                                                                           ],
//                                                                                         ),
//                                                                                         Row(
//                                                                                           children: [
//                                                                                             Padding(
//                                                                                               padding: const EdgeInsets.all(0),
//                                                                                               child: Column(
//                                                                                                 children: [
//                                                                                                   FutureBuilder<List<HamaItem>>(
//                                                                                                     future: _futureItems,
//                                                                                                     builder: (context, snapshot) {
//                                                                                                       if (snapshot.connectionState == ConnectionState.waiting) {
//                                                                                                         return Center(child: CircularProgressIndicator());
//                                                                                                       } else if (snapshot.hasError) {
//                                                                                                         return Center(child: Text('Error: ${snapshot.error}'));
//                                                                                                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                                                                                                         return Center(child: Text('No items found.'));
//                                                                                                       } else {
//                                                                                                         final items = snapshot.data!;

//                                                                                                         return Container(
//                                                                                                           width: inWidth,
//                                                                                                           height: 80,
//                                                                                                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                                                                                                           decoration: BoxDecoration(
//                                                                                                             borderRadius: BorderRadius.circular(8.0),
//                                                                                                             border: Border.all(color: Colors.grey),
//                                                                                                           ),
//                                                                                                           child: GestureDetector(
//                                                                                                             onTap: _showSelectHamaDialog,
//                                                                                                             child: AbsorbPointer(
//                                                                                                               child: DropdownButtonFormField<String>(
//                                                                                                                 value: _selectedText,
//                                                                                                                 decoration: InputDecoration(
//                                                                                                                   contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                                                                                                                   border: OutlineInputBorder(),
//                                                                                                                 ),
//                                                                                                                 items: [_selectedText].map((text) {
//                                                                                                                   return DropdownMenuItem<String>(
//                                                                                                                     value: text,
//                                                                                                                     child: Container(
//                                                                                                                       constraints: BoxConstraints(maxWidth: 200), // Limit the width
//                                                                                                                       child: Text(
//                                                                                                                         text ?? 'Select Hama',
//                                                                                                                         softWrap: true,
//                                                                                                                         overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
//                                                                                                                         maxLines: 2, // Limit to 2 lines
//                                                                                                                       ),
//                                                                                                                     ),
//                                                                                                                   );
//                                                                                                                 }).toList(),
//                                                                                                                 onChanged: (_) {},
//                                                                                                               ),
//                                                                                                             ),
//                                                                                                           ),
//                                                                                                         );
//                                                                                                       }
//                                                                                                     },
//                                                                                                   ),
//                                                                                                 ],
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ],
//                                                                                     ),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                               height: 20),
//                                                                           Row(
//                                                                             children: [
//                                                                               Column(
//                                                                                 children: [
//                                                                                   Container(
//                                                                                     child: Column(
//                                                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                       children: [
//                                                                                         Row(
//                                                                                           children: [
//                                                                                             Column(
//                                                                                               children: <Widget>[
//                                                                                                 Container(
//                                                                                                   // color: Colors.blue,
//                                                                                                   // width:,

//                                                                                                   height: 30,
//                                                                                                   child: Text(
//                                                                                                     "PROVINSI",
//                                                                                                     style: TextStyle(
//                                                                                                       fontSize: 15,
//                                                                                                       fontWeight: FontWeight.bold,
//                                                                                                     ),
//                                                                                                   ),
//                                                                                                 )
//                                                                                               ],
//                                                                                             )
//                                                                                           ],
//                                                                                         ),
//                                                                                         Row(
//                                                                                           children: [
//                                                                                             Padding(
//                                                                                               padding: const EdgeInsets.all(.0),
//                                                                                               child: Column(
//                                                                                                 children: [
//                                                                                                   FutureBuilder<List<Provinsi>>(
//                                                                                                     future: futureProvinsi,
//                                                                                                     builder: (context, snapshot) {
//                                                                                                       if (snapshot.connectionState == ConnectionState.waiting) {
//                                                                                                         return CircularProgressIndicator();
//                                                                                                       } else if (snapshot.hasError) {
//                                                                                                         return Text('Error: ${snapshot.error}');
//                                                                                                       } else if (snapshot.hasData) {
//                                                                                                         return Container(
//                                                                                                           width: inWidth,
//                                                                                                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                                                                                                           decoration: BoxDecoration(
//                                                                                                             borderRadius: BorderRadius.circular(8.0),
//                                                                                                             border: Border.all(color: Colors.grey),
//                                                                                                           ),
//                                                                                                           child: DropdownButton<Provinsi>(
//                                                                                                             hint: Text('Pilih Provinsi'),
//                                                                                                             value: selectedProvinsi,
//                                                                                                             onChanged: (Provinsi? newValue) {
//                                                                                                               setState(() {
//                                                                                                                 selectedProvinsi = newValue;
//                                                                                                                 selectedKota = null; // Reset the Kota selection
//                                                                                                                 if (newValue != null) {
//                                                                                                                   futureKota = fetchKota(newValue.id);
//                                                                                                                 }
//                                                                                                               });
//                                                                                                             },
//                                                                                                             items: snapshot.data!.map((Provinsi provinsi) {
//                                                                                                               return DropdownMenuItem<Provinsi>(
//                                                                                                                 value: provinsi,
//                                                                                                                 child: Text(
//                                                                                                                   provinsi.name,
//                                                                                                                   style: TextStyle(
//                                                                                                                     fontSize: 12,
//                                                                                                                     fontWeight: FontWeight.bold,
//                                                                                                                   ),
//                                                                                                                 ),
//                                                                                                               );
//                                                                                                             }).toList(),
//                                                                                                           ),
//                                                                                                         );
//                                                                                                       } else {
//                                                                                                         return Text('No data');
//                                                                                                       }
//                                                                                                     },
//                                                                                                   ),

//                                                                                                   // FutureBuilder<List<Provinsi>>(
//                                                                                                   //   future: futureProvinsi,
//                                                                                                   //   builder: (context, snapshot) {
//                                                                                                   //     if (snapshot.connectionState == ConnectionState.waiting) {
//                                                                                                   //       return Center(child: CircularProgressIndicator());
//                                                                                                   //     } else if (snapshot.hasError) {
//                                                                                                   //       return Center(child: Text('Error: ${snapshot.error}'));
//                                                                                                   //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                                                                                                   //       return Center(child: Text('No Data Available'));
//                                                                                                   //     } else {
//                                                                                                   //       return
//                                                                                                   // Container(
//                                                                                                   //         width: inWidth,
//                                                                                                   //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                                                                                                   //         decoration: BoxDecoration(
//                                                                                                   //           borderRadius: BorderRadius.circular(8.0),
//                                                                                                   //           border: Border.all(color: Colors.grey),
//                                                                                                   //         ),
//                                                                                                   //         child: DropdownButtonFormField<Provinsi>(
//                                                                                                   //           hint: Text('Pilih Provinsi'),
//                                                                                                   //           value: selectedProvinsi,
//                                                                                                   //           onChanged: (Provinsi? newValue) {
//                                                                                                   //             setState(() {
//                                                                                                   //               selectedProvinsi = newValue;
//                                                                                                   //             });
//                                                                                                   //           },
//                                                                                                   //           items: snapshot.data!.map<DropdownMenuItem<Provinsi>>((Provinsi provinsi) {
//                                                                                                   //             return DropdownMenuItem<Provinsi>(
//                                                                                                   //               value: provinsi,
//                                                                                                   //               child: Text(provinsi.name),
//                                                                                                   //             );
//                                                                                                   //           }).toList(),
//                                                                                                   //           isExpanded: true,
//                                                                                                   //           // validator: (value) => value == null ? 'Pilih Pekerjaan' : null,

//                                                                                                   //           validator: (value) {
//                                                                                                   //             if (value == null) {
//                                                                                                   //               return 'Pilih Provinsi';
//                                                                                                   //             }
//                                                                                                   //             return null;
//                                                                                                   //           },
//                                                                                                   //           onSaved: (value) {
//                                                                                                   //             selectedProvinsi = value;
//                                                                                                   //           },
//                                                                                                   //           decoration: InputDecoration(
//                                                                                                   //             enabledBorder: UnderlineInputBorder(
//                                                                                                   //               borderSide: BorderSide(color: Colors.grey),
//                                                                                                   //             ),
//                                                                                                   //             focusedBorder: UnderlineInputBorder(
//                                                                                                   //               borderSide: BorderSide(color: Colors.grey),
//                                                                                                   //             ),
//                                                                                                   //           ),
//                                                                                                   //         ),
//                                                                                                   //       );
//                                                                                                   //     }
//                                                                                                   //   },
//                                                                                                   // ),
//                                                                                                 ],
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ],
//                                                                                     ),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                               height: 20),
//                                                                           Row(
//                                                                             children: [
//                                                                               Column(
//                                                                                 children: [
//                                                                                   Container(
//                                                                                     child: Column(
//                                                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                       children: [
//                                                                                         Row(
//                                                                                           children: [
//                                                                                             Column(
//                                                                                               children: <Widget>[
//                                                                                                 Container(
//                                                                                                   // color: Colors.blue,
//                                                                                                   // width:,

//                                                                                                   height: 30,
//                                                                                                   child: Text(
//                                                                                                     "KOTA",
//                                                                                                     style: TextStyle(
//                                                                                                       fontSize: 15,
//                                                                                                       fontWeight: FontWeight.bold,
//                                                                                                     ),
//                                                                                                   ),
//                                                                                                 )
//                                                                                               ],
//                                                                                             )
//                                                                                           ],
//                                                                                         ),
//                                                                                         Row(
//                                                                                           children: [
//                                                                                             Padding(
//                                                                                               padding: const EdgeInsets.all(.0),
//                                                                                               child: Column(
//                                                                                                 children: [
//                                                                                                   FutureBuilder<List<Kota>>(
//                                                                                                     future: futureKota,
//                                                                                                     builder: (context, snapshot) {
//                                                                                                       // if (snapshot.connectionState == ConnectionState.waiting) {
//                                                                                                       //   return CircularProgressIndicator();
//                                                                                                       // } else
//                                                                                                       if (snapshot.hasError) {
//                                                                                                         return Text('Error: ${snapshot.error}');
//                                                                                                       } else if (snapshot.hasData) {
//                                                                                                         return Container(
//                                                                                                           width: inWidth,
//                                                                                                           height: 50,
//                                                                                                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//                                                                                                           decoration: BoxDecoration(
//                                                                                                             borderRadius: BorderRadius.circular(8.0),
//                                                                                                             border: Border.all(color: Colors.grey),
//                                                                                                           ),
//                                                                                                           child: DropdownButton<Kota>(
//                                                                                                             hint: Text(
//                                                                                                               'Pilih Kota',
//                                                                                                               maxLines: 2,
//                                                                                                               overflow: TextOverflow.ellipsis,
//                                                                                                               softWrap: true,
//                                                                                                             ),
//                                                                                                             value: selectedKota,
//                                                                                                             onChanged: (Kota? newValue) {
//                                                                                                               setState(() {
//                                                                                                                 selectedKota = newValue;
//                                                                                                               });
//                                                                                                             },
//                                                                                                             items: snapshot.data!.map((Kota kota) {
//                                                                                                               return DropdownMenuItem<Kota>(
//                                                                                                                 value: kota,
//                                                                                                                 child: ConstrainedBox(
//                                                                                                                   constraints: BoxConstraints(maxWidth: 200), // Sesuaikan lebar maksimum sesuai kebutuhan
//                                                                                                                   child: Text(
//                                                                                                                     kota.name,
//                                                                                                                     style: TextStyle(
//                                                                                                                       fontSize: 12,
//                                                                                                                       fontWeight: FontWeight.bold,
//                                                                                                                     ),
//                                                                                                                     maxLines: 3,
//                                                                                                                     overflow: TextOverflow.visible,
//                                                                                                                     softWrap: true,
//                                                                                                                   ),
//                                                                                                                 ),
//                                                                                                               );
//                                                                                                             }).toList(),
//                                                                                                           ),
//                                                                                                         );
//                                                                                                       } else {
//                                                                                                         return Container(
//                                                                                                           width: inWidth,
//                                                                                                           height: 60,
//                                                                                                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                                                                                                           decoration: BoxDecoration(
//                                                                                                             borderRadius: BorderRadius.circular(8.0),
//                                                                                                             border: Border.all(color: Colors.grey),
//                                                                                                           ),
//                                                                                                           child: Column(
//                                                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                             children: [
//                                                                                                               Row(
//                                                                                                                 children: [
//                                                                                                                   Text(
//                                                                                                                     'Silakan pilih provinsi',
//                                                                                                                     style: TextStyle(
//                                                                                                                       color: Colors.grey[600],
//                                                                                                                       fontSize: 12,
//                                                                                                                       fontWeight: FontWeight.w500,
//                                                                                                                     ),
//                                                                                                                   ),
//                                                                                                                 ],
//                                                                                                               ),
//                                                                                                             ],
//                                                                                                           ),
//                                                                                                         );
//                                                                                                       }
//                                                                                                     },
//                                                                                                   ),
//                                                                                                 ],
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ],
//                                                                                     ),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                               height: 20),
//                                                                           Row(
//                                                                             children: [
//                                                                               Column(
//                                                                                 children: [
//                                                                                   Row(
//                                                                                     children: [
//                                                                                       Container(
//                                                                                         child: Column(
//                                                                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                           children: [
//                                                                                             Row(
//                                                                                               children: [
//                                                                                                 Column(
//                                                                                                   children: <Widget>[
//                                                                                                     Container(
//                                                                                                       // color: Colors.blue,
//                                                                                                       // width:,

//                                                                                                       height: 30,
//                                                                                                       child: Text(
//                                                                                                         "ALAMAT ",
//                                                                                                         style: TextStyle(
//                                                                                                           fontSize: 15,
//                                                                                                           fontWeight: FontWeight.bold,
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     )
//                                                                                                   ],
//                                                                                                 )
//                                                                                               ],
//                                                                                             ),
//                                                                                             Row(
//                                                                                               children: [
//                                                                                                 Container(
//                                                                                                   width: inputWidth,
//                                                                                                   height: 90,
//                                                                                                   decoration: BoxDecoration(
//                                                                                                     border: Border.all(
//                                                                                                       color: Colors.grey,
//                                                                                                       width: 1,
//                                                                                                       style: BorderStyle.solid,
//                                                                                                     ),
//                                                                                                     borderRadius: BorderRadius.circular(10),
//                                                                                                   ),
//                                                                                                   padding: EdgeInsets.only(left: 10, top: 10),
//                                                                                                   child: TextFormField(
//                                                                                                     controller: _alamatController,
//                                                                                                     textAlignVertical: TextAlignVertical.center,
//                                                                                                     // autofocus: true,
//                                                                                                     enableInteractiveSelection: true,
//                                                                                                     maxLines: 3,
//                                                                                                     textAlign: TextAlign.start,
//                                                                                                     decoration: const InputDecoration.collapsed(
//                                                                                                       border: InputBorder.none,
//                                                                                                       hintText: ('Info Alamat Lengkap  '),
//                                                                                                     ),
//                                                                                                     validator: (String? value) {
//                                                                                                       if (value == null || value.isEmpty) {
//                                                                                                         return ' Masukkan Detail Alamat';
//                                                                                                       }
//                                                                                                       return null;
//                                                                                                     },
//                                                                                                   ),
//                                                                                                 ),
//                                                                                               ],
//                                                                                             )
//                                                                                           ],
//                                                                                         ),
//                                                                                       )
//                                                                                     ],
//                                                                                   )
//                                                                                 ],
//                                                                               )
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                               height: 20),
//                                                                           Row(
//                                                                             children: [
//                                                                               Column(
//                                                                                 children: [
//                                                                                   Row(
//                                                                                     children: [
//                                                                                       Container(
//                                                                                         child: Column(
//                                                                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                           children: [
//                                                                                             Row(
//                                                                                               mainAxisAlignment: MainAxisAlignment.start,
//                                                                                               children: [
//                                                                                                 Column(
//                                                                                                   children: <Widget>[
//                                                                                                     Container(
//                                                                                                       // color: Colors.blue,
//                                                                                                       // width:,

//                                                                                                       height: 30,
//                                                                                                       child: Text(
//                                                                                                         "WHATSAPP",
//                                                                                                         style: TextStyle(
//                                                                                                           fontSize: 15,
//                                                                                                           fontWeight: FontWeight.bold,
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     )
//                                                                                                   ],
//                                                                                                 )
//                                                                                               ],
//                                                                                             ),
//                                                                                             Row(
//                                                                                               children: [
//                                                                                                 Container(
//                                                                                                   width: inputWidth,
//                                                                                                   height: 50,
//                                                                                                   decoration: BoxDecoration(
//                                                                                                     border: Border.all(
//                                                                                                       color: Colors.grey,
//                                                                                                       width: 1,
//                                                                                                       style: BorderStyle.solid,
//                                                                                                     ),
//                                                                                                     borderRadius: BorderRadius.circular(10),
//                                                                                                   ),
//                                                                                                   padding: EdgeInsets.only(
//                                                                                                     left: 10,
//                                                                                                   ),
//                                                                                                   child: TextFormField(
//                                                                                                     controller: _waController,
//                                                                                                     keyboardType: TextInputType.phone,
//                                                                                                     decoration: const InputDecoration(
//                                                                                                       border: InputBorder.none,
//                                                                                                       hintText: 'Nomor Whatsapp',
//                                                                                                     ),
//                                                                                                     validator: (String? value) {
//                                                                                                       if (value == null || value.isEmpty) {
//                                                                                                         return ' Maukkan Nomor Whatsapp';
//                                                                                                       }
//                                                                                                       return null;
//                                                                                                     },
//                                                                                                   ),
//                                                                                                 )
//                                                                                               ],
//                                                                                             )
//                                                                                           ],
//                                                                                         ),
//                                                                                       )
//                                                                                     ],
//                                                                                   )
//                                                                                 ],
//                                                                               )
//                                                                             ],
//                                                                           ),
//                                                                           SizedBox(
//                                                                               height: 50),
//                                                                           Column(
//                                                                             crossAxisAlignment:
//                                                                                 CrossAxisAlignment.end,
//                                                                             children: [
//                                                                               Row(
//                                                                                 mainAxisAlignment: MainAxisAlignment.end,
//                                                                                 children: [
//                                                                                   Container(
//                                                                                     // width: 100,
//                                                                                     // height: 50,
//                                                                                     child: Column(
//                                                                                       crossAxisAlignment: CrossAxisAlignment.end,
//                                                                                       children: [
//                                                                                         Row(
//                                                                                           children: [
//                                                                                             ElevatedButton(
//                                                                                               style: ButtonStyle(
//                                                                                                 fixedSize: WidgetStatePropertyAll(Size(inputWidth, 30)),
//                                                                                                 backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF233d63)),
//                                                                                               ),
//                                                                                               onPressed: _submitForm,
//                                                                                               child: Row(
//                                                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                 children: [
//                                                                                                   Text(
//                                                                                                     'Submit',
//                                                                                                     style: TextStyle(fontSize: 17, color: Colors.white),
//                                                                                                   ),
//                                                                                                 ],
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ],
//                                                                                     ),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                             ]),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ]))
//           ],
//         ),
//       )),
//       // bottomNavigationBar: HomeBottomNavBar(),
//     );
//   }

//   void _showSelectHamaDialog() async {
//     try {
//       List<HamaItem> items = await fetchItems(); // Fetch the items from the API

//       // Set the initial selected IDs based on _selectedItemIds
//       Set<int> initialSelectedIds = Set.from(_selectedItemIds);

//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Select Hama'),
//             content: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//                 return SizedBox(
//                   width: double
//                       .maxFinite, // Make sure the content can take full width
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: items.map((item) {
//                         return CheckboxListTile(
//                           title: Text(
//                             item.nama_hama,
//                           ),
//                           value: initialSelectedIds.contains(item.id),
//                           onChanged: (bool? selected) {
//                             setState(() {
//                               if (selected == true) {
//                                 initialSelectedIds.add(item.id);
//                               } else {
//                                 initialSelectedIds.remove(item.id);
//                               }
//                             });
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Close the dialog
//                 },
//                 child: Text('Cancel'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     _selectedItemIds = Set.from(initialSelectedIds);
//                     _selectedText = items
//                         .where((item) => _selectedItemIds.contains(item.id))
//                         .map((item) => item.nama_hama)
//                         .join(', ');
//                   });
//                   Navigator.of(context).pop(); // Close the dialog
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     } catch (error) {
//       print('Error showing dialog: $error');
//     }
//   }

// //   Future<void> _showSelectDialog(List<String> items) async {
// //     final List<String>? selectedItems = await showDialog<List<String>>(
// //       context: context,
// //       builder: (context) {
// //         return MultiSelectDialog(
// //           items: items,
// //           selectedItems: _selectedItem,
// //         );
// //       },
// //     );
// //     if (selectedItems != null) {
// //       setState(() {
// //         _selectedItem = selectedItems;
// //       });
// //     }
// //   }
// }

// // class MultiSelectDialog extends StatefulWidget {
// //   final List<String> items;
// //   final List<String> selectedItems;

// //   MultiSelectDialog({required this.items, required this.selectedItems});

// //   @override
// //   _MultiSelectDialogState createState() => _MultiSelectDialogState();
// // }

// // class _MultiSelectDialogState extends State<MultiSelectDialog> {
// //   late List<String> _selectedItems;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _selectedItems = List.from(widget.selectedItems);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return AlertDialog(
// //       title: Text('Select Items'),
// //       content: SingleChildScrollView(
// //         child: Column(
// //           children: widget.items.map((item) {
// //             return CheckboxListTile(
// //               title: ConstrainedBox(
// //                 constraints: BoxConstraints(
// //                     maxWidth: 200), // Sesuaikan lebar maksimum sesuai kebutuhan
// //                 child: Text(
// //                   item,
// //                   maxLines: 3,
// //                   overflow: TextOverflow.visible,
// //                   softWrap: true,
// //                 ),
// //               ),
// //               value: _selectedItems.contains(item),
// //               onChanged: (bool? selected) {
// //                 setState(() {
// //                   if (selected == true) {
// //                     _selectedItems.add(item);
// //                   } else {
// //                     _selectedItems.remove(item);
// //                   }
// //                 });
// //               },
// //             );
// //           }).toList(),
// //         ),
// //       ),
// //       actions: [
// //         TextButton(
// //           onPressed: () => Navigator.of(context).pop(_selectedItems),
// //           child: Text('OK'),
// //         ),
// //         TextButton(
// //           onPressed: () => Navigator.of(context).pop(),
// //           child: Text('Cancel'),
// //         ),
// //       ],
// //     );
// //   }
// // }
