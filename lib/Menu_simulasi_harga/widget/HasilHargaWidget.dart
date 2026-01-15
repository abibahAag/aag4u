// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HasilHargaWidget extends StatefulWidget {
//   // const HasilHargaWidget({super.key, required List dropdownItems});
//   final List<dynamic> dropdownItems;

//   HasilHargaWidget({required this.dropdownItems});

//   @override
//   State<HasilHargaWidget> createState() => _HasilHargaWidgetState();
// }

// class _HasilHargaWidgetState extends State<HasilHargaWidget> {
//   String? _selectedItem;
//   late String _selectedPrice;
//   late String _selectedCabang;
//   late String _selectedKerjaan;
//   late String _selectedSegmen;
//   late String _selectedLuasan;

//   void _launchURL() async {
//     const phoneNumber = '6281280543829';

//     final String message =
//         '''Halo, Saya ingin menggunakan jasa Pembasmi Hama berikut data saya:
//     Cabang        : $_selectedCabang
//     Pekerjaan   : $_selectedKerjaan  
//     Segmentasi : $_selectedSegmen 
//     Luasan         : $_selectedLuasan 
//     Harga           : $_selectedPrice''';
//     final url =
//         'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Inisialisasi _selectedCabang dengan nilai dari dropdownItems
//   //   _selectedPrice = widget.dropdownItems.first['harga'].toString();
//   //   _selectedCabang = widget.dropdownItems.first['nama_cabang'].toString();
//   //   _selectedKerjaan = widget.dropdownItems.first['nama_pekerjaan'].toString();
//   //   _selectedSegmen = widget.dropdownItems.first['area_segmentasi'].toString();
//   //   _selectedLuasan = widget.dropdownItems.first['ukuran_luasan'].toString();
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   double screenWidth = MediaQuery.of(context).size.width * 0.9;
//   //   double inWidth = MediaQuery.of(context).size.width * 0.8;
//   //   final List<dynamic> dropdownItems;

//   //   return Scaffold(
//   //       appBar: AppBar(
//   //           automaticallyImplyLeading: true,
//   //           title: Container(
//   //             // color: Colors.amber,
//   //             // height: 300,
//   //             child: Column(
//   //               children: [
//   //                 Container(
//   //                   child: Row(
//   //                     mainAxisAlignment: MainAxisAlignment.center,
//   //                     children: [
//   //                       Column(
//   //                         children: [
//   //                           Container(
//   //                             child: Image.asset(
//   //                               "images/icons/aagu.png",
//   //                               height: 100,
//   //                               width: 100,
//   //                             ),
//   //                           ),
//   //                           // Text(
//   //                           //   "data",
//   //                           //   style: TextStyle(color: Colors.black, fontSize: 5),
//   //                           // )
//   //                         ],
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //           actions: <Widget>[
//   //             Container(
//   //               child: Column(
//   //                 // crossAxisAlignment: CrossAxisAlignment.start,
//   //                 children: [
//   //                   Row(
//   //                     crossAxisAlignment: CrossAxisAlignment.end,
//   //                     mainAxisAlignment: MainAxisAlignment.center,
//   //                     children: [
//   //                       Container(
//   //                           child: Icon(
//   //                         Icons.refresh,
//   //                         size: 30,
//   //                       ))
//   //                     ],
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //           ]),
//   //       // scrollDirection: Axis.vertical,
//   //       body: Column(
//   //           // crossAxisAlignment: CrossAxisAlignment.center,

