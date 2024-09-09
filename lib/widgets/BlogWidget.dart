// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/pages/artikelPage.dart';
// import 'package:http/http.dart' as http;

// class Blog {
//   final int idi;
//   final String title;
//   final String photo;

//   Blog({required this.idi, required this.title, required this.photo});

//   factory Blog.fromJson(Map<String, dynamic> json) {
//     String imageName = json['photo'];
//     String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
//     return Blog(
//       idi: json['id'],
//       title: json['title'],
//       photo: imageUrl,
//     );
//   }
// }

// class Blogwidget extends StatefulWidget {
//   const Blogwidget({super.key});

//   @override
//   State<Blogwidget> createState() => _BlogWidgetState();
// }

// class _BlogWidgetState extends State<Blogwidget> {
//   Future<List<Blog>>? futureBlog;

//   @override
//   void initState() {
//     super.initState();
//     futureBlog = fetchBlog();
//   }

//   Future<List<Blog>> fetchBlog() async {
//     final response =
//         await http.get(Uri.parse('https://app.aag4u.co.id/api/getPostLimit'));

//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       // print('hjhjhjhj ${jsonResponse}  ');
//       return jsonResponse.map((data) => Blog.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load blog posts ${response}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return SingleChildScrollView(
//       // body: SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
//         child: FutureBuilder<List<Blog>>(
//           future: futureBlog,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text("${snapshot.error}"));
//             } else if (snapshot.hasData) {
//               List<Blog> posts = snapshot.data!;
//               return Column(
//                 children: posts.map((blog) {
//                   return InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => artikelPage()),
//                       );
//                     },
//                     child: Card(
//                       color: Colors.white,
//                       margin: EdgeInsets.only(top: 0, bottom: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.network(
//                             blog.photo,
//                             width: screenWidth,
//                             // height: 300,
//                             fit: BoxFit.cover,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               blog.title,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               );
//             } else {
//               return Center(child: Text("No data available"));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/pages/artikelPage.dart';
// import 'package:http/http.dart' as http;

// class Blog {
//   final int idi;
//   final String title;
//   final String photo;

//   Blog({required this.idi, required this.title, required this.photo});

//   factory Blog.fromJson(Map<String, dynamic> json) {
//     String imageName = json['photo'];
//     String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
//     return Blog(
//       idi: json['id'],
//       title: json['title'],
//       photo: imageUrl,
//     );
//   }
// }

// class Blogwidget extends StatefulWidget {
//   const Blogwidget({super.key});

//   @override
//   State<Blogwidget> createState() => _BlogWidgetState();
// }

// class _BlogWidgetState extends State<Blogwidget> {
//   Future<List<Blog>>? futureBlog;

//   @override
//   void initState() {
//     super.initState();
//     futureBlog = fetchBlog();
//   }

//   Future<List<Blog>> fetchBlog() async {
//     final response =
//         await http.get(Uri.parse('https://app.aag4u.co.id/api/getPostLimit'));

//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => Blog.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load blog posts ${response}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
//         child: FutureBuilder<List<Blog>>(
//           future: futureBlog,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text("${snapshot.error}"));
//             } else if (snapshot.hasData) {
//               List<Blog> posts = snapshot.data!;
//               return Column(
//                 children: posts.map((blog) {
//                   return InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               artikelPage(blogId: blog.idi),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       color: Colors.white,
//                       margin: EdgeInsets.only(top: 0, bottom: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.network(
//                             blog.photo,
//                             width: screenWidth,
//                             fit: BoxFit.cover,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               blog.title,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               );
//             } else {
//               return Center(child: Text("No data available"));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/widgets/ArtikelWidget.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:skeletonizer/skeletonizer.dart';
import 'package:shimmer/shimmer.dart';

class Blog {
  final int id;
  final String title;
  final String photo;
  final String body; // Add this field for the body

  Blog({
    required this.id,
    required this.title,
    required this.photo,
    required this.body,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    String imageName = json['photo'];
    String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
    return Blog(
      id: json['id'],
      title: json['title'],
      photo: imageUrl,
      body: json['body'] ?? '', // Adjust according to your API response
    );
  }
}

class Blogwidget extends StatefulWidget {
  const Blogwidget({super.key});

  @override
  State<Blogwidget> createState() => _BlogWidgetState();
}

class _BlogWidgetState extends State<Blogwidget> {
  Future<List<Blog>>? futureBlog;
  bool isConnected = true; // Assume initially connected

  @override
  void initState() {
    super.initState();
    futureBlog = fetchBlog();
  }

  Future<List<Blog>> fetchBlog() async {
    isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      try {
        final response = await http.get(
          Uri.parse('https://app.aag4u.co.id/api/getPostLimit'),
        );
        if (response.statusCode == 200) {
          List jsonResponse = json.decode(response.body);
          List<Blog> blogs =
              jsonResponse.map((data) => Blog.fromJson(data)).toList();
          return blogs;
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

  List<Blog> _getPlaceholderBlogs() {
    return [
      Blog(
        id: 0,
        title: '',
        photo: 'images/assets/No_internet.png',
        body: 'Please check your internet connection and try again.',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double blogWidth = MediaQuery.of(context).size.width * 0.7;
    return FutureBuilder<List<Blog>>(
      future: futureBlog,
      builder: (context, snapshot) {
        // Check internet connection
        if (!isConnected) {
          // If no internet connection, return only the asset image with a refresh button
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Image.asset(
                  'images/assets/No_internet.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Container(
                  // width: 300,
                  // height: 70,
                  child: Text(
                    'Please check your internet connection and try again.',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () async {
                    // Re-check the internet connection and refresh the data
                    bool connection =
                        await InternetConnectionChecker().hasConnection;
                    if (connection) {
                      setState(() {
                        isConnected = true;
                        futureBlog = fetchBlog();
                      });
                    } else {
                      setState(() {
                        isConnected = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('No internet connection available')),
                      );
                    }
                  },
                  icon: Icon(Icons.refresh),
                  label: Text('Refresh'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
              ],
            ),
          );
        }

        // If internet is connected, proceed with the regular FutureBuilder content
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              if (snapshot.connectionState == ConnectionState.waiting)
                CircularProgressIndicator()
              else if (snapshot.hasError)
                Text('Error: ${snapshot.error}')
              else if (!snapshot.hasData || snapshot.data!.isEmpty)
                Text(
                  'No blog posts available.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              else
                Center(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 310.0,
                      aspectRatio: 19 / 19,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: snapshot.data!.map((blog) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Artikelwidget(
                                    id: blog.id,
                                    title: blog.title,
                                    photo: blog.photo,
                                    body: blog.body,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              // width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.network(
                                        blog.photo,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Center(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                child: Text(
                                                  blog.title,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      height: 310.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) => Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildShimmer() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 24,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 16,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
