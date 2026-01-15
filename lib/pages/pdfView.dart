import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:typed_data';

class Viewpdf extends StatefulWidget {
  final String pdfUrl; // Menerima parameter URL PDF

  Viewpdf({required this.pdfUrl});
  @override
  _PdfFullScreenViewState createState() => _PdfFullScreenViewState();
}

class _PdfFullScreenViewState extends State<Viewpdf> {
  // String pdfUrl =
  //     'https://atrindo.network/assets/images/attach/20210408135121.pdf'; // Ganti dengan URL PDF
  File? pdfFile;
  PDFViewController? pdfViewController;
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _downloadPdf();
  }

  Future<void> _downloadPdf() async {
    try {
      // Mengunduh PDF dari URL menggunakan Dio
      final response = await Dio().get(
        widget.pdfUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      final bytes = response.data as Uint8List;

      // Menyimpan PDF ke file sementara
      final directory = await Directory.systemTemp.createTemp();
      final filePath = '${directory.path}/temp.pdf';
      pdfFile = File(filePath);
      await pdfFile!.writeAsBytes(bytes);

      setState(() {});
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF View'),
      ),
      body: pdfFile == null
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: <Widget>[
                PDFView(
                  filePath: pdfFile!.path,
                  enableSwipe: true,
                  swipeHorizontal: false, // Vertikal scroll
                  autoSpacing: false, // Tanpa auto spacing antar halaman
                  pageFling: true, // Animasi ketika swipe
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
                    child: CircularProgressIndicator(),
                  ),
                errorMessage.isNotEmpty
                    ? Center(
                        child: Text(errorMessage),
                      )
                    : Container(),
              ],
            ),
    );
  }
}
