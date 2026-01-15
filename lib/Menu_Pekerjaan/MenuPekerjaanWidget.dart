import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Blog {
  final int id;
  final String title;
  final String photo;

  Blog({required this.id, required this.title, required this.photo});

  factory Blog.fromJson(Map<String, dynamic> json) {
    String imageName = json['photo'];
    String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
    return Blog(
      id: json['id'],
      title: json['title'],
      photo: imageUrl,
    );
  }
}

class MenuPekerjaanWidget extends StatefulWidget {
  const MenuPekerjaanWidget({super.key});

  @override
  State<MenuPekerjaanWidget> createState() => _MenuPekerjaanWidgetState();
}

class _MenuPekerjaanWidgetState extends State<MenuPekerjaanWidget> {
  Future<List<Blog>>? futureBlog;

  @override
  void initState() {
    super.initState();
    futureBlog = fetchBlog();
  }

  Future<List<Blog>> fetchBlog() async {
    final response =
        await http.get(Uri.parse('http://www.app.aag4u.co.id/api/getPost'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Blog.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load blog posts');
    }
  }

  final List<Map<String, String>> _dropdownItems = [
    {'id': '1', 'name': 'Semut'},
    {'id': '2', 'name': 'Lalat'},
    {'id': '3', 'name': 'Kecoa'},
    {'id': '4', 'name': 'Nyamuk'},
    {'id': '5', 'name': 'Rayap'},
  ];

  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 15.0),
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Jenis Pekerjaan",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF233d63),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Column(
        //       children: [
        //         Container(
        //           // color: Colors.amber,
        //           width: 300,
        //           height: 130,
        //           child: Padding(
        //             padding: const EdgeInsets.all(16.0),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: <Widget>[
        //                 DropdownButtonFormField<String>(
        //                   value: _selectedItem,
        //                   hint: Text('Pilih Kategori'),
        //                   onChanged: (String? newValue) {
        //                     setState(() {
        //                       _selectedItem = newValue!;
        //                     });
        //                   },
        //                   items: _dropdownItems.map((item) {
        //                     return DropdownMenuItem<String>(
        //                       value: item['id'],
        //                       child: Text(item['name']!),
        //                     );
        //                   }).toList(),
        //                   decoration: InputDecoration(
        //                     labelText: 'Kategori Blog',
        //                     border: OutlineInputBorder(),
        //                   ),
        //                 ),
        //                 SizedBox(height: 20),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth,
                  height: 190,
                  child: FutureBuilder<List<Blog>>(
                    future: futureBlog,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else if (snapshot.hasData) {
                        List<Blog> posts = snapshot.data!;
                        return GridView.builder(
                          padding: const EdgeInsets.all(1.0),
                          itemCount: posts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 5.0, // Spacing between columns
                            mainAxisSpacing: 5.0, // Spacing between rows
                            childAspectRatio: 0.7, // Aspect ratio for each item
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // Navigate to another page
                              },
                              child: SizedBox(
                                height: 150,
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Set width to double.infinity and adjust height
                                      Image.network(
                                        posts[index].photo,
                                        width: double.infinity, // 100% width
                                        height:
                                            100, // Adjust height according to aspect ratio
                                        fit: BoxFit
                                            .cover, // Ensure the image covers the container
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          posts[index].title,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: Text("No data available"));
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
