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
// import 'package:flutter_aag4u/widgets/ArtikelWidget.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shimmer/shimmer.dart';

// class Blog {
//   final int id;
//   final String title;
//   late final String photo;
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
//     futureBlog = fetchBlog();
//     // futureBlog = _fetchBlogsFromHive();
//     // futureBlog = compareAndSyncBlogData();
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

//     // If the blogs are already cached in memory, return them
//     if (_cachedBlogs != null) {
//       return _cachedBlogs!;
//     }

//     bool isConnected = await InternetConnectionChecker().hasConnection;

//     if (isConnected) {
//       print('Fetching data from API');
//       final response =
//           await http.get(Uri.parse('https://app.aag4u.co.id/api/getPostLimit'));

//       if (response.statusCode == 200) {
//         List jsonResponse = json.decode(response.body);
//         List<Blog> blogs =
//             jsonResponse.map((data) => Blog.fromJson(data)).toList();

//         // Compare the length of fetched blogs with Hive data
//         int hiveBlogCount = box.length;

//         // If the count differs, clear Hive box and store new data
//         if (blogs.length != hiveBlogCount) {
//           print('Blog count differs. Clearing Hive and saving new data.');
//           await box.clear(); // Clear the Hive box
//         }

//         // Update Hive with fetched data
//         for (var blog in blogs) {
//           String imageName =
//               blog.photo.split('/').last; // Get image name from URL
//           String? storedBase64Image =
//               box.get(imageName); // Check if the image is already stored

//           // Fetch the image as base64 and store it if needed
//           String? newBase64Image = await fetchImageAsBase64(blog.photo);
//           if (newBase64Image != null && newBase64Image != storedBase64Image) {
//             await box.put(
//                 imageName, newBase64Image); // Update Hive with the new image
//           }

//           // Update Hive with Blog data
//           await box.put(
//               blog.id.toString(), blog.toJson()); // Save Blog object as JSON
//         }

//         // Cache the data and return it
//         _cachedBlogs = blogs.reversed.toList(); // Cache the blogs in memory
//         return _cachedBlogs!;
//       } else {
//         print('Error response: ${response.statusCode}');
//       }
//     }

//     // No internet: retrieve data from Hive
//     print('No internet, fetching data from Hive');
//     List<Blog> blogs = [];

//     // Retrieve all blog data from Hive
//     for (var key in box.keys) {
//       // Explicitly cast the data to Map<String, dynamic>
//       Map<String, dynamic> blogData = Map<String, dynamic>.from(box.get(key));
//       blogs
//           .add(Blog.fromJson(blogData)); // Recreate Blog objects from Hive data
//     }

//     // Cache the data and return it
//     _cachedBlogs = blogs.reversed.toList(); // Cache the blogs in memory
//     return _cachedBlogs!;
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

// // Future<List<Blog>> (String imageUrl) async {
// // Fungsi untuk mengambil gambar sebagai base64
// //   Future<String?> convertImageUrlToBase64(String imageUrl) async {
// //     final response = await http.get(Uri.parse(imageUrl));
// //     if (response.statusCode == 200) {
// //       // Mengonversi byte dari response body ke base64
// //       return base64Encode(response.bodyBytes);
// //     }
// //     return null;
// //   }

