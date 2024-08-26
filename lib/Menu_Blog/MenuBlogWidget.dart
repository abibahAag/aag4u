import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Promo/MenuPromoPage.dart';
import 'package:flutter_aag4u/widgets/ArtikelWidget.dart';
import 'package:http/http.dart' as http;

class Blog {
  final int idi;
  final String title;
  final String photo;
  final String body; // Add this field for the body

  Blog({
    required this.idi,
    required this.title,
    required this.photo,
    required this.body,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    String imageName = json['photo'];
    String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
    return Blog(
      idi: json['id'],
      title: json['title'],
      photo: imageUrl,
      body: json['body'] ?? '', // Adjust according to your API response
    );
  }
}

class Categori {
  final int id;
  final String category_name;

  Categori({required this.id, required this.category_name});

  factory Categori.fromJson(Map<String, dynamic> json) {
    return Categori(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      category_name: json['category_name'],
    );
  }
}

class MenuBlogWidget extends StatefulWidget {
  const MenuBlogWidget({super.key});

  @override
  State<MenuBlogWidget> createState() => _MenuBlogWidgetState();
}

class _MenuBlogWidgetState extends State<MenuBlogWidget> {
  Future<List<Blog>>? futureBlog;
  Future<List<Categori>>? futureCategori;

  Categori? selectedCategori;

  @override
  void initState() {
    super.initState();
    futureBlog = fetchBlog();
    futureCategori = fetchCategori();
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

  Future<List<Categori>> fetchCategori() async {
    final response =
        await http.get(Uri.parse('http://www.app.aag4u.co.id/api/getPostCate'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Categori.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Categori posts');
    }
  }

  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    double inWidth = MediaQuery.of(context).size.width * 0.8;

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
                                  "Blogs",
                                  style: TextStyle(
                                    fontSize: 35,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                FutureBuilder<List<Categori>>(
                  future: futureCategori,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('Tidak ada data kategori.'));
                    } else {
                      return Container(
                        width: inWidth,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonFormField<Categori>(
                          hint: Text('Pilih Kategori'),
                          value: selectedCategori,
                          onChanged: (Categori? newValue) {
                            setState(() {
                              selectedCategori = newValue;
                            });
                          },
                          items: snapshot.data!.map<DropdownMenuItem<Categori>>(
                              (Categori categori) {
                            return DropdownMenuItem<Categori>(
                              value: categori,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MenuPromoPage()),
                                    );
                                  },
                                  child: Text(categori.category_name)),
                            );
                          }).toList(),
                          isExpanded: true,
                          validator: (value) {
                            if (value == null) {
                              return 'Pilih Kategori';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            selectedCategori = value;
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),

                // Container(
                //   // color: Colors.amber,
                //   width: 300,
                //   height: 100,
                //   child: Padding(
                //     padding: const EdgeInsets.all(10.0),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         DropdownButtonFormField<String>(
                //           value: _selectedItem,
                //           hint: Text('Pilih Kategori'),
                //           onChanged: (String? newValue) {
                //             setState(() {
                //               _selectedItem = newValue!;
                //             });
                //           },
                //           items: _dropdownItems.map((item) {
                //             return DropdownMenuItem<String>(
                //               value: item['id'],
                //               child: Text(item['name']!),
                //             );
                //           }).toList(),
                //           decoration: InputDecoration(
                //             labelText: 'Kategori Blog',
                //             border: OutlineInputBorder(),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.amber,
                  width: screenWidth,
                  height: 650,
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
                          // padding: const EdgeInsets.all(.0),
                          itemCount: posts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 2.0, // Spacing between columns
                            mainAxisSpacing: 5.0, // Spacing between rows
                            childAspectRatio: 0.8, // Aspect ratio for each item
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Artikelwidget(
                                      id: posts[index].idi,
                                      title: posts[index].title,
                                      photo: posts[index].photo,
                                      body: posts[index]
                                          .body, // Pass the body to the detail page
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                margin: EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      posts[index].photo,

                                      width: double.infinity,
                                      // width: 50,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, top: 15),
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
        ),
      ]),
    );
  }
}
