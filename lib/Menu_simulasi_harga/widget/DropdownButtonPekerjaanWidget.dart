// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_simulasi_harga/Models/Cabang_Provider.dart';
// import 'package:flutter_aag4u/Menu_simulasi_harga/Models/Pekerjaan_Provider.dart';
// import 'package:flutter_aag4u/Menu_simulasi_harga/Services/servicesCabang.dart';
// import 'package:flutter_aag4u/Menu_simulasi_harga/Services/servicesPekerjaan.dart';

// class DropdownButtonPekerjaanWidget extends StatefulWidget {
//   @override
//   _DropdownButtonPekerjaanWidgetState createState() =>
//       _DropdownButtonPekerjaanWidgetState();
// }

// class _DropdownButtonPekerjaanWidgetState
//     extends State<DropdownButtonPekerjaanWidget> {
//   late Future<List<Pekerjaan>> futurePekerjaan;
//   Pekerjaan? selectedPekerjaan;

//   @override
//   void initState() {
//     super.initState();
//     futurePekerjaan = PekerjaanService().fetchPekerjaan();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Pekerjaan>>(
//       future: futurePekerjaan,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(child: Text('No Data Available'));
//         } else {
//           return Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: 10,
//               vertical: 5,
//             ),
//             margin: EdgeInsets.all(5.0),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               border: Border.all(color: Colors.grey),
//             ),
//             child: DropdownButton<Pekerjaan>(
//               hint: Text('Pilih Pekerjaan'),
//               value: selectedPekerjaan,
//               onChanged: (Pekerjaan? newValue) {
//                 setState(() {
//                   selectedPekerjaan = newValue;
//                 });
//               },
//               items: snapshot.data!
//                   .map<DropdownMenuItem<Pekerjaan>>((Pekerjaan pekerjaan) {
//                 return DropdownMenuItem<Pekerjaan>(
//                   value: pekerjaan,
//                   child: Text(pekerjaan.nama_pekerjaan),
//                 );
//               }).toList(),
//               isExpanded: true,
//               underline: SizedBox(), // Remove default underline
//             ),
//           );
//         }
//       },
//     );
//   }
// }
