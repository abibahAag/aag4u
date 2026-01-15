import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/misc/tile_providers.dart';
import 'package:flutter_aag4u/pages/pdfView.dart';
import 'package:flutter_aag4u/pages/profilePage.dart';
import 'package:flutter_aag4u/plugins/zoombuttons_plugin.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:latlong2/latlong.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';

// class SurveyPage extends StatelessWidget {
//   const SurveyPage(
//       {super.key, required bool isRegistered, required bool login});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SurveyPage(),
//     );
//   }
// }

class SurveyPage extends StatefulWidget {
  @override
  const SurveyPage(
      {super.key, required bool isRegistered, required bool login});
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<dynamic> requestData = [];
  List<dynamic> surveyData = [];
  List<dynamic> offerData = [];
  List<dynamic> dealData = [];
  bool isLoading = true;
  bool hasInternet = true;
  Box loginBox = Hive.box('loginBox');
  bool _isLoadingdata = true;

  @override
  void initState() {
    super.initState();
    fetchData();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (mounted) {
      setState(() {
        hasInternet = isConnected;
        isLoading = false;
      });
    }
  }

  Future<void> fetchData() async {
    var loginBox = await Hive.openBox('loginBox');
    var mail = loginBox.get('email');

    setState(() {
      _isLoadingdata = true;
    });
    // if (mail == "" || mail == null) {
    //   // Jika sudah login, arahkan ke halaman ProfilePage

    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => ProfilePage(
    //         isRegistered: false,
    //         login: false,
    //       ),
    //     ),
    //   );
    //   // Tampilkan alert jika belum login
    // }
    try {
      var box = await Hive.openBox('loginBox');
      var email = box.get('email');

      final requestResponse = await http
          .get(Uri.parse('https://app.aag4u.co.id/api/getProgres/1/$email'));

      final surveyResponse = await http
          .get(Uri.parse('https://app.aag4u.co.id/api/getProgres/2/$email'));

      final offerResponse = await http
          .get(Uri.parse('https://app.aag4u.co.id/api/getProgres/3/$email'));

      final dealResponse = await http
          .get(Uri.parse('https://app.aag4u.co.id/api/getProgres/4/$email'));
      // if (requestResponse == 200) {
      setState(() {
        requestData = json.decode(requestResponse.body);
        surveyData = json.decode(surveyResponse.body);
        offerData = json.decode(offerResponse.body);
        dealData = json.decode(dealResponse.body);
        _isLoadingdata = false;
      });
      isLoading = false;
      // } else {
      //   throw Exception('Failed to load data');
      // }
    } catch (e) {
      print('Error: $e');
      // setState(() {
      isLoading = false;
      // });
    }
  }

  Future<void> _loadingData() async {
    // Simulasi delay untuk menunjukkan loading
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      _isLoadingdata = true; // Selesai memuat data
    });
  }

  @override
  // _PdfViewerPageState createState() => _PdfViewerPageState();
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double inWidth = MediaQuery.of(context).size.width;
    double inheight = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder(
        future: InternetConnectionChecker().hasConnection,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data == false) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/assets/No_internet.png', width: screenWidth * 0.5,
                    // height: screenheight * 0.9,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No Internet Connection',
                    style: TextStyle(
                        fontSize: fontSize * 0.04, color: Colors.black54),
                  ),
                  // SizedBox(height: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {});
                  //   },
                  //   child: Text('Retry'),
                  // )
                ],
              ),
            );
          } else {
            return ValueListenableBuilder(
              valueListenable:
                  loginBox.listenable(), // Listen for changes in the Hive box
              builder: (context, Box box, _) {
                String? _email = box.get('email');

                if (_email == null) {
                  // If email is null, show the sign-in page
                  return ProfilePage(
                    isRegistered: false,
                    login: false,
                  );
                } else {
                  // If email is not null, show the profile page
                  return DefaultTabController(
                    length: 4,
                    child: Scaffold(
                      appBar: AppBar(
                        toolbarHeight: screenheight * 0.09,
                        title: Text(
                          'Treatment Progress',
                          style: TextStyle(fontSize: fontSize * 0.04),
                        ),
                        centerTitle: true,
                        bottom: TabBar(
                          // labelPadding: EdgeInsets.only(
                          //   bottom: 50,
                          // ),
                          tabs: [
                            Tab(text: 'Request'),
                            Tab(text: 'Survey'),
                            Tab(text: 'Offer'),
                            Tab(text: 'Deal'),
                          ],
                          labelStyle: TextStyle(fontSize: fontSize * 0.03),
                        ),
                      ),
                      body: _isLoadingdata
                          ? Center(
                              child: LoadingAnimationWidget.inkDrop(
                                color: const Color.fromARGB(255, 34, 20, 227),
                                size: 50,
                              ),
                            )
                          : hasInternet
                              ? TabBarView(
                                  children: [
                                    RequestTab(requestData: requestData),
                                    SurveyTab(surveyData: surveyData),
                                    OfferTab(offerData: offerData),
                                    DealTab(dealData: dealData),
                                  ],
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'images/assets/No_internet.png',
                                        width: screenWidth * 0.4,
                                        height: screenheight * 0.3,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(height: 16),
                                      Text('No Internet Connection',
                                          style: TextStyle(
                                              fontSize: fontSize * 0.04)),
                                    ],
                                  ),
                                ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),

      //     ValueListenableBuilder(
      //   valueListenable:
      //       loginBox.listenable(), // Listen for changes in the Hive box
      //   builder: (context, Box box, _) {
      //     String? _email = box.get('email');

      //     if (_email == null) {
      //       // If email is null, show the sign-in page
      //       return ProfilePage(
      //         isRegistered: false,
      //         login: false,
      //       );
      //     } else {
      //       // If email is not null, show the profile page
      //       return DefaultTabController(
      //         length: 4,
      //         child: Scaffold(
      //           appBar: AppBar(
      //             title: Text('Treatment Progress'),
      //             centerTitle: true,
      //             bottom: TabBar(
      //               tabs: [
      //                 Tab(text: 'Request'),
      //                 Tab(text: 'Survey'),
      //                 Tab(text: 'Offer'),
      //                 Tab(text: 'Deal'),
      //               ],
      //             ),
      //           ),
      //           body: _isLoadingdata
      //               ? Center(
      //                   child: LoadingAnimationWidget.inkDrop(
      //                     color: const Color.fromARGB(255, 34, 20, 227),
      //                     size: 50,
      //                   ),
      //                 )
      //               : hasInternet
      //                   ? TabBarView(
      //                       children: [
      //                         RequestTab(requestData: requestData),
      //                         SurveyTab(surveyData: surveyData),
      //                         OfferTab(offerData: offerData),
      //                         DealTab(dealData: dealData),
      //                       ],
      //                     )
      //                   : Center(
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Image.asset(
      //                             'images/assets/No_internet.png',
      //                             width: 200,
      //                             height: 200,
      //                             fit: BoxFit.cover,
      //                           ),
      //                           SizedBox(height: 16),
      //                           Text('No Internet Connection',
      //                               style: TextStyle(fontSize: 18)),
      //                         ],
      //                       ),
      //                     ),
      //         ),
      //       );
      //     }
      //   },
      // )
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
      'https://app.aag4u.co.id/public/image/penawaran/'; // URL default

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Container(
          height: screenheight * 0.3, // Ubah tinggi sesuai kebutuhan
          padding: EdgeInsets.all(10), // Padding opsional untuk estetika
          color: Colors.white, // Warna background opsional
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

class RequestTab extends StatefulWidget {
  final List<dynamic> requestData;
  // State<RequestTab> createState() => _RequestTabState();
  RequestTab({required this.requestData});

  @override
  State<RequestTab> createState() => _RequestTabState();
}

class _RequestTabState extends State<RequestTab> {
  // bool _isLoadingdata = true;

  // Future<void> _loadingData() async {
  //   // Simulasi delay untuk menunjukkan loading
  //   await Future.delayed(Duration(seconds: 2));
  //   setState(() {
  //     _isLoadingdata = true; // Selesai memuat data
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double inWidth = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;

    return Scaffold(
        body: ListView.builder(
      itemCount: widget.requestData.length,
      itemBuilder: (context, index) {
        // Assuming `productName` and `purchaseDate` are part of `requestData`
        // List<dynamic> hama = requestData[index]['survey_hama'];
        final hama = widget.requestData[index]['survey_hama'] as List<dynamic>;
        final hamaNames = hama
            .map((hama) =>
                (hama as Map<String, dynamic>)['hama']['nama_hama'] ??
                'No name')
            .join(', ');
        final hama_lainnya = widget.requestData[index]['hama_lainnya'];
        DateTime purchaseDate = DateTime.parse(
            widget.requestData[index]['jadwal']); // Assuming it's a date string
        String displayHamaData() {
          if (hamaNames.isNotEmpty && (hama_lainnya?.isNotEmpty ?? false)) {
            // Both hamaNames and hama_lainnya have values
            return '$hamaNames, $hama_lainnya';
          } else if (hamaNames.isNotEmpty && (hama_lainnya?.isEmpty ?? true)) {
            // Only hamaNames has a value
            return hamaNames;
          } else if (hamaNames.isEmpty && (hama_lainnya?.isNotEmpty ?? false)) {
            // Only hama_lainnya has a value
            return hama_lainnya!;
          }
          return 'No data available';
        }

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Warna background box
              borderRadius: BorderRadius.circular(
                  12.0), // Border radius untuk melengkungkan sudut
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.1), // Shadow dengan transparansi
                  blurRadius: 6.0, // Radius blur shadow
                  offset: Offset(0, 3), // Posisi shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.file_copy,
                      size: iconSize * 0.05, color: Colors.blue),
                  title: Text(
                    displayHamaData(),
                    style: TextStyle(
                        fontSize: fontSize * 0.04, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Survey on: ${purchaseDate.day}/${purchaseDate.month}/${purchaseDate.year} - ${widget.requestData[index]['jam']}',
                        style: TextStyle(
                            fontSize: fontSize * 0.04, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${widget.requestData[index]['provinsi']} - ${widget.requestData[index]['kota']}',
                        style: TextStyle(
                            fontSize: fontSize * 0.04, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    ));
  }
}

/// End Code RequestTab ///

class SurveyTab extends StatelessWidget {
  final List<dynamic> surveyData;
  SurveyTab({required this.surveyData});

  // final String productName = "Kecoa,Lalat,Semut";
  // final DateTime purchaseDate = DateTime(2024, 9, 1);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double inWidth = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
        itemCount: surveyData.length,
        itemBuilder: (context, index) {
          final hama = surveyData[index]['survey_hama'] as List<dynamic>;
          final hamaNames = hama
              .map((hama) =>
                  (hama as Map<String, dynamic>)['hama']['nama_hama'] ??
                  'No name')
              .join(', ');
          final hama_lainnya = surveyData[index]['hama_lainnya'];
          String displayHamaData() {
            if (hamaNames.isNotEmpty && (hama_lainnya?.isNotEmpty ?? false)) {
              // Both hamaNames and hama_lainnya have values
              return '$hamaNames, $hama_lainnya';
            } else if (hamaNames.isNotEmpty &&
                (hama_lainnya?.isEmpty ?? true)) {
              // Only hamaNames has a value
              return hamaNames;
            } else if (hamaNames.isEmpty &&
                (hama_lainnya?.isNotEmpty ?? false)) {
              // Only hama_lainnya has a value
              return hama_lainnya!;
            }
            return 'No data available';
          }

          DateTime purchaseDate = DateTime.parse(surveyData[index]['jadwal']);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: screenWidth * 1.4,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.file_copy,
                        size: iconSize * 0.05, color: Colors.blue),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kami akan melakukan survey terkait hama :',
                          style: TextStyle(fontSize: fontSize * 0.04),
                        ),
                        SizedBox(height: 4),
                        Text(
                          displayHamaData(),
                          style: TextStyle(
                              fontSize: fontSize * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Survey on: ${purchaseDate.day}/${purchaseDate.month}/${purchaseDate.year} - ${surveyData[index]['jam']}',
                          style: TextStyle(
                              fontSize: fontSize * 0.04, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${surveyData[index]['provinsi']} - ${surveyData[index]['kota']}',
                          style: TextStyle(
                              fontSize: fontSize * 0.04, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.width > 800
                        ? screenheight * 0.6 // Tablet: Ukuran lebih besar
                        : screenheight * 0.3, // HP: Ukuran standar
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.6,
                          height: screenheight * 0.9,
                          child: FlutterMap(
                            options: MapOptions(
                              initialCenter: LatLng(
                                  double.parse(
                                      surveyData[index]['lat'].toString()),
                                  double.parse(
                                      surveyData[index]['lon'].toString())),
                              initialZoom: 13,
                            ),
                            children: [
                              openStreetMapTileLayer,
                              const FlutterMapZoomButtons(
                                minZoom: 4,
                                maxZoom: 19,
                                mini: true,
                                // padding: 20,
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class OfferTab extends StatelessWidget {
  final List<dynamic> offerData;
  OfferTab({required this.offerData});

  // final String productName = "Kecoa,Lalat,Semut";
  // final DateTime purchaseDate = DateTime(2024, 9, 1);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double inWidth = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView.builder(
        itemCount: offerData.length,
        itemBuilder: (context, index) {
          final hama = offerData[index]['survey_hama'] as List<dynamic>;
          final hamaNames = hama
              .map((hama) =>
                  (hama as Map<String, dynamic>)['hama']['nama_hama'] ??
                  'No name')
              .join(', ');
          final hama_lainnya = offerData[index]['hama_lainnya'];
          String displayHamaData() {
            if (hamaNames.isNotEmpty && (hama_lainnya?.isNotEmpty ?? false)) {
              // Both hamaNames and hama_lainnya have values
              return '$hamaNames, $hama_lainnya';
            } else if (hamaNames.isNotEmpty &&
                (hama_lainnya?.isEmpty ?? true)) {
              // Only hamaNames has a value
              return hamaNames;
            } else if (hamaNames.isEmpty &&
                (hama_lainnya?.isNotEmpty ?? false)) {
              // Only hama_lainnya has a value
              return hama_lainnya!;
            }
            return 'No data available';
          }

          String url =
              'https://app.aag4u.co.id/public/image/penawaran/${offerData[index]['file_penawaran']}';
          DateTime purchaseDate = DateTime.parse(offerData[index]['jadwal']);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              // height: screenheight * 0.7,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.picture_as_pdf,
                        size: iconSize * 0.07, color: Colors.red),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Berikut Penawaran yang kami berikan beserta hasil surveinya :',
                          style: TextStyle(fontSize: fontSize * 0.04),
                        ),
                        SizedBox(height: 4),
                        Text(
                          displayHamaData(),
                          style: TextStyle(
                              fontSize: fontSize * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Survey on: ${purchaseDate.day}/${purchaseDate.month}/${purchaseDate.year} - ${offerData[index]['jam']}',
                          style: TextStyle(
                              fontSize: fontSize * 0.04, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${offerData[index]['provinsi']} - ${offerData[index]['kota']}',
                          style: TextStyle(
                              fontSize: fontSize * 0.04, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 36),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Viewpdf(
                              pdfUrl:
                                  'https://app.aag4u.co.id/public/image/penawaran/${offerData[index]['file_penawaran']}', // Ganti URL PDF di sini
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'View PDF',
                        style: TextStyle(fontSize: fontSize * 0.04),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  PdfView(url: url),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DealTab extends StatelessWidget {
  final List<dynamic> dealData;
  DealTab({required this.dealData});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double inWidth = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
        itemCount: dealData.length,
        itemBuilder: (context, index) {
          final hama = dealData[index]['survey_hama'] as List<dynamic>;
          final hamaNames = hama
              .map((hama) =>
                  (hama as Map<String, dynamic>)['hama']['nama_hama'] ??
                  'No name')
              .join(', ');
          final hama_lainnya = dealData[index]['hama_lainnya'];
          String displayHamaData() {
            if (hamaNames.isNotEmpty && (hama_lainnya?.isNotEmpty ?? false)) {
              // Both hamaNames and hama_lainnya have values
              return '$hamaNames, $hama_lainnya';
            } else if (hamaNames.isNotEmpty &&
                (hama_lainnya?.isEmpty ?? true)) {
              // Only hamaNames has a value
              return hamaNames;
            } else if (hamaNames.isEmpty &&
                (hama_lainnya?.isNotEmpty ?? false)) {
              // Only hama_lainnya has a value
              return hama_lainnya!;
            }
            return 'No data available';
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.check_circle_outline_outlined,
                      size: iconSize * 0.07,
                      color: const Color.fromARGB(255, 68, 243, 33)),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kami akan melakukan Treatment terkait hama:',
                        style: TextStyle(fontSize: fontSize * 0.04),
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
                        displayHamaData(),
                        style: TextStyle(
                            fontSize: fontSize * 0.04, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${dealData[index]['provinsi']} - ${dealData[index]['kota']}',
                        style: TextStyle(
                            fontSize: fontSize * 0.04, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${dealData[index]['alamat']}',
                        style: TextStyle(
                            fontSize: fontSize * 0.04, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.picture_as_pdf_rounded,
                      size: iconSize * 0.07,
                      color: const Color.fromARGB(255, 243, 33, 33)),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Berikut File kontrak / Agreement untuk Kerjasama ini',
                        style: TextStyle(fontSize: fontSize * 0.04),
                      ),
                      SizedBox(height: 26),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Viewpdf(
                                  pdfUrl:
                                      'https://app.aag4u.co.id/public/image/perjanjian/${dealData[index]['file_perjanjian']}', // Ganti URL PDF di sini
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'View PDF',
                            style: TextStyle(fontSize: fontSize * 0.04),
                          ),
                        ),
                      ),
                      // SizedBox(height: 4),
                      // Text(
                      //   productName,
                      //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                ),
                // SizedBox(height: 26),
                // const Divider(
                //     color: Color.fromARGB(255, 155, 154, 154), thickness: 2),
              ],
            ),
          );
        },
      ),
    );
  }
}
