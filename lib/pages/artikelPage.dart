import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class artikelPage extends StatefulWidget {
  final int blogId;
  // const DetailBlogWidget({required this.blogId, super.key});

  const artikelPage({
    super.key,
    required this.blogId,
  });

  @override
  State<artikelPage> createState() => _artikelPageState();
}

class _artikelPageState extends State<artikelPage> {
  Future<Map<String, dynamic>>? futureBlogDetail;

  @override
  void initState() {
    super.initState();
    // futureBlogDetail = fetchBlogDetail();
  }

  Future<Map<String, dynamic>> fetchBlogDetail(int blogId) async {
    final response = await http
        .get(Uri.parse('https://www.app.aag4u.co.id/api/getPost/$blogId'));

    if (response.statusCode == 200) {
      print('aaaaaa ${response}');
      return json.decode(response.body);
    } else {
      print('gagal');
      throw Exception('Failed to load blog detail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Container(
          // color: Colors.amber,
          // height: 300,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Image.asset(
                            "images/icons/aagu.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        // Text(
                        //   "data",
                        //   style: TextStyle(color: Colors.black, fontSize: 5),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<Map<String, dynamic>>(
              future: futureBlogDetail,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(data['photo'].toString()),
                        SizedBox(height: 16),
                        Text(
                          data['title'].toString(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          data[
                              'content'], // Assuming the API returns a `content` field
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text("No data available"));
                }
              },
            ),
          ],
        ),
      )),
      // bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}


// // blog_detail_page.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart'; // Import flutter_html package

// class artikelPage extends StatelessWidget {
//   final int id;
//   final String title;
//   final String photo;
//   final String body;

//   const artikelPage({
//     Key? key,
//     required this.id,
//     required this.title,
//     required this.photo,
//     required this.body,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text(title),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(photo),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Html(
//                 data: body, // Render HTML content
//                 style: {
//                   "body": Style(
//                     fontSize: FontSize(16),
//                   ),
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
