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

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart'; // Import flutter_html package
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Artikelpage extends StatefulWidget {
  final int id;
  final String title;
  final String photo; // Menggunakan Uint8List untuk gambar
  final String body;
  final String category;

  const Artikelpage({
    Key? key,
    required this.id,
    required this.title,
    required this.photo, // Menggunakan Uint8List yang diterima dari widget sebelumnya
    required this.body,
    required this.category,
  }) : super(key: key);

  factory Artikelpage.fromJson(Map<String, dynamic> json) {
    String imageName = json['photo'];
    String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
    return Artikelpage(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      photo: imageUrl,
      body: json['body'] ?? '',
    );
  }

  @override
  State<Artikelpage> createState() => _ArtikelpageState();
}

class _ArtikelpageState extends State<Artikelpage> {
  Future<List<Artikelpage>>? futureBlog;
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    futureBlog = fetchBlogcategoriid(widget.category);
    // futureCategori = fetchCategori();
  }

  Future<List<Artikelpage>> fetchBlogcategoriid(String category) async {
    isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      try {
        final response = await http.get(
          Uri.parse('https://app.aag4u.co.id/api/getPostCatePest/$category'),
        );

        if (response.statusCode == 200) {
          List jsonResponse = json.decode(response.body);
          return jsonResponse
              .map((data) => Artikelpage.fromJson(data))
              .toList();
        } else {
          throw Exception('Failed to load blog posts');
        }
      } catch (e) {
        print('Error fetching data: $e');
        return _getPlaceholderBlogs();
      }
    } else {
      return _getPlaceholderBlogs();
    }
  }

  List<Artikelpage> _getPlaceholderBlogs() {
    return [
      Artikelpage(
        id: 0,
        title: '',
        photo: 'images/assets/No_internet.png',
        body: 'Please check your internet connection and try again.',
        category: "",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 1;
    double inWidth = MediaQuery.of(context).size.width * 0.8;
    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    // double screenWidth = MediaQuery.of(context).size.width;
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
          widget.title,
          style: TextStyle(fontSize: fontSize * 0.04),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.photo,
              fit: BoxFit.cover,
              width: double.infinity,
              height: screenHeight * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: fontSize * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Html(
                data: widget.body,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("Blog Lainnya",
                  style: TextStyle(
                      fontSize: fontSize * 0.04, fontWeight: FontWeight.bold)),
            ),
            FutureBuilder<List<Artikelpage>>(
              future: futureBlog,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: Color.fromARGB(255, 34, 20, 227),
                      size: 50,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (snapshot.hasData) {
                  List<Artikelpage> posts = snapshot.data!.reversed.take(4).toList();
                  return GridView.builder(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 0.8,
                      
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Artikelpage(
                                id: posts[index].id,
                                title: posts[index].title,
                                photo: posts[index].photo,
                                body: posts[index].body,
                                category: posts[index].category,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: posts[index].photo,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    height: 100,
                                    color: Colors.grey,
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  posts[index].title,
                                  style: TextStyle(
                                      fontSize: fontSize * 0.04,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                      child: Text(
                    "No data available",
                    style: TextStyle(fontSize: fontSize * 0.04),
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
