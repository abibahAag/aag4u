import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/PusatBantuanPage.dart';
import 'package:url_launcher/url_launcher.dart';

class LayananPelanggan extends StatefulWidget {
  const LayananPelanggan({super.key});

  @override
  State<LayananPelanggan> createState() => _LayananPelangganState();
}

class _LayananPelangganState extends State<LayananPelanggan> {
  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidthIcon = MediaQuery.of(context).size.width * 0.05;
    double screenWidtAppBar = MediaQuery.of(context).size.width * 0.08;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidtAppBar,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: screenWidthIcon,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Pusatbantuanpage(),
              ),
              (route) => false, // Hapus semua halaman sebelumnya
            );
          },
        ),
        title: Text(
          "Layanan Pelanggan24",
          style: TextStyle(fontSize: fontSize),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;
            double imageWidth = screenWidth * 0.5;
            double cardWidth = screenWidth * 0.9;
            double cardHeight = screenWidth * 0.3;
            double ImageWidth = screenWidth * 0.1;
            double ImageHeight = screenWidth * 0.1;
            double fontSize = screenWidth * 0.04;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/tanya-aag.png",
                    width: imageWidth,
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () async {
                      final String phoneNumber = '+6282130002241';
                      final String message = Uri.encodeComponent(
                          'Halo, saya butuh bantuan pest control.');
                      final Uri whatsappUrl =
                          Uri.parse("https://wa.me/$phoneNumber?text=$message");

                      if (await canLaunchUrl(whatsappUrl)) {
                        await launchUrl(whatsappUrl,
                            mode: LaunchMode.externalApplication);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Tidak dapat membuka WhatsApp')),
                        );
                      }
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: cardWidth,
                        height: cardHeight,
                        // color: Colors.amber,
                        child: Row(
                          children: [
                            Image.asset(
                              "images/whatsapp.png",
                              width: ImageWidth,
                              height: ImageHeight,
                            ),
                            const SizedBox(width: 35),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "WhatsApp AAG4U",
                                    style: TextStyle(
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Interaksi dengan admin kami untuk informasi lebih lanjut",
                                    style: TextStyle(
                                        fontSize: fontSize * 0.8,
                                        color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
