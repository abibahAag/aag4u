import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/FaqPage.dart';
import 'package:flutter_aag4u/pages/LayananPelangganPage.dart';
import 'package:flutter_aag4u/pages/homepage.dart';

class Pusatbantuanpage extends StatelessWidget {
  const Pusatbantuanpage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenWidthIcon = MediaQuery.of(context).size.width * 0.05;
    double screenWidthcart = MediaQuery.of(context).size.width * 0.09;
    double screenWidtAppBar = MediaQuery.of(context).size.width * 0.08;
    double screenHeightcart = MediaQuery.of(context).size.height * 0.01;
    double fontSize = MediaQuery.of(context).size.width * 0.04;

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
                    homePage(isRegistered: false, isLoggedIn: false),
              ),
              (route) => false, // Hapus semua halaman sebelumnya
            );
          },
        ),
        title: Text(
          "Pusat Bantuan ",
          style: TextStyle(fontSize: fontSize),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            children: [
              _buildMenuItem(
                context,
                icon: Icons.question_mark_sharp,
                title: "FAQ",
                description:
                    "Temukan jawaban atas pertanyaan yang sering diajukan",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FaqPage()));
                },
              ),
              SizedBox(height: 20),
              _buildMenuItem(
                context,
                icon: Icons.headset_mic_rounded,
                title: "Layanan Pelanggan",
                description: "Hubungi kami melalui Layanan Pest Control",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LayananPelanggan()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String title,
      required String description,
      required VoidCallback onTap}) {
    double screenWidthIcon = MediaQuery.of(context).size.width * 0.07;
    double screenWidthcart = MediaQuery.of(context).size.width * 0.09;
    double screenWidtAppBar = MediaQuery.of(context).size.width * 0.09;
    double screenHeightcart = MediaQuery.of(context).size.height * 0.01;
    double fontSize = MediaQuery.of(context).size.width * 0.04;

    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: screenWidthIcon),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: fontSize, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20),
                    Text(
                      description,
                      style: TextStyle(
                          fontSize: fontSize, color: Colors.grey[600]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2, // Maksimal 2 baris agar tidak kepanjangan
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