// //   Future<List<Blog>> compareAndSyncBlogData() async {
// //     var box = await Hive.openBox('blogBox');
// //     int hiveBlogCount = box.length;
// //     bool isConnected = await InternetConnectionChecker().hasConnection;
// //     if (isConnected) {
// //       String apiUrl =
// //           'https://app.aag4u.co.id/api/getPostLimit'; // Ganti dengan URL API Anda
// //       var response = await http.get(Uri.parse(apiUrl));
// //       if (response.statusCode == 200) {
// //         List<dynamic> apiResponse = json.decode(response.body);
// //         List<Blog> apiBlogList =
// //             apiResponse.map((json) => Blog.fromJson(json)).toList();
// //         int apiBlogCount = apiBlogList.length;
// //         if (hiveBlogCount != apiBlogCount) {
// //           print(
// //               'Jumlah data Blog berbeda. Clearing Hive box and syncing with API data...');
// //           await box.clear();
// //           // Masukkan data dari API ke dalam Hive box
// //           for (var blog in apiBlogList) {
// //             // Konversi gambar ke Base64
// //             // String imageName = blog.photo.split('/').last;
// //             String? base64Photo = await convertImageUrlToBase64(blog.photo);
// //             // Ubah field 'photo' di Blog menjadi string Base64
// //             Blog blogWithBase64Photo = Blog(
// //               id: blog.id,
// //               title: blog.title,
// //               photo:
// //                   "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", // Simpan Base64 string dari gambar
// //               body: blog.body,
// //             );
// //             await box.put(blogWithBase64Photo.id, blogWithBase64Photo);
// //             print('hahahahahahahahahaahhaahh. $blogWithBase64Photo');
// //           }
// //           return await displayHiveBlogData();
// //           // print(
// //           //     'Sinkronisasi berhasil! Data dari API telah dimasukkan ke dalam Hive box.');
// //         }
// //         // else {
// //         //   print('Jumlah data Blog di Hive box dan API sama: $hiveBlogCount');
// //         // }
// //         // Setelah sinkronisasi, ambil semua blog dari Hive box
// //         return await displayHiveBlogData(); // Kembalikan daftar blog
// //       } else {
// //         print(
// //             'Gagal mendapatkan data dari API. Status code: ${response.statusCode}');
// //         return []; // Kembalikan daftar kosong jika gagal
// //       }
// //     } else {
// //       print('Tidak ada koneksi internet.');
// //       return await displayHiveBlogData(); // Jika tidak ada internet, kembalikan data dari Hive
// //     }
// //   }

// //   Future<List<Blog>> displayHiveBlogData() async {
// //     var box = await Hive.openBox('blogBox');
// //     List<Blog> blogs = [];
// //     if (box.isNotEmpty) {
// //       print('Menampilkan data Blog dari Hive box:');
// //       for (int i = 0; i < box.length; i++) {
// //         var blogData = box.getAt(i);
// //         Blog blog = Blog.fromJson(Map<String, dynamic>.from(blogData));
// //         blogs.add(blog); // Menambahkan blog ke daftar
// //         // Jika blog.photo adalah string Base64, kita perlu memastikan itu ditampilkan dengan benar
// //         print('Blog ${i + 1}:');
// //         print('ID: ${blog.id}');
// //         print('Title: ${blog.title}');
// //         // Cek apakah photo adalah Base64
// //         if (blog.photo.isNotEmpty) {
// //           print('Photo (Base64): ${blog.photo}');
// //         } else {
// //           print('Photo: Tidak ada gambar');
// //         }
// //         print('Body: ${blog.body ?? "Tidak ada konten"}');
// //         print('---');
// //       }
// //     } else {
// //       print('Hive box kosong.');
// //     }
// //     return blogs; // Kembalikan daftar blog
// //   }

// // // Fungsi untuk mendekode Base64 dan menampilkan gambar
// //   Widget displayBase64Image(String base64String) {
// //     if (base64String.isNotEmpty) {
// //       Uint8List bytes = base64Decode(base64String);
// //       return Image.memory(
// //         bytes,
// //         fit: BoxFit.cover,
// //       );
// //     } else {
// //       return Text('Gambar tidak tersedia');
// //     }
// //   }

//   /////////////////////////////////////////

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0),
//       child: FutureBuilder<List<Blog>>(
//         future: fetchBlog(), // Call your fetchBlog function here
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//             List<Blog> posts = snapshot.data!;
//             return CarouselSlider(
//               options: CarouselOptions(
//                 height: 310.0,
//                 aspectRatio: 19 / 19,
//                 viewportFraction: 0.8,
//                 initialPage: 0,
//                 enableInfiniteScroll: true,
//                 autoPlay: true,
//                 autoPlayInterval: Duration(seconds: 5),
//                 autoPlayAnimationDuration: Duration(milliseconds: 800),
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enlargeCenterPage: true,
//                 scrollDirection: Axis.horizontal,
//               ),
//               items: posts.map((blog) {
//                 // Fetch the base64 image from Hive
//                 var box = Hive.box('blogBox');
//                 String imageName = blog.photo; // Get the image name
//                 String? base64Image =
//                     box.get(imageName); // Check if image is stored

