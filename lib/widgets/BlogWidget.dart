// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_aag4u/pages/artikelPage.dart';
// // import 'package:http/http.dart' as http;

// // class Blog {
// //   final int idi;
// //   final String title;
// //   final String photo;

// //   Blog({required this.idi, required this.title, required this.photo});

// //   factory Blog.fromJson(Map<String, dynamic> json) {
// //     String imageName = json['photo'];
// //     String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
// //     return Blog(
// //       idi: json['id'],
// //       title: json['title'],
// //       photo: imageUrl,
// //     );
// //   }
// // }

// // class Blogwidget extends StatefulWidget {
// //   const Blogwidget({super.key});

// //   @override
// //   State<Blogwidget> createState() => _BlogWidgetState();
// // }

// // class _BlogWidgetState extends State<Blogwidget> {
// //   Future<List<Blog>>? futureBlog;

// //   @override
// //   void initState() {
// //     super.initState();
// //     futureBlog = fetchBlog();
// //   }

// //   Future<List<Blog>> fetchBlog() async {
// //     final response =
// //         await http.get(Uri.parse('https://app.aag4u.co.id/api/getPostLimit'));

// //     if (response.statusCode == 200) {
// //       List jsonResponse = json.decode(response.body);
// //       // print('hjhjhjhj ${jsonResponse}  ');
// //       return jsonResponse.map((data) => Blog.fromJson(data)).toList();
// //     } else {
// //       throw Exception('Failed to load blog posts ${response}');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;

// //     return SingleChildScrollView(
// //       // body: SingleChildScrollView(
// //       scrollDirection: Axis.vertical,
// //       child: Padding(
// //         padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
// //         child: FutureBuilder<List<Blog>>(
// //           future: futureBlog,
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return Center(child: CircularProgressIndicator());
// //             } else if (snapshot.hasError) {
// //               return Center(child: Text("${snapshot.error}"));
// //             } else if (snapshot.hasData) {
// //               List<Blog> posts = snapshot.data!;
// //               return Column(
// //                 children: posts.map((blog) {
// //                   return InkWell(
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                             builder: (context) => artikelPage()),
// //                       );
// //                     },
// //                     child: Card(
// //                       color: Colors.white,
// //                       margin: EdgeInsets.only(top: 0, bottom: 10),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: [
// //                           Image.network(
// //                             blog.photo,
// //                             width: screenWidth,
// //                             // height: 300,
// //                             fit: BoxFit.cover,
// //                           ),
// //                           Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Text(
// //                               blog.title,
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 }).toList(),
// //               );
// //             } else {
// //               return Center(child: Text("No data available"));
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_aag4u/pages/artikelPage.dart';
// // import 'package:http/http.dart' as http;

// // class Blog {
// //   final int idi;
// //   final String title;
// //   final String photo;

// //   Blog({required this.idi, required this.title, required this.photo});

// //   factory Blog.fromJson(Map<String, dynamic> json) {
// //     String imageName = json['photo'];
// //     String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
// //     return Blog(
// //       idi: json['id'],
// //       title: json['title'],
// //       photo: imageUrl,
// //     );
// //   }
// // }

// // class Blogwidget extends StatefulWidget {
// //   const Blogwidget({super.key});

// //   @override
// //   State<Blogwidget> createState() => _BlogWidgetState();
// // }

// // class _BlogWidgetState extends State<Blogwidget> {
// //   Future<List<Blog>>? futureBlog;

// //   @override
// //   void initState() {
// //     super.initState();
// //     futureBlog = fetchBlog();
// //   }

// //   Future<List<Blog>> fetchBlog() async {
// //     final response =
// //         await http.get(Uri.parse('https://app.aag4u.co.id/api/getPostLimit'));

// //     if (response.statusCode == 200) {
// //       List jsonResponse = json.decode(response.body);
// //       return jsonResponse.map((data) => Blog.fromJson(data)).toList();
// //     } else {
// //       throw Exception('Failed to load blog posts ${response}');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;

// //     return SingleChildScrollView(
// //       scrollDirection: Axis.vertical,
// //       child: Padding(
// //         padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
// //         child: FutureBuilder<List<Blog>>(
// //           future: futureBlog,
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return Center(child: CircularProgressIndicator());
// //             } else if (snapshot.hasError) {
// //               return Center(child: Text("${snapshot.error}"));
// //             } else if (snapshot.hasData) {
// //               List<Blog> posts = snapshot.data!;
// //               return Column(
// //                 children: posts.map((blog) {
// //                   return InkWell(
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) =>
// //                               artikelPage(blogId: blog.idi),
// //                         ),
// //                       );
// //                     },
// //                     child: Card(
// //                       color: Colors.white,
// //                       margin: EdgeInsets.only(top: 0, bottom: 10),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: [
// //                           Image.network(
// //                             blog.photo,
// //                             width: screenWidth,
// //                             fit: BoxFit.cover,
// //                           ),
// //                           Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: Text(
// //                               blog.title,
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 }).toList(),
// //               );
// //             } else {
// //               return Center(child: Text("No data available"));
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:convert';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_aag4u/widgets/ArtikelWidget.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shimmer/shimmer.dart';

