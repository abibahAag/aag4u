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
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shimmer/shimmer.dart';

class Blog {
  final int id;
  final String title;
  final String photo;
  final String body;

  Blog({
    required this.id,
    required this.title,
    required this.photo,
    required this.body,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    // Assuming 'photo' can either be a full URL or just an image name
    String imageName = json['photo'];

    // Check if the 'photo' field is already a full URL
    String imageUrl = imageName.startsWith('http')
        ? imageName
        : 'https://app.aag4u.co.id/public/image/blog/$imageName';

    return Blog(
      id: json['id'],
      title: json['title'],
      photo: imageUrl,
      body: json['body'] ?? '', // Handle body field
    );
  }
  // Method to convert Blog object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'photo': photo,
      'body': body,
    };
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

  // Future<List<Blog>> fetchBlog() async {
  //   isConnected = await InternetConnectionChecker().hasConnection;

  //   if (isConnected) {
  //     try {
  //       final response = await http.get(
  //         Uri.parse('https://app.aag4u.co.id/api/getPostLimit'),
  //       );
  //       if (response.statusCode == 200) {
  //         List jsonResponse = json.decode(response.body);
  //         List<Blog> blogs =
  //             jsonResponse.map((data) => Blog.fromJson(data)).toList();
  //         return blogs;
  //       } else {
  //         throw Exception('Failed to load blog posts');
  //       }
  //     } catch (e) {
  //       print('Error fetching data: $e');
  //       return _getPlaceholderBlogs();
  //     }
  //   } else {
  //     return _getPlaceholderBlogs();
  //   }
  // }
  List<Blog>? _cachedBlogs; // To cache the blogs in memory