//                 return Builder(
//                   builder: (BuildContext context) {
//                     return InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Artikelwidget(
//                               id: blog.id,
//                               title: blog.title,
//                               photo: blog.photo,
//                               body: blog.body,
//                             ),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 5.0),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: screenWidth,
//                                 child: base64Image !=
//                                         null // Check if image is stored
//                                     ? Image.memory(
//                                         base64Decode(base64Image),
//                                         fit: BoxFit.cover,
//                                       )
//                                     : Image.network(
//                                         blog.photo,
//                                         fit: BoxFit.cover,
//                                         loadingBuilder: (BuildContext context,
//                                             Widget child,
//                                             ImageChunkEvent? loadingProgress) {
//                                           if (loadingProgress == null)
//                                             return child;
//                                           return Center(
//                                             child: CircularProgressIndicator(
//                                               value: loadingProgress
//                                                           .expectedTotalBytes !=
//                                                       null
//                                                   ? loadingProgress
//                                                           .cumulativeBytesLoaded /
//                                                       (loadingProgress
//                                                               .expectedTotalBytes ??
//                                                           1)
//                                                   : null,
//                                             ),
//                                           );
//                                         },
//                                         errorBuilder:
//                                             (context, error, stackTrace) {
//                                           return Center(
//                                               child:
//                                                   Text("Image failed to load"));
//                                         },
//                                       ),
//                               ),
//                               SizedBox(height: 10),
//                               Center(
//                                 child: Container(
//                                   width:
//                                       screenWidth * 0.7, // Set your blog width
//                                   child: Text(
//                                     blog.title,
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     overflow: TextOverflow.visible,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             );
//           } else {
//             return Center(child: Text("No data available"));
//           }
//         },
//       ),
//     );
//   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;
// //     double blogWidth = screenWidth * 0.7;

