// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/pages/TreatmentPage.dart';

// class InfoPage extends StatefulWidget {
//   @override
//   _InfoPageState createState() => _InfoPageState();
// }

// class _InfoPageState extends State<InfoPage> {
//   String selectedUserType = "Designer"; // Default selection

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//         ),
//         title: Text(
//           'AAG4U Treatment',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Center(
//                 child: Column(
//                   children: [
//                     // Text(
//                     //   'AAG4U Treatment',
//                     //   style: TextStyle(
//                     //     fontSize: 22,
//                     //     fontWeight: FontWeight.bold,
//                     //     color: Colors.grey,
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 5),
//               GridView.count(
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   _buildUserTypeButton('Pest Control'),
//                   _buildUserTypeButton('Rodent Control'),
//                   _buildUserTypeButton('Termite Control'),
//                   _buildUserTypeButton('Fumigation'),
//                 ],
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => TreatmentPage()),
//                   );
//                 },
//                 child:
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Icon(
//                     Icons.remove_red_eye_outlined,
//                     color: Colors.white,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     'Video Feed Treatment',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ]),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding: EdgeInsets.symmetric(vertical: 15),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               GridView.count(
//                 crossAxisCount: 1,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   _buildUserTypeButton('General Treatment'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildUserTypeButton(String title, {bool isSelected = false}) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedUserType = title;
//         });
//       },
//       child: Container(
//         margin: EdgeInsets.all(8),
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: Colors.blue,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Icon(Icons.person,
//             //     size: 40, color: isSelected ? Colors.white : Colors.black),
//             SizedBox(height: 10),
//             Center(
//               // Center the text
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/homepage.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class InfoPage extends StatefulWidget {
  //final String pdfUrl; // Menerima parameter URL PDF

  //InfoPage({required this.pdfUrl});
  @override
  _PdfFullScreenViewState createState() => _PdfFullScreenViewState();
}

class _PdfFullScreenViewState extends State<InfoPage> {
  // String pdfUrl =
  //     'https://atrindo.network/assets/images/attach/20210408135121.pdf'; // Ganti dengan URL PDF
  File? pdfFile;
  PDFViewController? pdfViewController;
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  bool _isLoadingdata = true;
  bool? hasInternet;

  @override
  void initState() {
    super.initState();
    _downloadPdf();
    checkInternet();
  }

  Future<void> _downloadPdf() async {
    try {
      // Mendapatkan data JSON dari API
      final apiResponse = await Dio().get(
          'https://app.aag4u.co.id/api/getCompro'); // Ganti dengan endpoint API Anda

      // Memastikan API memberikan respons yang valid
      if (apiResponse.statusCode == 200 && apiResponse.data != null) {
        final jsonData = apiResponse.data;
        final fileName =
            jsonData['company']; // Mendapatkan nama file dari respons JSON

        if (fileName != null) {
          // Mengunduh file PDF berdasarkan nama file
          final fileResponse = await Dio().get(
            'https://app.aag4u.co.id/public/image/compro/$fileName', // Ganti dengan URL untuk mengakses file PDF
            options: Options(responseType: ResponseType.bytes),
          );

          final pdfBytes = fileResponse.data as Uint8List;

          // Menyimpan PDF ke file sementara
          final directory = await Directory.systemTemp.createTemp();
          final filePath = '${directory.path}/$fileName';
          pdfFile = File(filePath);
          await pdfFile!.writeAsBytes(pdfBytes);

          setState(() {});
        } else {
          if (mounted) {
            setState(() {
              errorMessage = 'Nama file PDF tidak ditemukan dalam respons API';
            });
          }
        }
      } else {
        setState(() {
          errorMessage = 'Gagal mendapatkan informasi PDF dari API';
        });
      }
    } catch (e) {
      print('Error fetching PDF from API: $e');
      if (mounted) {
        setState(() {
          errorMessage = 'Terjadi kesalahan saat mengunduh PDF';
        });
      }
    }
  }

  Future<void> checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    setState(() {
      hasInternet = result; // Perbarui hasil pengecekan
    });
  }

  Future<void> _loadingData() async {
    // Simulasi delay untuk menunjukkan loading
    await Future.delayed(Duration(seconds: 5));
    if (mounted) {
      setState(() {
        _isLoadingdata = true; // Selesai memuat data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double iconSize = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: screenWidth * 0.07,
          leading: IconButton(
            padding: EdgeInsets.only(bottom: 30),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: iconSize * 0.06,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      homePage(
                    isRegistered: false,
                    // login: false,
                    isLoggedIn: false,
                  ),
                ),
                (route) => false, // Menghapus semua rute sebelumnya
              );
            },
          ),
          title: Text(
            'AAG INFO',
            style: TextStyle(fontSize: fontSize * 0.04),
          ),
        ),
        body: hasInternet == false
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/assets/No_internet.png',
                      width: screenWidth * 0.6,
                      height: screenheight * 0.3,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Please check your internet connection and try again.',
                      style: TextStyle(
                        fontSize: fontSize * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            : (pdfFile == null
                ? Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: const Color.fromARGB(255, 34, 20, 227),
                      size: 50,
                    ),
                  )
                : Stack(
                    children: <Widget>[
                      PDFView(
                        filePath: pdfFile!.path,
                        enableSwipe: true,
                        swipeHorizontal: false,
                        autoSpacing: false,
                        pageFling: false,
                        pageSnap: false,
                        onRender: (pages) {
                          setState(() {
                            this.pages = pages;
                            isReady = true;
                          });
                        },
                        onError: (error) {
                          setState(() {
                            errorMessage = error.toString();
                          });
                          print(error.toString());
                        },
                        onPageError: (page, error) {
                          setState(() {
                            errorMessage = '$page: ${error.toString()}';
                          });
                          print('$page: ${error.toString()}');
                        },
                        onViewCreated: (PDFViewController pdfViewController) {
                          setState(() {
                            this.pdfViewController = pdfViewController;
                          });
                        },
                        onPageChanged: (int? page, int? total) {
                          setState(() {
                            currentPage = page;
                          });
                          print('Page changed: $page/$total');
                        },
                      ),
                      if (!isReady)
                        Center(
                          child: LoadingAnimationWidget.inkDrop(
                            color: const Color.fromARGB(255, 34, 20, 227),
                            size: 50,
                          ),
                        ),
                      errorMessage.isNotEmpty
                          ? Center(
                              child: Text(errorMessage),
                            )
                          : Container(),
                    ],
                  ))

        // pdfFile == null
        //     ? Center(
        //         child: LoadingAnimationWidget.inkDrop(
        //           color: const Color.fromARGB(255, 34, 20, 227),
        //           size: 50,
        //         ),
        //       )
        //     : Stack(
        //         children: <Widget>[
        //           PDFView(
        //             filePath: pdfFile!.path,
        //             enableSwipe: true,
        //             swipeHorizontal: false, // Vertikal scroll
        //             autoSpacing: false, // Tanpa auto spacing antar halaman
        //             pageFling: false,
        //             pageSnap: false, // Animasi ketika swipe
        //             onRender: (pages) {
        //               setState(() {
        //                 this.pages = pages;
        //                 isReady = true;
        //               });
        //             },
        //             onError: (error) {
        //               setState(() {
        //                 errorMessage = error.toString();
        //               });
        //               print(error.toString());
        //             },
        //             onPageError: (page, error) {
        //               setState(() {
        //                 errorMessage = '$page: ${error.toString()}';
        //               });
        //               print('$page: ${error.toString()}');
        //             },
        //             onViewCreated: (PDFViewController pdfViewController) {
        //               setState(() {
        //                 this.pdfViewController = pdfViewController;
        //               });
        //             },
        //             onPageChanged: (int? page, int? total) {
        //               setState(() {
        //                 currentPage = page;
        //               });
        //               print('Page changed: $page/$total');
        //             },
        //           ),
        //           if (!isReady)
        //             Center(
        //               child: LoadingAnimationWidget.inkDrop(
        //                 color: const Color.fromARGB(255, 34, 20, 227),
        //                 size: 50,
        //               ),
        //             ),
        //           errorMessage.isNotEmpty
        //               ? Center(
        //                   child: Text(errorMessage),
        //                 )
        //               : Container(),
        //         ],
        //       ),
        );
  }
}