//   //           children: [
//   //             Row(
//   //               mainAxisAlignment: MainAxisAlignment.center,
//   //               children: [
//   //                 Padding(
//   //                   padding: const EdgeInsets.symmetric(
//   //                       horizontal: 12.0, vertical: 15.0),
//   //                   child: Column(
//   //                     children: [
//   //                       Container(
//   //                         width: screenWidth,
//   //                         height: 100,
//   //                         alignment: Alignment.center,
//   //                         decoration: BoxDecoration(
//   //                           color: Color(0xFF233d63),
//   //                           borderRadius: BorderRadius.circular(24),
//   //                         ),
//   //                         child: Column(
//   //                           mainAxisAlignment: MainAxisAlignment.center,
//   //                           children: [
//   //                             Row(
//   //                               mainAxisAlignment: MainAxisAlignment.center,
//   //                               children: [
//   //                                 Text(
//   //                                   "Simulasi Harga",
//   //                                   style: TextStyle(
//   //                                       fontSize: 35,
//   //                                       fontWeight: FontWeight.bold,
//   //                                       color: Colors.white),
//   //                                 ),
//   //                               ],
//   //                             ),
//   //                           ],
//   //                         ),
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 ),
//   //               ],
//   //             ),
//   //             Padding(
//   //               padding: const EdgeInsets.symmetric(
//   //                 horizontal: 12.0,
//   //               ),
//   //               child: Column(
//   //                 children: [
//   //                   Row(
//   //                     // mainAxisAlignment: MainAxisAlignment.center,
//   //                     children: [
//   //                       Column(
//   //                         children: [
//   //                           Container(
//   //                             width: screenWidth,
//   //                             decoration: BoxDecoration(
//   //                               border: Border.all(
//   //                                   style: BorderStyle.solid,
//   //                                   color: Colors.grey),
//   //                               borderRadius:
//   //                                   BorderRadius.all(Radius.circular(24)),
//   //                             ),
//   //                             child: Form(
//   //                               // key: _formKey2,
//   //                               child: Row(
//   //                                 mainAxisAlignment: MainAxisAlignment.center,
//   //                                 children: [
//   //                                   Column(
//   //                                     children: [
//   //                                       Container(
//   //                                         // color: Colors.amber,
//   //                                         width: inWidth,
//   //                                         height: 180,
//   //                                         child: Column(
//   //                                           children: [
//   //                                             Row(children: [
//   //                                               Padding(
//   //                                                   padding:
//   //                                                       const EdgeInsets.only(
//   //                                                     top: 20,
//   //                                                     bottom: 10,
//   //                                                   ),
//   //                                                   child: Column(children: [
//   //                                                     Row(
//   //                                                       children: [
//   //                                                         Column(
//   //                                                           children: [
//   //                                                             Container(
//   //                                                               child: Column(
//   //                                                                 crossAxisAlignment:
//   //                                                                     CrossAxisAlignment
//   //                                                                         .start,
//   //                                                                 children: [
//   //                                                                   Row(
//   //                                                                     children: [
//   //                                                                       Column(
//   //                                                                         children: <Widget>[
//   //                                                                           Container(
//   //                                                                             // color: Colors.blue,
//   //                                                                             // width: ,
//   //                                                                             height: 30,
//   //                                                                             child: Text(
//   //                                                                               "LUASAN AREA",
//   //                                                                               style: TextStyle(
//   //                                                                                 fontSize: 15,
//   //                                                                                 fontWeight: FontWeight.bold,
//   //                                                                               ),
//   //                                                                             ),
//   //                                                                           )
//   //                                                                         ],
//   //                                                                       )
//   //                                                                     ],
//   //                                                                   ),
//   //                                                                   Row(
//   //                                                                     children: [
//   //                                                                       Column(
//   //                                                                         children: [
//   //                                                                           Container(
//   //                                                                             width: inWidth,
//   //                                                                             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//   //                                                                             decoration: BoxDecoration(
//   //                                                                               borderRadius: BorderRadius.circular(8.0),
//   //                                                                               border: Border.all(color: Colors.grey),
//   //                                                                             ),
//   //                                                                             child: Column(
//   //                                                                               children: <Widget>[
//   //                                                                                 DropdownButtonFormField<String>(
//   //                                                                                   value: _selectedItem,
//   //                                                                                   hint: Text('Pilih Item'),
//   //                                                                                   items: widget.dropdownItems.map<DropdownMenuItem<String>>((item) {
//   //                                                                                     return DropdownMenuItem<String>(
//   //                                                                                       value: item['idi'].toString(),
//   //                                                                                       child: Text('${item['ukuran_luasan'].toString()}'), // Adjust based on your item structure
//   //                                                                                     );
//   //                                                                                   }).toList(),
//   //                                                                                   onChanged: (value) {
//   //                                                                                     setState(() {
//   //                                                                                       _selectedItem = value;
//   //                                                                                       _selectedPrice = widget.dropdownItems.firstWhere((item) => item['idi'].toString() == value)['harga'].toString(); // Fetch the price when selection changes
//   //                                                                                       _selectedKerjaan = widget.dropdownItems.firstWhere((item) => item['idi'].toString() == value)['nama_pekerjaan'].toString(); // Fetch the price when selection changes
//   //                                                                                     });
//   //                                                                                   },
//   //                                                                                 ),
//   //                                                                               ],
//   //                                                                             ),
//   //                                                                           ),
//   //                                                                         ],
//   //                                                                       ),
//   //                                                                     ],
//   //                                                                   ),
//   //                                                                   SizedBox(
//   //                                                                     height:
//   //                                                                         20,
//   //                                                                   ),
//   //                                                                   SizedBox(
//   //                                                                     height:
//   //                                                                         20,
//   //                                                                   ),
//   //                                                                 ],
//   //                                                               ),
//   //                                                             ),
//   //                                                           ],
//   //                                                         ),
//   //                                                       ],
//   //                                                     ),
//   //                                                   ]))
//   //                                             ]),
//   //                                           ],
//   //                                         ),
//   //                                       ),
//   //                                     ],
//   //                                   ),
//   //                                 ],
//   //                               ),
//   //                             ),
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 ],
//   //               ),
//   //             ),
//   //             SizedBox(
//   //               height: 30,
//   //             ),
//   //             if (_selectedItem != null)
//   //               Padding(
//   //                 padding: const EdgeInsets.symmetric(
//   //                   horizontal: 12.0,
//   //                 ),
//   //                 child: Column(
//   //                   children: [
//   //                     Row(
//   //                       children: [
//   //                         Column(
//   //                           children: [
//   //                             Container(
//   //                               width: screenWidth,
//   //                               decoration: BoxDecoration(
//   //                                 border: Border.all(
//   //                                     style: BorderStyle.solid,
//   //                                     color: Colors.grey),
//   //                                 borderRadius:
//   //                                     BorderRadius.all(Radius.circular(24)),
//   //                               ),
//   //                               child: Row(
//   //                                 mainAxisAlignment: MainAxisAlignment.center,
//   //                                 children: [
//   //                                   Column(
//   //                                     children: [
//   //                                       Container(
//   //                                         // color: Colors.amber,
//   //                                         width: inWidth,
//   //                                         height: 350,
//   //                                         child: Row(
//   //                                           children: [
//   //                                             Column(
//   //                                               children: [
//   //                                                 Padding(
//   //                                                   padding:
//   //                                                       const EdgeInsets.only(
//   //                                                           top: 10),
//   //                                                   child: Container(
//   //                                                     width: inWidth,
//   //                                                     padding:
//   //                                                         EdgeInsets.symmetric(
//   //                                                             horizontal: 10,
//   //                                                             vertical: 5),
//   //                                                     child: Column(
//   //                                                       // crossAxisAlignment: CrossAxisAlignment.center,
//   //                                                       children: [
//   //                                                         Row(
//   //                                                           mainAxisAlignment:
//   //                                                               MainAxisAlignment
//   //                                                                   .center,
//   //                                                           children: [
//   //                                                             Text(
//   //                                                               ' ${NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 0).format(int.parse(_selectedPrice!))}',
//   //                                                               style:
//   //                                                                   TextStyle(
//   //                                                                 fontSize: 25,
//   //                                                                 fontWeight:
//   //                                                                     FontWeight
//   //                                                                         .bold,
//   //                                                                 // decoration: TextDecoration.underline,
//   //                                                               ),
//   //                                                             ),
//   //                                                           ],
//   //                                                         ),
//   //                                                       ],
//   //                                                     ),
//   //                                                   ),
//   //                                                 ),
//   //                                                 SizedBox(
//   //                                                   height: 20,
//   //                                                 ),
//   //                                                 Row(
//   //                                                   children: [
//   //                                                     Column(
//   //                                                       children: [
//   //                                                         Padding(
//   //                                                             padding:
//   //                                                                 EdgeInsets
//   //                                                                     .only(),
//   //                                                             child: Container(
//   //                                                               width: 250,
//   //                                                               child:
//   //                                                                   Text.rich(
//   //                                                                 TextSpan(
//   //                                                                   text: _selectedKerjaan ==
//   //                                                                           "TERMITE CONTROL"
//   //                                                                       ? "Berikut adalah harga / M² untuk Treatment Termite"
//   //                                                                       : "Berikut adalah harga / visit untuk setiap pekerjaan",
//   //                                                                   style:
//   //                                                                       TextStyle(
//   //                                                                     fontSize:
//   //                                                                         15,
//   //                                                                   ),
//   //                                                                 ),
//   //                                                                 textAlign:
//   //                                                                     TextAlign
//   //                                                                         .center,
//   //                                                               ),
//   //                                                             ))
//   //                                                       ],
//   //                                                     )
//   //                                                   ],
//   //                                                 ),
//   //                                                 SizedBox(
//   //                                                   height: 20,
//   //                                                 ),
//   //                                                 Row(
//   //                                                   children: [
//   //                                                     Column(
//   //                                                       children: [
//   //                                                         Padding(
//   //                                                             padding:
//   //                                                                 EdgeInsets
//   //                                                                     .only(),
//   //                                                             child: Container(
//   //                                                               width: 250,
//   //                                                               child:
//   //                                                                   Text.rich(
//   //                                                                 TextSpan(
//   //                                                                   text:
//   //                                                                       """Dapatkan Harga Spesial Sekarang !!!""",
//   //                                                                   style:
//   //                                                                       TextStyle(
//   //                                                                     fontSize:
//   //                                                                         25,
//   //                                                                     fontWeight:
//   //                                                                         FontWeight
//   //                                                                             .bold,
//   //                                                                     color: Colors
//   //                                                                         .red,
//   //                                                                   ),
//   //                                                                 ),
//   //                                                                 textAlign:
//   //                                                                     TextAlign
//   //                                                                         .center,
//   //                                                               ),
//   //                                                             ))
//   //                                                       ],
//   //                                                     )
//   //                                                   ],
//   //                                                 ),
//   //                                                 SizedBox(
//   //                                                   height: 40,
//   //                                                 ),
//   //                                                 Row(
//   //                                                   children: [
//   //                                                     Column(
//   //                                                       children: [
//   //                                                         Container(
//   //                                                           child: Column(
//   //                                                             children: [
//   //                                                               Row(
//   //                                                                 children: [
//   //                                                                   ElevatedButton(
//   //                                                                       onPressed:
//   //                                                                           _launchURL,
//   //                                                                       // style: ButtonStyle(
//   //                                                                       style: ElevatedButton
//   //                                                                           .styleFrom(
//   //                                                                         backgroundColor: Color.fromARGB(
//   //                                                                             255,
//   //                                                                             16,
//   //                                                                             212,
//   //                                                                             114),
//   //                                                                       ),
//   //                                                                       child:
//   //                                                                           Text(
//   //                                                                         "Ajukan Survey",
//   //                                                                         style:
//   //                                                                             TextStyle(
//   //                                                                           color:
//   //                                                                               Colors.white,
//   //                                                                         ),
//   //                                                                       ))
//   //                                                                 ],
//   //                                                               )
//   //                                                             ],
//   //                                                           ),
//   //                                                         )
//   //                                                       ],
//   //                                                     )
//   //                                                   ],
//   //                                                 )
//   //                                               ],
//   //                                             ),
//   //                                           ],
//   //                                         ),
//   //                                       )
//   //                                     ],
//   //                                   )
//   //                                 ],
//   //                               ),
//   //                             )
//   //                           ],
//   //                         )
//   //                       ],
//   //                     )
//   //                   ],
//   //                 ),
//   //               )
//   //           ]));
//   // }