// //     return FutureBuilder<List<Blog>>(
// //       future: fetchBlog(), // Menggunakan compareAndSyncBlogData
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           if (_cachedBlogs == null) {
// //             return buildShimmer(); // Tampilkan loading jika tidak ada data cached
// //           } else {
// //             // Jika data cached tersedia, tampilkan segera
// //             return _buildBlogCarousel(_cachedBlogs!, screenWidth, blogWidth);
// //           }
// //         } else if (snapshot.hasError) {
// //           return Center(child: Text('Error: ${snapshot.error}'));
// //         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //           return Center(
// //             child: Text(
// //               'No blog posts available.',
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //               textAlign: TextAlign.center,
// //             ),
// //           );
// //         }

// //         // Jika data dimuat (dari Hive), perbarui cached data
// //         _cachedBlogs = snapshot.data; // Cache data yang diambil
// //         return _buildBlogCarousel(_cachedBlogs!, screenWidth, blogWidth);
// //       },
// //     );
// //   }

// //   // Build the carousel for displaying blog posts
// //   Widget _buildBlogCarousel(
// //       List<Blog> blogs, double screenWidth, double blogWidth) {
// //     return SingleChildScrollView(
// //       scrollDirection: Axis.vertical,
// //       child: Column(
// //         children: [
// //           Center(
// //             child: CarouselSlider(
// //               options: CarouselOptions(
// //                 height: 310.0,
// //                 aspectRatio: 19 / 19,
// //                 viewportFraction: 0.8,
// //                 initialPage: 0,
// //                 enableInfiniteScroll: true,
// //                 reverse: false,
// //                 autoPlay: true,
// //                 autoPlayInterval: Duration(seconds: 5),
// //                 autoPlayAnimationDuration: Duration(milliseconds: 800),
// //                 autoPlayCurve: Curves.fastOutSlowIn,
// //                 enlargeCenterPage: true,
// //                 scrollDirection: Axis.horizontal,
// //               ),
// //               items: blogs.map((blog) {
// //                 return _buildBlogCard(blog, context, screenWidth, blogWidth);
// //               }).toList(),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// // // Fungsi untuk membangun kartu blog
// //   Widget _buildBlogCard(
// //       Blog blog, BuildContext context, double screenWidth, double blogWidth) {
// //     return InkWell(
// //       onTap: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => Artikelwidget(
// //               id: blog.id,
// //               title: blog.title,
// //               photo: blog.photo,
// //               body: blog.body,
// //             ),
// //           ),
// //         );
// //       },
// //       child: Container(
// //         margin: EdgeInsets.symmetric(horizontal: 5.0),
// //         decoration: BoxDecoration(
// //           color: Colors.grey[100],
// //           borderRadius: BorderRadius.circular(20),
// //         ),
// //         child: ClipRRect(
// //           borderRadius: BorderRadius.circular(20),
// //           child: Column(
// //             children: [
// //               Container(
// //                 width: screenWidth,
// //                 child: Image.network(
// //                   blog.photo,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //               SizedBox(height: 10),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Column(
// //                     children: [
// //                       Center(
// //                         child: Container(
// //                           width: blogWidth,
// //                           child: Text(
// //                             blog.title,
// //                             style: TextStyle(
// //                               fontSize: 15,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                             overflow: TextOverflow.visible,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

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
//   // return SingleChildScrollView(
//   //   scrollDirection: Axis.vertical,
//   //   child: Column(
//   //     children: [
//   //       Center(
//   //         child: CarouselSlider(
//   //           options: CarouselOptions(
//   //             height: 310.0,
//   //             aspectRatio: 19 / 19,
//   //             viewportFraction: 0.8,
//   //             initialPage: 0,
//   //             enableInfiniteScroll: true,
//   //             reverse: false,
//   //             autoPlay: true,
//   //             autoPlayInterval: Duration(seconds: 5),
//   //             autoPlayAnimationDuration: Duration(milliseconds: 800),
//   //             autoPlayCurve: Curves.fastOutSlowIn,
//   //             enlargeCenterPage: true,
//   //             scrollDirection: Axis.horizontal,
//   //           ),
//   //           items: snapshot.data!.map((blog) {
//   //             return Builder(
//   //               builder: (BuildContext context) {
//   //                 return InkWell(
//   //                   onTap: () {
//   //                     Navigator.push(
//   //                       context,
//   //                       MaterialPageRoute(
//   //                         builder: (context) => Artikelwidget(
//   //                           id: blog.id,
//   //                           title: blog.title,
//   //                           photo: blog.photo,
//   //                           body: blog.body,
//   //                         ),
//   //                       ),
//   //                     );
//   //                   },
//   //                   child: Container(
//   //                     margin: EdgeInsets.symmetric(horizontal: 5.0),
//   //                     decoration: BoxDecoration(
//   //                       color: Colors.grey[100],
//   //                       borderRadius: BorderRadius.circular(20),
//   //                     ),
//   //                     child: ClipRRect(
//   //                       borderRadius: BorderRadius.circular(20),
//   //                       child: Column(
//   //                         children: [
//   //                           Container(
//   //                             width: screenWidth,
//   //                             child: Image.network(
//   //                               blog.photo,
//   //                               fit: BoxFit.cover,
//   //                             ),
//   //                           ),
//   //                           SizedBox(height: 10),
//   //                           Row(
//   //                             mainAxisAlignment: MainAxisAlignment.center,
//   //                             children: [
//   //                               Column(
//   //                                 children: [
//   //                                   Center(
//   //                                     child: Container(
//   //                                       width: blogWidth,
//   //                                       child: Text(
//   //                                         blog.title,
//   //                                         style: TextStyle(
//   //                                           fontSize: 15,
//   //                                           fontWeight: FontWeight.bold,
//   //                                         ),
//   //                                         overflow: TextOverflow.visible,
//   //                                       ),
//   //                                     ),
//   //                                   )
//   //                                 ],
//   //                               ),
//   //                             ],
//   //                           )
//   //                         ],
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 );
//   //               },
//   //             );
//   //           }).toList(),
//   //         ),
//   //       ),
//   //     ],
//   //   ),
//   // );
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