// class Blog {
//   final int id;
//   final String title;
//   final String photo;
//   final String body;

//   Blog({
//     required this.id,
//     required this.title,
//     required this.photo,
//     required this.body,
//   });

//   factory Blog.fromJson(Map<String, dynamic> json) {
//     // Assuming 'photo' can either be a full URL or just an image name
//     String imageName = json['photo'];

//     // Check if the 'photo' field is already a full URL
//     String imageUrl = imageName.startsWith('http')
//         ? imageName
//         : 'https://app.aag4u.co.id/public/image/blog/$imageName';

//     return Blog(
//       id: json['id'],
//       title: json['title'],
//       photo: imageUrl,
//       body: json['body'] ?? '', // Handle body field
//     );
//   }
//   // Method to convert Blog object back to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'photo': photo,
//       'body': body,
//     };
//   }
// }

// class Blogwidget extends StatefulWidget {
//   const Blogwidget({super.key});

//   @override
//   State<Blogwidget> createState() => _BlogWidgetState();
// }

// class _BlogWidgetState extends State<Blogwidget> {
//   Future<List<Blog>>? futureBlog;
//   bool isConnected = true; // Assume initially connected

//   @override
//   void initState() {
//     super.initState();
//     // futureBlog = fetchBlog();
//     futureBlog = compareAndSyncBlogData();
//   }

//   // Future<List<Blog>> fetchBlog() async {
//   //   isConnected = await InternetConnectionChecker().hasConnection;

//   //   if (isConnected) {
//   //     try {
//   //       final response = await http.get(
//   //         Uri.parse('https://app.aag4u.co.id/api/getPostLimit'),
//   //       );
//   //       if (response.statusCode == 200) {
//   //         List jsonResponse = json.decode(response.body);
//   //         List<Blog> blogs =
//   //             jsonResponse.map((data) => Blog.fromJson(data)).toList();
//   //         return blogs;
//   //       } else {
//   //         throw Exception('Failed to load blog posts');
//   //       }
//   //     } catch (e) {
//   //       print('Error fetching data: $e');
//   //       return _getPlaceholderBlogs();
//   //     }
//   //   } else {
//   //     return _getPlaceholderBlogs();
//   //   }
//   // }
//   List<Blog>? _cachedBlogs; // To cache the blogs in memory
//   bool _isLoading = false; // Flag to track loading state

//   Future<List<Blog>> fetchBlog() async {
//     var box = await Hive.openBox('blogBox'); // Open a Hive box for blogs
//     int hiveBlogCount = box.length;

//     // If the blogs are already cached in memory, return them
//     if (_cachedBlogs != null) {
//       return _cachedBlogs!;
//     }

//     // Prevent multiple simultaneous loading calls
//     if (_isLoading) {
//       return []; // Return empty list or you could choose to await until loading completes
//     }

//     _isLoading = true; // Set loading flag to true
//     bool isConnected = await InternetConnectionChecker().hasConnection;

//     if (isConnected) {
//       print('Fetching data from API');
//       try {
//         final response = await http
//             .get(Uri.parse('https://app.aag4u.co.id/api/getPostLimit'));

//         if (response.statusCode == 200) {
//           List jsonResponse = json.decode(response.body);
//           List<Blog> blogs =
//               jsonResponse.map((data) => Blog.fromJson(data)).toList();
//           int apiBlogCount = blogs.length;

//           if (hiveBlogCount != apiBlogCount) {
//             print(
//                 'Jumlah data Blog berbeda. Clearing Hive box and syncing with API data...');
//             await box.clear();

//             // Masukkan data dari API ke dalam Hive box
//             for (var blog in blogs) {
//               await box.put(blog.id,
//                   blog.toJson()); // Menggunakan put untuk menambah item Blog sebagai Map
//             }
//             print(
//                 'Sinkronisasi berhasil! Data dari API telah dimasukkan ke dalam Hive box.');
//           } else {
//             print('Jumlah data Blog di Hive box dan API sama: $hiveBlogCount');
//           }

//           // Check if the data in Hive box is the same as the fetched data
//           List<Blog> storedBlogs = [];
//           for (var key in box.keys) {
//             var blogData = box.get(key); // Retrieve the blog data

//             // Ensure blogData is a Map<String, dynamic> before using it
//             if (blogData is Map<String, dynamic>) {
//               storedBlogs.add(Blog.fromJson(
//                   blogData)); // Recreate Blog objects from Hive data
//             } else {
//               print(
//                   'Error: Data in Hive box for key $key is not a Map<String, dynamic>');
//             }
//           }

//           // Compare and clear if not matching
//           if (!areBlogsEqual(blogs, storedBlogs)) {
//             await box.clear(); // Clear Hive box if data is different
//           }

//           // Update Hive with fetched data
//           for (var blog in blogs) {
//             String imageName =
//                 blog.photo.split('/').last; // Get image name from URL
//             String? storedBase64Image =
//                 box.get(imageName); // Check if the image is already stored

