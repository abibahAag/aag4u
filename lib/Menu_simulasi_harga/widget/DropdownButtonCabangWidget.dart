// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_simulasi_harga/Models/Cabang_Provider.dart';
// import 'package:flutter_aag4u/Menu_simulasi_harga/Services/servicesCabang.dart';

// class DropdownButtonCabangWidget extends StatefulWidget {
//   @override
//   _DropdownButtonCabangWidgetState createState() =>
//       _DropdownButtonCabangWidgetState();
// }

// class _DropdownButtonCabangWidgetState
//     extends State<DropdownButtonCabangWidget> {
//   late Future<List<Cabang>> futureCabang;
//   Cabang? selectedCabang;

//   @override
//   void initState() {
//     super.initState();
//     futureCabang = CabangService().fetchCabang();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Cabang>>(
//       future: futureCabang,
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
//             child: DropdownButton<Cabang>(
//               hint: Text('Pilih Cabang'),
//               value: selectedCabang,
//               onChanged: (Cabang? newValue) {
//                 setState(() {
//                   selectedCabang = newValue;
//                 });
//               },
//               items:
//                   snapshot.data!.map<DropdownMenuItem<Cabang>>((Cabang cabang) {
//                 return DropdownMenuItem<Cabang>(
//                   value: cabang,
//                   child: Text(cabang.nama_cabang),
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
