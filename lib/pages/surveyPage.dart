import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/misc/tile_providers.dart';
import 'package:flutter_aag4u/pages/pdfView.dart';
import 'package:flutter_aag4u/plugins/zoombuttons_plugin.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProgresTab(),
    );
  }
}

class ProgresTab extends StatefulWidget {
  @override
  _ProgresTabState createState() => _ProgresTabState();
}

class _ProgresTabState extends State<ProgresTab> {
  List<dynamic> requestData = [];
  List<dynamic> surveyData = [];
  List<dynamic> offerData = [];
  List<dynamic> dealData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var box = await Hive.openBox('loginBox');
      var email = box.get('email');

      final requestResponse = await http
          .get(Uri.parse('https://app.aag4u.co.id/api/getProgres/1/$email'));
      // if (requestResponse == 200) {
      setState(() {
        requestData = json.decode(requestResponse.body);
      });
      isLoading = false;
      // } else {
      //   throw Exception('Failed to load data');
      // }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  // _PdfViewerPageState createState() => _PdfViewerPageState();
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Treatment Progress'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Request'),
              Tab(text: 'Survey'),
              Tab(text: 'Offer'),
              Tab(text: 'Deal'),
            ],
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : TabBarView(
                children: [
                  RequestTab(requestData: requestData),
                  SurveyTab(),
                  OfferTab(),
                  DealTab(),
                ],
              ),
      ),
    );
  }
}

class PdfView extends StatefulWidget {
  final String? url; // URL bisa opsional, dengan default null

  PdfView({this.url});
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfView> {
  String? localPath;
  bool isLoading = true;
  String defaultUrl =
      'https://atrindo.network/assets/images/attach/20210408135121.pdf'; // URL default

  @override
  void initState() {
    super.initState();
    _downloadAndSavePdf();
  }

  Future<void> _downloadAndSavePdf() async {
    try {
      // Dapatkan URL dari widget atau gunakan default URL jika null
      String pdfUrl = widget.url ?? defaultUrl;

      // Dapatkan direktori sementara untuk menyimpan file PDF
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      String fullPath = '$tempPath/temp.pdf';

      // Unduh PDF dari URL menggunakan Dio
      await Dio().download(pdfUrl, fullPath);

      setState(() {
        localPath = fullPath;
        isLoading = false;
      });
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 350, // Ubah tinggi sesuai kebutuhan
          padding: EdgeInsets.all(10), // Padding opsional untuk estetika
          color: Colors.grey[200], // Warna background opsional
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFView(
                  filePath: localPath!,
                  enableSwipe: true,
                  swipeHorizontal: false,
                  autoSpacing: true,
                  pageFling: true,
                  onPageChanged: (int? page, int? total) {
                    print('Page $page of $total');
                  },
                ),
        ),
      ],
    );
  }
}

/// Start Code RequestTab ///

class RequestTab extends StatelessWidget {
  final List<dynamic> requestData;
  // State<RequestTab> createState() => _RequestTabState();
  RequestTab({required this.requestData});

  // final String productName = "Kecoa,Lalat,Semut";

  // final DateTime purchaseDate = DateTime(2024, 9, 1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: requestData.length,
      itemBuilder: (context, index) {
        // Assuming `productName` and `purchaseDate` are part of `requestData`
        // List<dynamic> hama = requestData[index]['survey_hama'];
        final hama = requestData[index]['survey_hama'] as List<dynamic>;
        final hamaNames = hama
            .map((hama) =>
                (hama as Map<String, dynamic>)['hama']['nama_hama'] ??
                'No name')
            .join(', ');
        DateTime purchaseDate = DateTime.parse(
            requestData[index]['jadwal']); // Assuming it's a date string

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.file_copy, size: 40, color: Colors.blue),
                title: Text(
                  hamaNames,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                // title: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                // Loop through each product file
                // for (var file in hama)
                //   Text(
                //     '${file['hama']['nama_hama']},', // Assuming 'file' is a string, otherwise adjust accordingly
                //     style: TextStyle(
                //         fontSize: 14, fontWeight: FontWeight.bold),
                //   ),
                //   ],
                // ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Survey on: ${purchaseDate.day}/${purchaseDate.month}/${purchaseDate.year} - ${requestData[index]['jam']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${requestData[index]['provinsi']} - ${requestData[index]['kota']}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

/// End Code RequestTab ///

class SurveyTab extends StatelessWidget {
  final String productName = "Kecoa,Lalat,Semut";
  final DateTime purchaseDate = DateTime(2024, 9, 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.file_copy, size: 40, color: Colors.blue),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kami akan melakukan survey terkait hama :',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  productName,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Survey on: ${purchaseDate.day}/${purchaseDate.month}/${purchaseDate.year} - 14:30',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  'Jakarta Selatan - DKI Jakarta',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: 300,
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(-6.28381815, 106.80486325728526),
                      initialZoom: 13,
                    ),
                    children: [
                      openStreetMapTileLayer,
                      const FlutterMapZoomButtons(
                        minZoom: 4,
                        maxZoom: 19,
                        mini: true,
                        padding: 20,
                        alignment: Alignment.bottomLeft,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OfferTab extends StatelessWidget {
  final String productName = "Kecoa,Lalat,Semut";
  final DateTime purchaseDate = DateTime(2024, 9, 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.picture_as_pdf,
                size: 40, color: const Color.fromARGB(255, 243, 33, 33)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Berikut Penawaran yang kami berikan beserta hasil surveinya :',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 4),
                // Text(
                //   productName,
                //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                // ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Survey on: ${purchaseDate.day}/${purchaseDate.month}/${purchaseDate.year} - 14:30',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  'Jakarta Selatan - DKI Jakarta',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          PdfView(),
          SizedBox(height: 4),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Viewpdf(
                      pdfUrl:
                          'https://atrindo.network/assets/images/attach/20210408135121.pdf', // Ganti URL PDF di sini
                    ),
                  ),
                );
              },
              child: Text('View PDF'),
            ),
          )
        ],
      ),
    );
  }
}

class DealTab extends StatelessWidget {
  final String productName = "Kecoa,Lalat,Semut";
  final DateTime purchaseDate = DateTime(2024, 9, 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.check_circle_outline_outlined,
                size: 40, color: const Color.fromARGB(255, 68, 243, 33)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kami akan melakukan Treatment terkait hama:',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 4),
                // Text(
                //   productName,
                //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                // ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productName}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  'Jakarta Selatan - DKI Jakarta',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  'Jl.Tebet dalam No.37 RT/RW 007/014 Tebet',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.picture_as_pdf_rounded,
                size: 40, color: const Color.fromARGB(255, 243, 33, 33)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Berikut File kontrak / Agreement untuk Kerjasama ini',
                  style: TextStyle(fontSize: 14),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Viewpdf(
                            pdfUrl:
                                'https://atrindo.network/assets/images/attach/SA-Selfie-Time.pdf', // Ganti URL PDF di sini
                          ),
                        ),
                      );
                    },
                    child: Text('View PDF'),
                  ),
                )
                // SizedBox(height: 4),
                // Text(
                //   productName,
                //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