//             // Fetch the image as base64 and store it if needed
//             String? newBase64Image = await fetchImageAsBase64(blog.photo);
//             if (newBase64Image != null && newBase64Image != storedBase64Image) {
//               await box.put(
//                   imageName, newBase64Image); // Update Hive with the new image
//             }

//             // Update Hive with Blog data
//             await box.put(
//                 blog.id.toString(), blog.toJson()); // Save Blog object as JSON
//           }

//           // Cache the data and return it
//           _cachedBlogs = blogs.reversed.toList(); // Cache the blogs in memory
//           return _cachedBlogs!;
//         } else {
//           print('Error response: ${response.statusCode}');
//         }
//       } catch (e) {
//         print('Exception occurred: $e');
//       }
//     } else {
//       //get box
//     }

//     // No internet: retrieve data from Hive
//     print('No internet, fetching data from Hive');
//     List<Blog> blogs = [];

//     // Retrieve all blog data from Hive
//     for (var key in box.keys) {
//       var blogData = box.get(key); // Retrieve the blog data

//       // Ensure blogData is a Map<String, dynamic> before using it
//       if (blogData is Map<String, dynamic>) {
//         blogs.add(
//             Blog.fromJson(blogData)); // Recreate Blog objects from Hive data
//       } else {
//         print(
//             'Error: Data in Hive box for key $key is not a Map<String, dynamic>');
//       }
//     }

//     // Cache the data and return it
//     _cachedBlogs = blogs.reversed.toList(); // Cache the blogs in memory
//     _isLoading = false; // Reset loading flag
//     return _cachedBlogs!;
//   }

// // Helper function to compare two lists of Blog objects
//   bool areBlogsEqual(List<Blog> blogs1, List<Blog> blogs2) {
//     if (blogs1.length != blogs2.length) return false;

//     for (int i = 0; i < blogs1.length; i++) {
//       if (blogs1[i].toJson() != blogs2[i].toJson()) {
//         return false;
//       }
//     }

//     return true;
//   }

// // Function to fetch an image as base64
//   Future<String?> fetchImageAsBase64(String imageUrl) async {
//     final response = await http.get(Uri.parse(imageUrl));
//     if (response.statusCode == 200) {
//       // Convert bytes from the response body to base64
//       return base64Encode(response.bodyBytes);
//     }
//     return null;
//   }

//   Future<void> _refreshData() async {
//     await fetchBlog();
//     setState(() {});
//   }

//   // Fetch blog posts from Hive
//   Future<List<Blog>> _fetchBlogsFromHive() async {
//     var box = await Hive.openBox('blogBox');
//     List<Blog> blogs = [];

//     // Loop through all keys in the Hive box and reconstruct Blog objects
//     for (var key in box.keys) {
//       var blogData = box.get(key);

//       // Ensure the fetched data is a Map and cast it to Map<String, dynamic>
//       if (blogData != null && blogData is Map) {
//         Map<String, dynamic> blogMap = Map<String, dynamic>.from(blogData);
//         blogs.add(Blog.fromJson(blogMap)); // Convert JSON back to Blog object
//       }
//     }

//     return blogs.reversed
//         .toList(); // Return blogs in reverse order (newest first)
//   }

//   /////////////////////////////////////////
// //   import 'package:hive/hive.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'dart:typed_data'; // Untuk mengelola tipe data byte

// // // Contoh model Blog
// // class Blog {
// //   final int id;
// //   final String title;
// //   final String photo; // Photo sekarang menjadi base64
// //   final String? body;

// //   Blog({required this.id, required this.title, required this.photo, this.body});

// //   factory Blog.fromJson(Map<String, dynamic> json) {
// //     return Blog(
// //       id: json['id'],
// //       title: json['title'],
// //       photo: json['photo'], // Sementara, kita akan mengisi ini nanti setelah konversi ke base64
// //       body: json['body'],
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'title': title,
// //       'photo': photo,
// //       'body': body,
// //     };
// //   }
// // }

//   // Future<List<Blog>> compareAndSyncBlogData() async {
//   //   var box = await Hive.openBox('blogBox');
//   //   int hiveBlogCount = box.length;
//   //   bool isConnected = await InternetConnectionChecker().hasConnection;
//   //   if (isConnected) {
//   //     String apiUrl =
//   //         'https://app.aag4u.co.id/api/getPostLimit'; // Ganti dengan URL API Anda
//   //     var response = await http.get(Uri.parse(apiUrl));
//   //     if (response.statusCode == 200) {
//   //       List<dynamic> apiResponse = json.decode(response.body);
//   //       List<Blog> apiBlogList =
//   //           apiResponse.map((json) => Blog.fromJson(json)).toList();
//   //       int apiBlogCount = apiBlogList.length;
//   //       if (hiveBlogCount != apiBlogCount) {
//   //         // print(
//   //         //     'Jumlah data Blog berbeda. Clearing Hive box and syncing with API data...');
//   //         await box.clear();
//   //         for (var Blog in apiBlogList) {
//   //           String imageName = Blog.photo.split('/').last;
//   //           String? base64Image = await fetchImageAsBase64(Blog.photo);
//   //           // if (base64Image != null) {
//   //           //   await box.put(imageName, base64Image);
//   //           // }

