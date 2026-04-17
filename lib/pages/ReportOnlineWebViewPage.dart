import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReportOnlineWebViewPage extends StatefulWidget {
  const ReportOnlineWebViewPage({super.key});

  @override
  State<ReportOnlineWebViewPage> createState() => _ReportOnlineWebViewPageState();
}

class _ReportOnlineWebViewPageState extends State<ReportOnlineWebViewPage> {
  late final WebViewController _controller;
  int _loadingProgress = 0;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (!mounted) return;
            setState(() {
              _loadingProgress = progress;
            });
          },
          onWebResourceError: (error) {
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gagal memuat halaman: ${error.description}')),
            );
          },
        ),
      )
      ..loadRequest(Uri.parse('https://report.aag.co.id'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report online'),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: () {
              _controller.reload();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: _loadingProgress < 100
              ? LinearProgressIndicator(
                  value: _loadingProgress / 100,
                  minHeight: 3,
                )
              : const SizedBox(height: 3),
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
