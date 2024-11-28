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

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
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
    // final data = ModalRoute.of(context)!.settings.arguments;
    // if (data is RemoteMessage) {
    //   payload = data.data;
    // }

    // if (data is NotificationResponse) {
    //   payload = jsonDecode(data.payload!);
    // }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/icons/aagu.png",
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        // child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //     ElevatedButton(
        //       onPressed: () {
        //         NotificationController.createNewNotification();
        //       },
        //       child:  Text('SHOW NOTIFICATION : '),
        //     )
        //   ])
        child: FutureBuilder<List<Blog>>(
          future: futureBlog,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              List<Blog> posts = snapshot.data!;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(builder: (context) => artikelPage()),
                      // );
                    },
                    child: Card(
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            posts[index].photo,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              posts[index].title,
                              style: TextStyle(
                                fontSize: 16,
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
    );
  }
}

// if length != 
// box.clear

// photos = last(/).blog photo
// base64 = buatBase64(photos)



// fgff = [
//   id: lkl,
//   photo: base54,
//   titl:b;og.ti

// ]

// box.put(fhghg)

// open.box map 
// ===============
// open.box map 