//   //         }
//   //         // Masukkan data dari API ke dalam Hive box
//   //         // for (var blog in apiBlogList) {
//   //         //   await box.put(blog.id, imageName,
//   //         //       // blog.toJson()
//   //         //       ); // Menggunakan put untuk menambah item Blog sebagai Map
//   //         // }
//   //         return await displayHiveBlogData();
//   //         // print(
//   //         //     'Sinkronisasi berhasil! Data dari API telah dimasukkan ke dalam Hive box.');
//   //       }
//   //       //  else {
//   //       //   print('Jumlah data Blog di Hive box dan API sama: $hiveBlogCount');
//   //       // }
//   //       return await displayHiveBlogData();
//   //       //     // Setelah sinkronisasi, ambil semua blog dari Hive box
//   //       //     //Kembalikan daftar blog
//   //     } else {
//   //       print(
//   //           'Gagal mendapatkan data dari API. Status code: ${response.statusCode}');
//   //       return []; // Kembalikan daftar kosong jika gagal
//   //     }
//   //   }
//   //   return await displayHiveBlogData();
//   // }

// // Fungsi untuk mengambil gambar dari URL dan mengonversinya menjadi Base64
//   Future<String> _convertImageToBase64(String imageUrl) async {
//     try {
//       final response = await http.get(Uri.parse(imageUrl));
//       if (response.statusCode == 200) {
//         Uint8List bytes =
//             response.bodyBytes; // Mendapatkan byte array dari gambar
//         return base64Encode(
//             bytes); // Mengonversi byte array menjadi string Base64
//       } else {
//         throw Exception('Failed to load image');
//       }
//     } catch (e) {
//       print('Error converting image to Base64: $e');
//       return '';
//     }
//   }

//   Future<List<Blog>> compareAndSyncBlogData() async {
//     var box = await Hive.openBox('blogBox');
//     int hiveBlogCount = box.length;
//     bool isConnected = await InternetConnectionChecker().hasConnection;

//     if (isConnected) {
//       String apiUrl =
//           'https://app.aag4u.co.id/api/getPostLimit'; // Ganti dengan URL API Anda
//       var response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         List<dynamic> apiResponse = json.decode(response.body);
//         List<Blog> apiBlogList =
//             apiResponse.map((json) => Blog.fromJson(json)).toList();
//         int apiBlogCount = apiBlogList.length;

//         if (hiveBlogCount != apiBlogCount) {
//           print(
//               'Jumlah data Blog berbeda. Clearing Hive box and syncing with API data...');
//           await box.clear();

//           // Masukkan data dari API ke dalam Hive box
//           for (var blog in apiBlogList) {
//             // Konversi gambar ke Base64
//             String base64Photo = await _convertImageToBase64(blog.photo);

//             // Ubah field 'photo' di Blog menjadi string Base64
//             Blog blogWithBase64Photo = Blog(
//               id: blog.id,
//               title: blog.title,
//               photo: base64Photo, // Simpan Base64 string dari gambar
//               body: blog.body,
//             );

//             await box.put(blogWithBase64Photo.id, blogWithBase64Photo.toJson());
//           }

//           print(
//               'Sinkronisasi berhasil! Data dari API telah dimasukkan ke dalam Hive box.');
//         } else {
//           print('Jumlah data Blog di Hive box dan API sama: $hiveBlogCount');
//         }

//         // Setelah sinkronisasi, ambil semua blog dari Hive box
//         return await displayHiveBlogData(); // Kembalikan daftar blog
//       } else {
//         print(
//             'Gagal mendapatkan data dari API. Status code: ${response.statusCode}');
//         return []; // Kembalikan daftar kosong jika gagal
//       }
//     } else {
//       print('Tidak ada koneksi internet.');
//       return await displayHiveBlogData(); // Jika tidak ada internet, kembalikan data dari Hive
//     }
//   }

//   Future<List<Blog>> displayHiveBlogData() async {
//     var box = await Hive.openBox('blogBox');
//     List<Blog> blogs = [];

//     if (box.isNotEmpty) {
//       print('Menampilkan data Blog dari Hive box:');
//       for (int i = 0; i < box.length; i++) {
//         var blogData = box.getAt(i);
//         Blog blog = Blog.fromJson(Map<String, dynamic>.from(blogData));
//         blogs.add(blog); // Menambahkan blog ke daftar

//         // Jika blog.photo adalah string Base64, kita perlu memastikan itu ditampilkan dengan benar
//         print('Blog ${i + 1}:');
//         print('ID: ${blog.id}');
//         print('Title: ${blog.title}');

//         // Cek apakah photo adalah Base64
//         if (blog.photo.isNotEmpty) {
//           print('Photo (Base64): ${blog.photo}');
//         } else {
//           print('Photo: Tidak ada gambar');
//         }

