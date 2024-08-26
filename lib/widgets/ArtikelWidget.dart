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

// blog_detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // Import flutter_html package

class Artikelwidget extends StatelessWidget {
  final int id;
  final String title;
  final String photo;
  final String body;

  const Artikelwidget({
    Key? key,
    required this.id,
    required this.title,
    required this.photo,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(title),
          ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(photo),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Html(
                data: body, // Render HTML content
                style: {
                  "body": Style(
                    fontSize: FontSize(16),
                    lineHeight: LineHeight(1.5), // Mengatur jarak antar baris
                    padding: HtmlPaddings.symmetric(vertical: 8.0),
                    textAlign:
                        TextAlign.justify, // Mengatur teks agar rata kiri-kanan
                    textOverflow: TextOverflow.clip,
                  ),
                  "p": Style(
                    margin: Margins.only(bottom: 10.0), // Jarak antar paragraf
                  ),
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
