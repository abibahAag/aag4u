import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Viewpdf extends StatelessWidget {
  final String pdfUrl;

  const Viewpdf({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF View')),
      body: SfPdfViewer.network(
        pdfUrl,
        canShowPaginationDialog: true,
        enableDoubleTapZooming: true,
      ),
    );
  }
}