//         print('Body: ${blog.body ?? "Tidak ada konten"}');
//         print('---');
//       }
//     } else {
//       print('Hive box kosong.');
//     }

//     return blogs; // Kembalikan daftar blog
//   }

// // Fungsi untuk mendekode Base64 dan menampilkan gambar
//   Widget displayBase64Image(String base64String) {
//     if (base64String.isNotEmpty) {
//       Uint8List bytes = base64Decode(base64String);
//       return Image.memory(
//         bytes,
//         fit: BoxFit.cover,
//       );
//     } else {
//       return Text('Gambar tidak tersedia');
//     }
//   }

//   /////////////////////////////////////////

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double blogWidth = screenWidth * 0.7;

//     return FutureBuilder<List<Blog>>(
//       future: compareAndSyncBlogData(), // Menggunakan compareAndSyncBlogData
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           if (_cachedBlogs == null) {
//             return buildShimmer(); // Tampilkan loading jika tidak ada data cached
//           } else {
//             // Jika data cached tersedia, tampilkan segera
//             return _buildBlogCarousel(_cachedBlogs!, screenWidth, blogWidth);
//           }
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(
//             child: Text(
//               'No blog posts available.',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//           );
//         }

//         // Jika data dimuat (dari Hive), perbarui cached data
//         _cachedBlogs = snapshot.data; // Cache data yang diambil
//         return _buildBlogCarousel(_cachedBlogs!, screenWidth, blogWidth);
//       },
//     );
//   }

//   // Build the carousel for displaying blog posts
// Widget _buildBlogCarousel(
//     List<Blog> blogs, double screenWidth, double blogWidth) {
//   return SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     child: Column(
//       children: [
//         Center(
//           child: CarouselSlider(
//             options: CarouselOptions(
//               height: 310.0,
//               aspectRatio: 19 / 19,
//               viewportFraction: 0.8,
//               initialPage: 0,
//               enableInfiniteScroll: true,
//               reverse: false,
//               autoPlay: true,
//               autoPlayInterval: Duration(seconds: 5),
//               autoPlayAnimationDuration: Duration(milliseconds: 800),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               enlargeCenterPage: true,
//               scrollDirection: Axis.horizontal,
//             ),
//             items: blogs.map((blog) {
//               return _buildBlogCard(blog, context, screenWidth, blogWidth);
//             }).toList(),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// // Fungsi untuk membangun kartu blog
//   Widget _buildBlogCard(
//       Blog blog, BuildContext context, double screenWidth, double blogWidth) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Artikelwidget(
//               id: blog.id,
//               title: blog.title,
//               photo: blog.photo,
//               body: blog.body,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 5.0),
//         decoration: BoxDecoration(
//           color: Colors.grey[100],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: Column(
//             children: [
//               Container(
//                 width: screenWidth,
//                 child: Image.network(
//                   blog.photo,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Center(
//                         child: Container(
//                           width: blogWidth,
//                           child: Text(
//                             blog.title,
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             overflow: TextOverflow.visible,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   double screenWidth = MediaQuery.of(context).size.width;
//   //   double blogWidth = MediaQuery.of(context).size.width * 0.7;

//   //   return FutureBuilder<List<Blog>>(
//   //     future: futureBlog, // Assume futureBlog is the future that fetches blogs
//   //     builder: (context, snapshot) {
//   //       // Check internet connection
//   //       if (!isConnected) {
//   //         // If no internet connection, show the asset image with a refresh button
//   //         return SingleChildScrollView(
//   //           scrollDirection: Axis.vertical,
//   //           child: Column(
//   //             children: [
//   //               Image.asset(
//   //                 'images/assets/No_internet.png',
//   //                 width: 150,
//   //                 height: 150,
//   //                 fit: BoxFit.cover,
//   //               ),
//   //               SizedBox(height: 10),
//   //               Text(
//   //                 'Please check your internet connection and try again.',
//   //                 textAlign: TextAlign.center,
//   //               ),
//   //               SizedBox(height: 20),
//   //               ElevatedButton.icon(
//   //                 onPressed: () async {
//   //                   // Re-check internet connection and refresh the data
//   //                   bool connection =
//   //                       await InternetConnectionChecker().hasConnection;
//   //                   if (connection) {
//   //                     setState(() {
//   //                       isConnected = true;
//   //                       futureBlog = fetchBlog(); // Reload blog data
//   //                     });
//   //                   } else {
//   //                     setState(() {
//   //                       isConnected = false;
//   //                     });
//   //                     ScaffoldMessenger.of(context).showSnackBar(
//   //                       SnackBar(
//   //                           content: Text('No internet connection available')),
//   //                     );
//   //                   }
//   //                 },
//   //                 icon: Icon(Icons.refresh),
//   //                 label: Text('Refresh'),
//   //                 style: ElevatedButton.styleFrom(
//   //                   foregroundColor: Colors.white,
//   //                   backgroundColor: Colors.blue, // Text color
//   //                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         );
//   //       }

//   //       // If internet is connected, proceed with the regular FutureBuilder content
//   //       if (snapshot.connectionState == ConnectionState.waiting) {
//   //         return Center(child: CircularProgressIndicator());
//   //       } else if (snapshot.hasError) {
//   //         return Center(child: Text('Error: ${snapshot.error}'));
//   //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//   //         return Center(
//   //           child: Text(
//   //             'No blog posts available.',
//   //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//   //             textAlign: TextAlign.center,
//   //           ),
//   //         );
//   //       }

//   //       // If data is loaded, show the blog posts in a carousel
//   //       return SingleChildScrollView(
//   //         scrollDirection: Axis.vertical,
//   //         child: Column(
//   //           children: [
//   //             Center(
//   //               child: CarouselSlider(
//   //                 options: CarouselOptions(
//   //                   height: 310.0,
//   //                   aspectRatio: 19 / 19,
//   //                   viewportFraction: 0.8,
//   //                   initialPage: 0,
//   //                   enableInfiniteScroll: true,
//   //                   reverse: false,
//   //                   autoPlay: true,
//   //                   autoPlayInterval: Duration(seconds: 5),
//   //                   autoPlayAnimationDuration: Duration(milliseconds: 800),
//   //                   autoPlayCurve: Curves.fastOutSlowIn,
//   //                   enlargeCenterPage: true,
//   //                   scrollDirection: Axis.horizontal,
//   //                 ),
//   //                 items: snapshot.data!.map((blog) {
//   //                   return Builder(
//   //                     builder: (BuildContext context) {
//   //                       return InkWell(
//   //                         onTap: () {
//   //                           Navigator.push(
//   //                             context,
//   //                             MaterialPageRoute(
//   //                               builder: (context) => Artikelwidget(
//   //                                 id: blog.id,
//   //                                 title: blog.title,
//   //                                 photo: blog.photo,
//   //                                 body: blog.body,
//   //                               ),
//   //                             ),
//   //                           );
//   //                         },
//   //                         child: Container(
//   //                           margin: EdgeInsets.symmetric(horizontal: 5.0),
//   //                           decoration: BoxDecoration(
//   //                             color: Colors.grey[100],
//   //                             borderRadius: BorderRadius.circular(20),
//   //                           ),
//   //                           child: ClipRRect(
//   //                             borderRadius: BorderRadius.circular(20),
//   //                             child: Column(
//   //                               children: [
//   //                                 Container(
//   //                                   width: screenWidth,
//   //                                   child: Image.network(
//   //                                     blog.photo,
//   //                                     fit: BoxFit.cover,
//   //                                   ),
//   //                                 ),
//   //                                 SizedBox(height: 10),
//   //                                 Row(
//   //                                   mainAxisAlignment: MainAxisAlignment.center,
//   //                                   children: [
//   //                                     Column(
//   //                                       children: [
//   //                                         Center(
//   //                                           child: Container(
//   //                                             width: blogWidth,
//   //                                             child: Text(
//   //                                               blog.title,
//   //                                               style: TextStyle(
//   //                                                 fontSize: 15,
//   //                                                 fontWeight: FontWeight.bold,
//   //                                               ),
//   //                                               overflow: TextOverflow.visible,
//   //                                             ),
//   //                                           ),
//   //                                         )
//   //                                       ],
//   //                                     ),
//   //                                   ],
//   //                                 )
//   //                               ],
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       );
//   //                     },
//   //                   );
//   //                 }).toList(),
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }

