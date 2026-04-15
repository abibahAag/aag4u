import 'package:flutter/material.dart';

class DetailPromo extends StatelessWidget {
  final String id;
  final String judul;
  final String deskripsi;
  final String mulai;
  final String akhir;
  final String gambar_promo;

  const DetailPromo({
    Key? key,
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.mulai,
    required this.akhir,
    required this.gambar_promo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.03;
    double screenWidthIcon = MediaQuery.of(context).size.width * 0.05;
    double screenHeight = MediaQuery.of(context).size.width * 0.09;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 154, 207),
      appBar: AppBar(
        toolbarHeight: screenHeight,
        backgroundColor: const Color.fromARGB(255, 118, 154, 207),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: screenWidthIcon,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                "Promo Detail",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize),
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // double screenWidth = constraints.maxWidth * 0.9;
          double contentWidth = MediaQuery.of(context).size.width * 0.9;
          double fontSize = MediaQuery.of(context).size.width * 0.03;
          double screenWidth = MediaQuery.of(context).size.width * 0.5;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        gambar_promo,
                        fit: BoxFit.cover,
                        width: contentWidth,
                        height: screenWidth,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    judul,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize + 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        "Valid: $mulai - $akhir",
                        style:
                            TextStyle(color: Colors.white, fontSize: fontSize),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white, thickness: 1),
                  const SizedBox(height: 20),
                  Text(
                    "Deskripsi:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize + 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    deskripsi,
                    style: TextStyle(color: Colors.white, fontSize: fontSize),
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
