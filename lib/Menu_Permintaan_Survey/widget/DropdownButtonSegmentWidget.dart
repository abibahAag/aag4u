// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_aag4u/Menu_Permintaan_Survey/Models/Segment_Provider.dart';

// import 'package:flutter_aag4u/Menu_Permintaan_Survey/Services/servicesSegment.dart';

// class DropdownButtonSegmentWidget extends StatefulWidget {
//   @override
//   _DropdownButtonSegmentWidgetState createState() =>
//       _DropdownButtonSegmentWidgetState();
// }

// class _DropdownButtonSegmentWidgetState
//     extends State<DropdownButtonSegmentWidget> {
//   late Future<List<Segment>> futureSegment;
//   Segment? selectedSegment;

//   @override
//   void initState() {
//     super.initState();
//     futureSegment = SegmentService().fetchSegment();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Segment>>(
//       future: futureSegment,
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
//             child: DropdownButton<Segment>(
//               hint: Text('Pilih Segment'),
//               value: selectedSegment,
//               onChanged: (Segment? newValue) {
//                 setState(() {
//                   selectedSegment = newValue;
//                 });
//               },
//               items: snapshot.data!
//                   .map<DropdownMenuItem<Segment>>((Segment segment) {
//                 return DropdownMenuItem<Segment>(
//                   value: segment,
//                   child: Text(segment.area_segmentasi),
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