//   Widget _buildShimmer() {
//     return SizedBox(
//       height: 310.0,
//       child: Shimmer.fromColors(
//         baseColor: Colors.grey[300]!,
//         highlightColor: Colors.grey[100]!,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 3,
//           itemBuilder: (context, index) => Container(
//             width: MediaQuery.of(context).size.width * 0.8,
//             margin: EdgeInsets.symmetric(horizontal: 10.0),
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildShimmer() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Shimmer.fromColors(
//             baseColor: Colors.grey[300]!,
//             highlightColor: Colors.grey[100]!,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 200,
//               color: Colors.white,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 height: 24,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 height: 16,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 height: 16,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/widgets/ArtikelWidget.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ImageData {
  final int id;
  final String photo;
  final String title;
  final String body;

  ImageData({
    required this.id,
    required this.photo,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photo': photo,
      'title': title,
      'body': body,
    };
  }

  factory ImageData.fromMap(Map<String, dynamic> map) {
    return ImageData(
      id: map['id'] ?? 0,
      photo: map['photo'] ?? '',
      title: map['title'] ?? 'Untitled',
      body: map['body'] ?? '',
    );
  }
}

class Blogwidget extends StatefulWidget {
  @override
  _BlogwidgetState createState() => _BlogwidgetState();
}

