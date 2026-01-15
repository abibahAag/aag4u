// import 'package:flutter/material.dart';

// class Artikelwidget extends StatelessWidget {
//   // const BennerWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       // body: SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//           child: Container(
//             // color: Colors.amber,
//             width: MediaQuery.of(context).size.width * 1,
//             child: Text(
//               "Waspada Demam Gigitan Tikus di Musim Hujan: Kenali Gejala dan Cara Pencegahannya",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 10, right: 10, top: 10),
//           child: Image.asset(
//             "images/blog/artikel2.webp",
//             // width: 500,
//             // height: 150,
//             width:
//                 MediaQuery.of(context).size.width * 0.9, // 90% of screen width
//             // height: MediaQuery.of(context).size.height * 0.3,
//             fit: BoxFit.contain,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
//           child: Container(
//             // color: Colors.amber,
//             width: MediaQuery.of(context).size.width * 1,
//             child: Text(
//               "Musim hujan identik dengan meningkatnya populasi tikus, hewan pengerat yang sering kali membawa penyakit berbahaya. Salah satu penyakit yang perlu diwaspadai adalah demam gigitan tikus atau rat bite fever (RBF). RBF merupakan infeksi serius yang disebabkan oleh bakteri yang ditularkan melalui gigitan atau cakaran tikus yang terinfeksi. Bakteri penyebab RBF ada dua jenis, yaitu Streptobacillus moniliformis dan Spirillum minus.",
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
//           child: Container(
//             // color: Colors.amber,
//             width: MediaQuery.of(context).size.width * 1,
//             child: Text(
//               """Bagaimana Seseorang Bisa Tertular RBF?
//                 • Gigitan atau cakaran tikus: Ini merupakan cara paling umum penularan RBF.
//                 • Kontak dengan urin atau kotoran tikus: Bakteri RBF dapat mencemari makanan atau air yang kemudian dikonsumsi.
//                 • Kontak dengan benda yang terkontaminasi: Bakteri RBF dapat bertahan hidup di benda-benda seperti pakaian, tempat tidur, atau peralatan makan yang terkontaminasi urin atau kotoran tikus.""",
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
//           child: Container(
//             // color: Colors.amber,
//             width: MediaQuery.of(context).size.width * 1,
//             child: Text(
//               """Gejala Demam Gigitan Tikus: Gejala RBF bervariasi tergantung pada jenis bakterinya.                Gejala yang umum muncul adalah:
//                 · Demam: Demam dapat datang dan pergi selama beberapa minggu.
//                 · Nyeri sendi dan otot: Nyeri ini biasanya terjadi di punggung bawah.
//                 · Ruam: Ruam dapat muncul di dekat gigitan tikus.
//                 · Mual dan muntah.
//                 · Sakit tenggorokan.
//                 · Sakit kepala.""",
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // Import flutter_html package

class Artikelwidget extends StatelessWidget {
  final int id;
  final String title;
  final String photo; // Menggunakan Uint8List untuk gambar
  final String body;

  const Artikelwidget({
    Key? key,
    required this.id,
    required this.title,
    required this.photo, // Menggunakan Uint8List yang diterima dari widget sebelumnya
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.05,
        // backgroundColor: Colors.blueAccent, // Warna background
        centerTitle: false, // Pastikan title tidak berada di tengah
        titleSpacing: 0, // Hilangkan jarak antara leading dan title
        leadingWidth: screenWidth * 0.09,
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //   ),
        // ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: screenHeight * 0.02),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: screenWidth * 0.04,
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: fontSize * 0.04),
        ),
        // titleSpacing: screenWidth * 0.05, // Menambah jarak antara ikon & title
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tampilkan gambar dari Uint8List menggunakan Image.memory
            CachedNetworkImage(
              imageUrl: photo, // Atur tinggi gambar
              fit: BoxFit.contain,
              width: double.infinity,
              height: screenHeight * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: fontSize * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Html(
                data: body, // Render HTML content
                style: {
                  "p": Style(
                      fontSize: FontSize(fontSize * 0.04),
                      lineHeight: LineHeight(1.5)),
                  "font": Style(
                    fontFamily: 'CircularStd-book',
                    fontSize: FontSize(fontSize * 0.04),
                  ),
                  "span": Style(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize(fontSize * 0.04),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