  Future<List<Blog>> fetchBlog() async {
    var box = await Hive.openBox('blogBox'); // Open a Hive box for blogs

    // If the blogs are already cached in memory, return them
    if (_cachedBlogs != null) {
      return _cachedBlogs!;
    }

    bool isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      print('Fetching data from API');
      final response =
          await http.get(Uri.parse('https://app.aag4u.co.id/api/getPostLimit'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Blog> blogs =
            jsonResponse.map((data) => Blog.fromJson(data)).toList();

        // Update Hive with fetched data
        for (var blog in blogs) {
          String imageName =
              blog.photo.split('/').last; // Get image name from URL
          String? storedBase64Image =
              box.get(imageName); // Check if the image is already stored

          // Fetch the image as base64 and store it if needed
          String? newBase64Image = await fetchImageAsBase64(blog.photo);
          if (newBase64Image != null && newBase64Image != storedBase64Image) {
            await box.put(
                imageName, newBase64Image); // Update Hive with the new image
          }

          // Update Hive with Blog data
          await box.put(
              blog.id.toString(), blog.toJson()); // Save Blog object as JSON
        }

        // Cache the data and return it
        _cachedBlogs = blogs.reversed.toList(); // Cache the blogs in memory
        return _cachedBlogs!;
      } else {
        throw Exception('Failed to load blogs from API');
      }
    } else {
      // No internet: retrieve data from Hive
      print('No internet, fetching data from Hive');
      List<Blog> blogs = [];

      // Retrieve all blog data from Hive
      for (var key in box.keys) {
        Map<String, dynamic> blogData = box.get(key);
        blogs.add(
            Blog.fromJson(blogData)); // Recreate Blog objects from Hive data
      }

      // Cache the data and return it
      _cachedBlogs = blogs.reversed.toList(); // Cache the blogs in memory
      return _cachedBlogs!;
    }
  }

// Function to fetch an image as base64
  Future<String?> fetchImageAsBase64(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      // Convert bytes from the response body to base64
      return base64Encode(response.bodyBytes);
    }
    return null;
  }

  Future<void> _refreshData() async {
    await fetchBlog();
    setState(() {});
  }

  // Fetch blog posts from Hive
  Future<List<Blog>> _fetchBlogsFromHive() async {
    var box = await Hive.openBox('blogBox');
    List<Blog> blogs = [];

    // Loop through all keys in the Hive box and reconstruct Blog objects
    for (var key in box.keys) {
      Map<String, dynamic> blogData = box.get(key);
      if (blogData != null && blogData is Map<String, dynamic>) {
        blogs.add(Blog.fromJson(blogData)); // Convert JSON back to Blog object
      }
    }

    return blogs.reversed
        .toList(); // Return blogs in reverse order (newest first)
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double blogWidth = screenWidth * 0.7;

    return FutureBuilder<List<Blog>>(
      future: fetchBlog(), // Uses the cached or fetched data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          if (_cachedBlogs == null) {
            return buildShimmer(); // Show loading if no cached data
          } else {
            // If cached data is available, show it immediately
            return _buildBlogCarousel(_cachedBlogs!, screenWidth, blogWidth);
          }
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No blog posts available.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          );
        }

        // If data is loaded (from Hive or API), update the cached data
        _cachedBlogs = snapshot.data; // Cache the fetched data
        return _buildBlogCarousel(_cachedBlogs!, screenWidth, blogWidth);
      },
    );
  }

  // Build the carousel for displaying blog posts
  Widget _buildBlogCarousel(
      List<Blog> blogs, double screenWidth, double blogWidth) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
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
              items: blogs.map((blog) {
                return _buildBlogCard(blog, context, screenWidth, blogWidth);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlogCard(
      Blog blog, BuildContext context, double screenWidth, double blogWidth) {
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
                width: screenWidth,
                child: Image.network(
                  blog.photo,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Container(
                          width: blogWidth,
                          child: Text(
                            blog.title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   double blogWidth = MediaQuery.of(context).size.width * 0.7;

  //   return FutureBuilder<List<Blog>>(
  //     future: futureBlog, // Assume futureBlog is the future that fetches blogs
  //     builder: (context, snapshot) {
  //       // Check internet connection
  //       if (!isConnected) {
  //         // If no internet connection, show the asset image with a refresh button
  //         return SingleChildScrollView(
  //           scrollDirection: Axis.vertical,
  //           child: Column(
  //             children: [
  //               Image.asset(
  //                 'images/assets/No_internet.png',
  //                 width: 150,
  //                 height: 150,
  //                 fit: BoxFit.cover,
  //               ),
  //               SizedBox(height: 10),
  //               Text(
  //                 'Please check your internet connection and try again.',
  //                 textAlign: TextAlign.center,
  //               ),
  //               SizedBox(height: 20),
  //               ElevatedButton.icon(
  //                 onPressed: () async {
  //                   // Re-check internet connection and refresh the data
  //                   bool connection =
  //                       await InternetConnectionChecker().hasConnection;
  //                   if (connection) {
  //                     setState(() {
  //                       isConnected = true;
  //                       futureBlog = fetchBlog(); // Reload blog data
  //                     });
  //                   } else {
  //                     setState(() {
  //                       isConnected = false;
  //                     });
  //                     ScaffoldMessenger.of(context).showSnackBar(
  //                       SnackBar(
  //                           content: Text('No internet connection available')),
  //                     );
  //                   }
  //                 },
  //                 icon: Icon(Icons.refresh),
  //                 label: Text('Refresh'),
  //                 style: ElevatedButton.styleFrom(
  //                   foregroundColor: Colors.white,
  //                   backgroundColor: Colors.blue, // Text color
  //                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       }

  //       // If internet is connected, proceed with the regular FutureBuilder content
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       } else if (snapshot.hasError) {
  //         return Center(child: Text('Error: ${snapshot.error}'));
  //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //         return Center(
  //           child: Text(
  //             'No blog posts available.',
  //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //             textAlign: TextAlign.center,
  //           ),
  //         );
  //       }

  //       // If data is loaded, show the blog posts in a carousel
  //       return SingleChildScrollView(
  //         scrollDirection: Axis.vertical,
  //         child: Column(
  //           children: [
  //             Center(
  //               child: CarouselSlider(
  //                 options: CarouselOptions(
  //                   height: 310.0,
  //                   aspectRatio: 19 / 19,
  //                   viewportFraction: 0.8,
  //                   initialPage: 0,
  //                   enableInfiniteScroll: true,
  //                   reverse: false,
  //                   autoPlay: true,
  //                   autoPlayInterval: Duration(seconds: 5),
  //                   autoPlayAnimationDuration: Duration(milliseconds: 800),
  //                   autoPlayCurve: Curves.fastOutSlowIn,
  //                   enlargeCenterPage: true,
  //                   scrollDirection: Axis.horizontal,
  //                 ),
  //                 items: snapshot.data!.map((blog) {
  //                   return Builder(
  //                     builder: (BuildContext context) {
  //                       return InkWell(
  //                         onTap: () {
  //                           Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                               builder: (context) => Artikelwidget(
  //                                 id: blog.id,
  //                                 title: blog.title,
  //                                 photo: blog.photo,
  //                                 body: blog.body,
  //                               ),
  //                             ),
  //                           );
  //                         },
  //                         child: Container(
  //                           margin: EdgeInsets.symmetric(horizontal: 5.0),
  //                           decoration: BoxDecoration(
  //                             color: Colors.grey[100],
  //                             borderRadius: BorderRadius.circular(20),
  //                           ),
  //                           child: ClipRRect(
  //                             borderRadius: BorderRadius.circular(20),
  //                             child: Column(
  //                               children: [
  //                                 Container(
  //                                   width: screenWidth,
  //                                   child: Image.network(
  //                                     blog.photo,
  //                                     fit: BoxFit.cover,
  //                                   ),
  //                                 ),
  //                                 SizedBox(height: 10),
  //                                 Row(
  //                                   mainAxisAlignment: MainAxisAlignment.center,
  //                                   children: [
  //                                     Column(
  //                                       children: [
  //                                         Center(
  //                                           child: Container(
  //                                             width: blogWidth,
  //                                             child: Text(
  //                                               blog.title,
  //                                               style: TextStyle(
  //                                                 fontSize: 15,
  //                                                 fontWeight: FontWeight.bold,
  //                                               ),
  //                                               overflow: TextOverflow.visible,
  //                                             ),
  //                                           ),
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ],
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                   );
  //                 }).toList(),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

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