class _BlogwidgetState extends State<Blogwidget> {
  List<Map<String, dynamic>> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadData(); // Memulai proses mengambil data dari Hive dan API
  }

  Future<List<ImageData>> _fetchImageDataFromApi() async {
    try {
      final response =
          await http.get(Uri.parse('https://app.aag4u.co.id/api/getPostLimit'));
      if (response.statusCode == 200) {
        List jsonData = json.decode(response.body);
        return jsonData.map((item) => ImageData.fromMap(item)).toList();
      } else {
        throw Exception('Failed to load image data from API');
      }
    } catch (error) {
      throw Exception('Error fetching data from API: $error');
    }
  }

  Future<void> _loadData() async {
    var hiveBox = await Hive.openBox('dataBox');

    // Ambil data dari Hive terlebih dahulu
    List<Map<String, dynamic>> loadedData = [];
    for (int i = 0; i < hiveBox.length; i++) {
      Map<String, dynamic> item = Map<String, dynamic>.from(hiveBox.getAt(i));
      loadedData.add(item);
    }

    // Tampilkan data dari Hive terlebih dahulu
    setState(() {
      _imageUrls = loadedData;
    });

    // Coba ambil data dari API dan perbarui Hive jika ada perbedaan
    try {
      List<ImageData> apiImageData = await _fetchImageDataFromApi();

      if (!listEquals(apiImageData, loadedData)) {
        await hiveBox
            .clear(); // Menghapus semua data di Hive sebelum memperbarui
        for (var imageData in apiImageData) {
          Map<String, dynamic> dataToStore = {
            'id': imageData.id,
            'photo': imageData.photo, // Simpan URL gambar sebagai string
            'title': imageData.title,
            'body': imageData.body,
          };
          await hiveBox.add(dataToStore);
        }

        // Ambil semua data dari Hive box dan perbarui UI
        List<Map<String, dynamic>> updatedData = [];
        for (int i = 0; i < hiveBox.length; i++) {
          Map<String, dynamic> item =
              Map<String, dynamic>.from(hiveBox.getAt(i));
          updatedData.add(item);
        }

        setState(() {
          _imageUrls = updatedData;
        });
      }
    } catch (error) {
      print('Error fetching data from API: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.width;
    double screenCard = MediaQuery.of(context).size.height;
    double fontSize = MediaQuery.of(context).size.width;

    return _imageUrls.isEmpty
        ? Center(child: CircularProgressIndicator())
        : LayoutBuilder(builder: (context, constraints) {
            double viewportFraction = constraints.maxWidth > 600 ? 0.5 : 0.8;
            double imageHeight = constraints.maxWidth > 800 ? 300.0 : 400.0;

            return SingleChildScrollView(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              width: screenWidth * 1,
                              // height: MediaQuery.of(context).size.height,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  // height: screenCard * 0.6,
                                  aspectRatio: 19 / 19,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 5),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                ),
                                items: _imageUrls.map((imageData) {
                                  String? imageUrl = imageData['photo'];

                                  if (imageUrl == null || imageUrl.isEmpty) {
                                    return Center(
                                        child: Text('Image not available'));
                                  }

                                  return Builder(
                                    builder: (BuildContext context) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Artikelwidget(
                                                id: imageData['id'],
                                                title: imageData['title'],
                                                photo: imageData[
                                                    'photo'], // Gunakan URL gambar
                                                body: imageData['body'],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Container(
                                            width: screenWidth * 0.9,
                                            height: screenheight * 0.2,
                                            // margin:
                                            //     EdgeInsets.symmetric(horizontal: 5.0),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(
                                                      0.2), // Warna bayangan dengan transparansi
                                                  blurRadius:
                                                      8, // Efek blur bayangan
                                                  spreadRadius:
                                                      2, // Menyebarkan bayangan
                                                  offset: Offset(0,
                                                      4), // Posisi bayangan (X, Y)
                                                ),
                                              ],
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: screenWidth * 0.9,
                                                    height: screenheight *
                                                        0.5, // Tetapkan tinggi gambar
                                                    child: CachedNetworkImage(
                                                      imageUrl: imageUrl,
                                                      fit: BoxFit
                                                          .fill, // Menyesuaikan gambar agar mengisi kontainer
                                                      placeholder:
                                                          (context, url) =>
                                                              Container(
                                                        width: double.infinity,
                                                        height: screenheight *
                                                            0.5, // Tetap sesuai dengan tinggi yang ditetapkan
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 255, 255, 255),
                                                        child: Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Container(
                                                        width: double.infinity,
                                                        height: screenheight *
                                                            0.04, // Pastikan error widget juga memiliki tinggi tetap
                                                        color: Colors.grey,
                                                        child: Icon(
                                                            Icons.broken_image,
                                                            size: 50,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Center(
                                                    child: Container(
                                                      // color: Colors.amber,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.12,
                                                      child: Text(
                                                        imageData['title'],
                                                        style: TextStyle(
                                                          fontSize:
                                                              fontSize * 0.04,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        // softWrap:
                                                        //     true, // Biarkan teks turun ke bawah

                                                        overflow: TextOverflow
                                                            .visible,
                                                        // overflow: TextOverflow.ellipsis,

                                                        maxLines: 4,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )));
          });
  }
}





// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/widgets/ArtikelWidget.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;

// class ImageData {
//   final int id;
//   final String photo;
//   final String title;
//   final String body;

//   ImageData({
//     required this.id,
//     required this.photo,
//     required this.title,
//     required this.body,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'photo': photo,
//       'title': title,
//       'body': body,
//     };
//   }

//   factory ImageData.fromMap(Map<String, dynamic> map) {
//     return ImageData(
//       id: map['id'] ?? 0,
//       photo: map['photo'] ?? '',
//       title: map['title'] ?? 'Untitled',
//       body: map['body'] ?? '',
//     );
//   }
// }

// class Blogwidget extends StatefulWidget {
//   @override
//   _BlogwidgetState createState() => _BlogwidgetState();
// }

// class _BlogwidgetState extends State<Blogwidget> {
//   List<Map<String, dynamic>> _imageUrls = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadData(); // Memulai proses mengambil data dari Hive dan API
//   }

//   Future<List<ImageData>> _fetchImageDataFromApi() async {
//     try {
//       final response =
//           await http.get(Uri.parse('https://app.aag4u.co.id/api/getPostLimit'));
//       if (response.statusCode == 200) {
//         List jsonData = json.decode(response.body);
//         return jsonData.map((item) => ImageData.fromMap(item)).toList();
//       } else {
//         throw Exception('Failed to load image data from API');
//       }
//     } catch (error) {
//       throw Exception('Error fetching data from API: $error');
//     }
//   }

//   Future<void> _loadData() async {
//     var hiveBox = await Hive.openBox('dataBox');

//     // Ambil data dari Hive terlebih dahulu
//     List<Map<String, dynamic>> loadedData = [];
//     for (int i = 0; i < hiveBox.length; i++) {
//       Map<String, dynamic> item = Map<String, dynamic>.from(hiveBox.getAt(i));
//       loadedData.add(item);
//     }

//     // Tampilkan data dari Hive terlebih dahulu
//     setState(() {
//       _imageUrls = loadedData;
//     });

//     // Coba ambil data dari API dan perbarui Hive jika ada perbedaan
//     try {
//       List<ImageData> apiImageData = await _fetchImageDataFromApi();

//       if (!listEquals(apiImageData, loadedData)) {
//         await hiveBox
//             .clear(); // Menghapus semua data di Hive sebelum memperbarui
//         for (var imageData in apiImageData) {
//           Map<String, dynamic> dataToStore = {
//             'id': imageData.id,
//             'photo': imageData.photo, // Simpan URL gambar sebagai string
//             'title': imageData.title,
//             'body': imageData.body,
//           };
//           await hiveBox.add(dataToStore);
//         }

//         // Ambil semua data dari Hive box dan perbarui UI
//         List<Map<String, dynamic>> updatedData = [];
//         for (int i = 0; i < hiveBox.length; i++) {
//           Map<String, dynamic> item =
//               Map<String, dynamic>.from(hiveBox.getAt(i));
//           updatedData.add(item);
//         }

//         setState(() {
//           _imageUrls = updatedData;
//         });
//       }
//     } catch (error) {
//       print('Error fetching data from API: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;

//     return _imageUrls.isEmpty
//         ? Center(child: CircularProgressIndicator())
//         : SingleChildScrollView(
//             child: Column(
//               children: [
//                 Center(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     child: CarouselSlider(
//                       options: CarouselOptions(
//                         height: 340.0,
//                         aspectRatio: 19 / 19,
//                         viewportFraction: 0.8,
//                         initialPage: 0,
//                         enableInfiniteScroll: true,
//                         reverse: false,
//                         autoPlay: true,
//                         autoPlayInterval: Duration(seconds: 5),
//                         autoPlayAnimationDuration: Duration(milliseconds: 800),
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         enlargeCenterPage: true,
//                         scrollDirection: Axis.horizontal,
//                       ),
//                       items: _imageUrls.map((imageData) {
//                         String? imageUrl = imageData['photo'];

//                         if (imageUrl == null || imageUrl.isEmpty) {
//                           return Center(child: Text('Image not available'));
//                         }

//                         return Builder(
//                           builder: (BuildContext context) {
//                             return InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Artikelwidget(
//                                       id: imageData['id'],
//                                       title: imageData['title'],
//                                       photo: imageData[
//                                           'photo'], // Gunakan URL gambar
//                                       body: imageData['body'],
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.symmetric(horizontal: 5.0),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[100],
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         child: CachedNetworkImage(
//                                           // fadeInDuration: Duration(seconds: 1),
//                                           imageUrl: imageUrl,
//                                           fit: BoxFit.cover,
//                                           placeholder: (context, url) =>
//                                               Container(
//                                             width: screenWidth,
//                                             height: 100,
//                                             color: Colors.grey,
//                                             child: Center(
//                                               child:
//                                                   CircularProgressIndicator(),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 10),
//                                       Center(
//                                         child: Container(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.7,
//                                           child: Text(
//                                             imageData['title'],
//                                             style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             overflow: TextOverflow.visible,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }
