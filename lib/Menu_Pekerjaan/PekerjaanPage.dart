import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Pekerjaan/MenuPekerjaanWidget.dart';
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

class PekerjaanPage extends StatefulWidget {
  const PekerjaanPage({super.key});

  @override
  State<PekerjaanPage> createState() => _PekerjaanPageState();
}

class _PekerjaanPageState extends State<PekerjaanPage> {
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
  // Map payload = {};

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true, actions: <Widget>[
        Container(
          // color: Colors.amber,
          width: screenWidth,
          height: 300,

          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              "images/icons/aagu.png",
                              height: 50,
                              width: 100,
                            ),
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
      ]),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [MenuPekerjaanWidget()],
        ),
      )),
      // bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