//   @override
//   void initState() {
//     super.initState();
//     // Inisialisasi _selectedCabang dengan nilai dari dropdownItems
//     _selectedPrice = widget.dropdownItems.first['harga'].toString();
//     _selectedCabang = widget.dropdownItems.first['nama_cabang'].toString();
//     _selectedKerjaan = widget.dropdownItems.first['nama_pekerjaan'].toString();
//     _selectedSegmen = widget.dropdownItems.first['area_segmentasi'].toString();
//     _selectedLuasan = widget.dropdownItems.first['ukuran_luasan'].toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;
//     double inWidth = MediaQuery.of(context).size.width * 0.8;
//     final List<dynamic> dropdownItems;

//     return Scaffold(
//         appBar: AppBar(
//             automaticallyImplyLeading: true,
//             title: Container(
//               // color: Colors.amber,
//               // height: 300,
//               child: Column(
//                 children: [
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               child: Image.asset(
//                                 "images/icons/aagu.png",
//                                 height: 100,
//                                 width: 100,
//                               ),
//                             ),
//                             // Text(
//                             //   "data",
//                             //   style: TextStyle(color: Colors.black, fontSize: 5),
//                             // )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               Container(
//                 child: Column(
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                             child: Icon(
//                           Icons.refresh,
//                           size: 30,
//                         ))
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ]),
//         // scrollDirection: Axis.vertical,
//         body: Column(
//             // crossAxisAlignment: CrossAxisAlignment.center,

//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12.0,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                                 width: screenWidth,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       style: BorderStyle.solid,
//                                       color: Colors.grey),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(24)),
//                                 ),
//                                 child: Form(
//                                   // key: _formKey2,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Column(
//                                         children: [],
//                                       )
//                                     ],
//                                   ),
//                                 ))
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ]));
//   }
// }
