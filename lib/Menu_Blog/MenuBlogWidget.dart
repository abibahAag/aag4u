// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_Promo/MenuPromoPage.dart';
// import 'package:flutter_aag4u/widgets/ArtikelWidget.dart';
// import 'package:http/http.dart' as http;
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// class Blog {
//   final int id;
//   final String title;
//   final String photo;
//   final String body; // Add this field for the body

//   Blog({
//     required this.id,
//     required this.title,
//     required this.photo,
//     required this.body,
//   });

//   factory Blog.fromJson(Map<String, dynamic> json) {
//     String imageName = json['photo'];
//     String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
//     return Blog(
//       id: json['id'],
//       title: json['title'],
//       photo: imageUrl,
//       body: json['body'] ?? '', // Adjust according to your API response
//     );
//   }
// }

// class Categori {
//   final int id;
//   final String category_name;

//   Categori({required this.id, required this.category_name});

//   factory Categori.fromJson(Map<String, dynamic> json) {
//     return Categori(
//       id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
//       category_name: json['category_name'],
//     );
//   }
// }

// class MenuBlogWidget extends StatefulWidget {
//   const MenuBlogWidget({super.key});

//   @override
//   State<MenuBlogWidget> createState() => _MenuBlogWidgetState();
// }

// class _MenuBlogWidgetState extends State<MenuBlogWidget> {
//   Future<List<Blog>>? futureBlog;
//   Future<List<Categori>>? futureCategori;
//   Categori? selectedCategori;
//   bool isConnected = true; // Assume initially connected

//   @override
//   void initState() {
//     super.initState();
//     futureBlog = fetchBlog();
//     futureCategori = fetchCategori();
//   }

//   Future<List<Blog>> fetchBlog() async {
//     isConnected = await InternetConnectionChecker().hasConnection;

//     if (isConnected) {
//       try {
//         final response =
//             await http.get(Uri.parse('http://www.app.aag4u.co.id/api/getPost'));

//         if (response.statusCode == 200) {
//           List jsonResponse = json.decode(response.body);
//           List<Blog> blogs =
//               jsonResponse.map((data) => Blog.fromJson(data)).toList();
//           return blogs;
//         } else {
//           throw Exception('Failed to load blog posts');
//         }
//       } catch (e) {
//         print('Error fetching data: $e');
//         return _getPlaceholderBlogs();
//       }
//     } else {
//       return _getPlaceholderBlogs();
//     }
//   }

//   List<Blog> _getPlaceholderBlogs() {
//     return [
//       Blog(
//         id: 0,
//         title: '',
//         photo: 'images/assets/No_internet.png',
//         body: 'Please check your internet connection and try again.',
//       ),
//     ];
//   }

//   Future<List<Categori>> fetchCategori() async {
//     isConnected = await InternetConnectionChecker().hasConnection;

//     if (isConnected) {
//       try {
//         final response = await http
//             .get(Uri.parse('http://www.app.aag4u.co.id/api/getPostCate'));

//         if (response.statusCode == 200) {
//           List jsonResponse = json.decode(response.body);
//           List<Categori> categori =
//               jsonResponse.map((data) => Categori.fromJson(data)).toList();
//           return categori;
//         } else {
//           throw Exception('Failed to load blog posts');
//         }
//       } catch (e) {
//         print('Error fetching data: $e');
//         return _getPlaceholderCategori();
//       }
//     } else {
//       return _getPlaceholderCategori();
//     }
//   }

//   List<Categori> _getPlaceholderCategori() {
//     return [
//       Categori(
//         id: 0,
//         category_name: '',
//       ),
//     ];
//   }

//   Future<void> _refreshData() async {
//     await fetchBlog();
//     await fetchCategori();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;
//     double inWidth = MediaQuery.of(context).size.width * 0.8;

//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12.0, vertical: 15.0),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: screenWidth,
//                           height: 50,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(24),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Blogs",
//                                     style: TextStyle(
//                                       fontSize: 35,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF233d63),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           RefreshIndicator(
//             onRefresh: _refreshData,
//             child: FutureBuilder<bool>(
//               future: InternetConnectionChecker().hasConnection,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text("Error: ${snapshot.error}"));
//                 } else if (snapshot.hasData && snapshot.data == true) {
//                   // Internet is available
//                   return Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               FutureBuilder<List<Categori>>(
//                                 future: futureCategori,
//                                 builder: (context, snapshot) {
//                                   if (snapshot.connectionState ==
//                                       ConnectionState.waiting) {
//                                     return Center(
//                                         child: CircularProgressIndicator());
//                                   } else if (snapshot.hasError) {
//                                     return Center(
//                                         child:
//                                             Text('Error: ${snapshot.error}'));
//                                   } else if (!snapshot.hasData ||
//                                       snapshot.data!.isEmpty) {
//                                     return Center(
//                                         child:
//                                             Text('Tidak ada data kategori.'));
//                                   } else {
//                                     return Container(
//                                       width: inWidth,
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 10, vertical: 5),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                         border: Border.all(color: Colors.grey),
//                                       ),
//                                       child: DropdownButtonFormField<Categori>(
//                                         hint: Text('Pilih Kategori'),
//                                         value: selectedCategori,
//                                         onChanged: (Categori? newValue) {
//                                           setState(() {
//                                             selectedCategori = newValue;
//                                           });
//                                         },
//                                         items: snapshot.data!
//                                             .map<DropdownMenuItem<Categori>>(
//                                                 (Categori categori) {
//                                           return DropdownMenuItem<Categori>(
//                                             value: categori,
//                                             child: InkWell(
//                                                 onTap: () {
//                                                   Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             MenuPromoPage()),
//                                                   );
//                                                 },
//                                                 child: Text(
//                                                     categori.category_name)),
//                                           );
//                                         }).toList(),
//                                         isExpanded: true,
//                                         validator: (value) {
//                                           if (value == null) {
//                                             return 'Pilih Kategori';
//                                           }
//                                           return null;
//                                         },
//                                         onSaved: (value) {
//                                           selectedCategori = value;
//                                         },
//                                         decoration: InputDecoration(
//                                           enabledBorder: UnderlineInputBorder(
//                                             borderSide:
//                                                 BorderSide(color: Colors.grey),
//                                           ),
//                                           focusedBorder: UnderlineInputBorder(
//                                             borderSide:
//                                                 BorderSide(color: Colors.grey),
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   }
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: screenWidth,
//                             height: 650,
//                             child: FutureBuilder<List<Blog>>(
//                               future: futureBlog,
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return Center(
//                                       child: CircularProgressIndicator());
//                                 } else if (snapshot.hasError) {
//                                   return Center(
//                                       child: Text("${snapshot.error}"));
//                                 } else if (snapshot.hasData) {
//                                   List<Blog> posts = snapshot.data!;
//                                   return GridView.builder(
//                                     itemCount: posts.length,
//                                     gridDelegate:
//                                         SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 2, // Number of columns
//                                       crossAxisSpacing:
//                                           2.0, // Spacing between columns
//                                       mainAxisSpacing:
//                                           5.0, // Spacing between rows
//                                       childAspectRatio:
//                                           0.8, // Aspect ratio for each item
//                                     ),
//                                     itemBuilder: (context, index) {
//                                       return InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   Artikelwidget(
//                                                 id: posts[index].id,
//                                                 title: posts[index].title,
//                                                 photo: posts[index].photo,
//                                                 body: posts[index].body,
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                         child: Card(
//                                           margin: EdgeInsets.all(5.0),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Image.network(
//                                                 posts[index].photo,
//                                                 width: double.infinity,
//                                                 height: 100,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 5, right: 5, top: 15),
//                                                 child: Text(
//                                                   posts[index].title,
//                                                   style: TextStyle(
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   );
//                                 } else {
//                                   return Center(
//                                       child: Text("No data available"));
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   );
//                 } else {
//                   // No internet connection
//                   return Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 100),
//                       child: Column(
//                         // mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'images/assets/No_internet.png',
//                             width: 200,
//                             height: 200,
//                             fit: BoxFit.cover,
//                           ),
//                           SizedBox(height: 20),
//                           Text(
//                             'Please check your internet connection and try again.',
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 20),
//                           ElevatedButton.icon(
//                             onPressed: () async {
//                               // Re-check the internet connection and refresh the data
//                               bool connection =
//                                   await InternetConnectionChecker()
//                                       .hasConnection;
//                               if (connection) {
//                                 setState(() {
//                                   isConnected = true;
//                                   futureBlog = fetchBlog();
//                                   futureCategori = fetchCategori();
//                                 });
//                               } else {
//                                 setState(() {
//                                   isConnected = false;
//                                 });
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                       content: Text(
//                                           'No internet connection available')),
//                                 );
//                               }
//                             },
//                             icon: Icon(Icons.refresh),
//                             label: Text('Refresh'),
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               backgroundColor: Colors.blue, // Text color
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

///////////////////////////////////////////////

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_Blog/ArtikelPage.dart';
// import 'package:flutter_aag4u/Menu_Promo/MenuPromoPage.dart';
// import 'package:http/http.dart' as http;
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// class Blog {
//   final int id;
//   final String title;
//   final String photo;
//   final String body; // Add this field for the body

//   Blog({
//     required this.id,
//     required this.title,
//     required this.photo,
//     required this.body,
//   });

//   factory Blog.fromJson(Map<String, dynamic> json) {
//     String imageName = json['photo'];
//     String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
//     return Blog(
//       id: json['id'],
//       title: json['title'],
//       photo: imageUrl,
//       body: json['body'] ?? '', // Adjust according to your API response
//     );
//   }
// }

// class Categori {
//   final int id;
//   final String category_name;

//   Categori({required this.id, required this.category_name});

//   factory Categori.fromJson(Map<String, dynamic> json) {
//     return Categori(
//       id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
//       category_name: json['category_name'],
//     );
//   }
// }

// class MenuBlogWidget extends StatefulWidget {
//   const MenuBlogWidget({super.key});

//   @override
//   State<MenuBlogWidget> createState() => _MenuBlogWidgetState();
// }

// class _MenuBlogWidgetState extends State<MenuBlogWidget> {
//   Future<List<Blog>>? futureBlog;
//   Future<List<Categori>>? futureCategori;
//   Categori? selectedCategori;
//   bool isConnected = true; // Assume initially connected

//   @override
//   void initState() {
//     super.initState();
//     futureBlog = fetchBlog();
//     futureCategori = fetchCategori();
//   }

//   Future<List<Blog>> fetchBlog() async {
//     isConnected = await InternetConnectionChecker().hasConnection;

//     if (isConnected) {
//       try {
//         final response =
//             await http.get(Uri.parse('http://www.app.aag4u.co.id/api/getPost'));

//         if (response.statusCode == 200) {
//           List jsonResponse = json.decode(response.body);
//           List<Blog> blogs =
//               jsonResponse.map((data) => Blog.fromJson(data)).toList();
//           return blogs;
//         } else {
//           throw Exception('Failed to load blog posts');
//         }
//       } catch (e) {
//         print('Error fetching data: $e');
//         return _getPlaceholderBlogs();
//       }
//     } else {
//       return _getPlaceholderBlogs();
//     }
//   }
//   Future<List<Blog>> fetchBlogcategoriid() async {
//     isConnected = await InternetConnectionChecker().hasConnection;

//     if (isConnected) {
//       try {
//         final response =
//             await http.get(Uri.parse('https://app.aag4u.co.id/api/getPostCatePest/id'));

//         if (response.statusCode == 200) {
//           List jsonResponse = json.decode(response.body);
//           List<Blog> blogs =
//               jsonResponse.map((data) => Blog.fromJson(data)).toList();
//           return blogs;
//         } else {
//           throw Exception('Failed to load blog posts');
//         }
//       } catch (e) {
//         print('Error fetching data: $e');
//         return _getPlaceholderBlogs();
//       }
//     } else {
//       return _getPlaceholderBlogs();
//     }
//   }

//   Future<List<Categori>> fetchCategori() async {
//     isConnected = await InternetConnectionChecker().hasConnection;

//     if (isConnected) {
//       try {
//         final response = await http
//             .get(Uri.parse('http://www.app.aag4u.co.id/api/getPostCate'));

//         if (response.statusCode == 200) {
//           List jsonResponse = json.decode(response.body);
//           List<Categori> categori =
//               jsonResponse.map((data) => Categori.fromJson(data)).toList();
//           return categori;
//         } else {
//           throw Exception('Failed to load blog posts');
//         }
//       } catch (e) {
//         print('Error fetching data: $e');
//         return _getPlaceholderCategori();
//       }
//     } else {
//       return _getPlaceholderCategori();
//     }
//   }

//   List<Blog> _getPlaceholderBlogs() {
//     return [
//       Blog(
//         id: 0,
//         title: '',
//         photo: 'images/assets/No_internet.png',
//         body: 'Please check your internet connection and try again.',
//       ),
//     ];
//   }
//   List<Categori> _getPlaceholderCategori() {
//     return [
//       Categori(
//         id: 0,
//         category_name: '',
//       ),
//     ];
//   }

//   Future<void> _refreshData() async {
//     await fetchBlog();
//     await fetchCategori();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;
//     double inWidth = MediaQuery.of(context).size.width * 0.8;

//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12.0, vertical: 15.0),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: screenWidth,
//                           height: 50,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(24),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Blogs",
//                                     style: TextStyle(
//                                       fontSize: 35,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF233d63),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           RefreshIndicator(
//             onRefresh: _refreshData,
//             child: FutureBuilder<bool>(
//               future: InternetConnectionChecker().hasConnection,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text("Error: ${snapshot.error}"));
//                 } else if (snapshot.hasData && snapshot.data == true) {
//                   // Internet is available
//                   return Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               FutureBuilder<List<Categori>>(
//                                 future: futureCategori,
//                                 builder: (context, snapshot) {
//                                   if (snapshot.connectionState ==
//                                       ConnectionState.waiting) {
//                                     return Center(
//                                         child: CircularProgressIndicator());
//                                   } else if (snapshot.hasError) {
//                                     return Center(
//                                         child:
//                                             Text('Error: ${snapshot.error}'));
//                                   } else if (!snapshot.hasData ||
//                                       snapshot.data!.isEmpty) {
//                                     return Center(
//                                         child:
//                                             Text('Tidak ada data kategori.'));
//                                   } else {
//                                     return Container(
//                                       width: inWidth,
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 10, vertical: 5),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                         border: Border.all(color: Colors.grey),
//                                       ),
//                                       child: DropdownButtonFormField<Categori>(
//                                         hint: Text('Pilih Kategori'),
//                                         value: selectedCategori,
//                                         onChanged: (Categori? newValue) {
//                                           setState(() {
//                                             selectedCategori = newValue;
//                                           });
//                                         },
//                                         items: snapshot.data!
//                                             .map<DropdownMenuItem<Categori>>(
//                                                 (Categori categori) {
//                                           return DropdownMenuItem<Categori>(
//                                             value: categori,
//                                             child: InkWell(
//                                                 onTap: () {
//                                                   Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             MenuPromoPage()),
//                                                   );
//                                                 },
//                                                 child: Text(
//                                                     categori.category_name)),
//                                           );
//                                         }).toList(),
//                                         isExpanded: true,
//                                         validator: (value) {
//                                           if (value == null) {
//                                             return 'Pilih Kategori';
//                                           }
//                                           return null;
//                                         },
//                                         onSaved: (value) {
//                                           selectedCategori = value;
//                                         },
//                                         decoration: InputDecoration(
//                                           enabledBorder: UnderlineInputBorder(
//                                             borderSide:
//                                                 BorderSide(color: Colors.grey),
//                                           ),
//                                           focusedBorder: UnderlineInputBorder(
//                                             borderSide:
//                                                 BorderSide(color: Colors.grey),
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   }
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: screenWidth,
//                             height: 650,
//                             child: FutureBuilder<List<Blog>>(
//                               future: futureBlog,
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return Center(
//                                       child: CircularProgressIndicator());
//                                 } else if (snapshot.hasError) {
//                                   return Center(
//                                       child: Text("${snapshot.error}"));
//                                 } else if (snapshot.hasData) {
//                                   List<Blog> posts = snapshot.data!;
//                                   return GridView.builder(
//                                     itemCount: posts.length,
//                                     gridDelegate:
//                                         SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 2, // Number of columns
//                                       crossAxisSpacing:
//                                           2.0, // Spacing between columns
//                                       mainAxisSpacing:
//                                           5.0, // Spacing between rows
//                                       childAspectRatio:
//                                           0.8, // Aspect ratio for each item
//                                     ),
//                                     itemBuilder: (context, index) {
//                                       return InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) => Artikelpage(
//                                                 id: posts[index].id,
//                                                 title: posts[index].title,
//                                                 photo: posts[index].photo,
//                                                 body: posts[index].body,
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                         child: Card(
//                                           margin: EdgeInsets.all(5.0),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               Image.network(
//                                                 posts[index].photo,
//                                                 width: double.infinity,
//                                                 height: 100,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 5, right: 5, top: 15),
//                                                 child: Text(
//                                                   posts[index].title,
//                                                   style: TextStyle(
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   );
//                                 } else {
//                                   return Center(
//                                       child: Text("No data available"));
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   );
//                 } else {
//                   // No internet connection
//                   return Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 100),
//                       child: Column(
//                         // mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'images/assets/No_internet.png',
//                             width: 200,
//                             height: 200,
//                             fit: BoxFit.cover,
//                           ),
//                           SizedBox(height: 20),
//                           Text(
//                             'Please check your internet connection and try again.',
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 20),
//                           ElevatedButton.icon(
//                             onPressed: () async {
//                               // Re-check the internet connection and refresh the data
//                               bool connection =
//                                   await InternetConnectionChecker()
//                                       .hasConnection;
//                               if (connection) {
//                                 setState(() {
//                                   isConnected = true;
//                                   futureBlog = fetchBlog();
//                                   futureCategori = fetchCategori();
//                                 });
//                               } else {
//                                 setState(() {
//                                   isConnected = false;
//                                 });
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                       content: Text(
//                                           'No internet connection available')),
//                                 );
//                               }
//                             },
//                             icon: Icon(Icons.refresh),
//                             label: Text('Refresh'),
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               backgroundColor: Colors.blue, // Text color
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//////////////////////////////

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Blog/ArtikelPage.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Blog {
  final int id;
  final String title;
  final String photo;
  final String body;
  final String category;

  Blog({
    required this.id,
    required this.title,
    required this.photo,
    required this.body,
    required this.category,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    String imageName = json['photo'];
    String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
    return Blog(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      photo: imageUrl,
      body: json['body'] ?? '',
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
  Future<List<Categori>>? futureCategori;
  Future<List<Blog>>? futureBlog;
  Categori? selectedCategori;
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    futureBlog = fetchBlog();
    futureCategori = fetchCategori();
  }

  Future<List<Blog>> fetchBlog() async {
    isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      try {
        final response =
            await http.get(Uri.parse('http://www.app.aag4u.co.id/api/getPost'));

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

  Future<List<Blog>> fetchBlogcategoriid(int categoryId) async {
    isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      try {
        final response = await http.get(Uri.parse(
            'https://app.aag4u.co.id/api/getPostCatePest/$categoryId'));

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

  Future<List<Categori>> fetchCategori() async {
    isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      try {
        final response = await http
            .get(Uri.parse('http://www.app.aag4u.co.id/api/getPostCate'));

        if (response.statusCode == 200) {
          List jsonResponse = json.decode(response.body);
          List<Categori> categori =
              jsonResponse.map((data) => Categori.fromJson(data)).toList();
          return categori;
        } else {
          throw Exception('Failed to load categories');
        }
      } catch (e) {
        print('Error fetching data: $e');
        return _getPlaceholderCategori();
      }
    } else {
      return _getPlaceholderCategori();
    }
  }

  List<Blog> _getPlaceholderBlogs() {
    return [
      Blog(
        id: 0,
        title: '',
        photo: 'images/assets/No_internet.png',
        body: 'Please check your internet connection and try again.',
        category: "",
      ),
    ];
  }

  List<Categori> _getPlaceholderCategori() {
    return [
      Categori(
        id: 0,
        category_name: 'No Categories',
      ),
    ];
  }

  Future<void> _refreshData() async {
    await fetchBlog();
    await fetchCategori();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    double screenheight = MediaQuery.of(context).size.height * 0.05;
    double inWidth = MediaQuery.of(context).size.width * 5.0;
    double inheight = MediaQuery.of(context).size.height * 0.8;
    ;
    double fontSize = MediaQuery.of(context).size.width * 0.04;

    return 
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: 
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: screenWidth,
                            height: screenheight,
                            // color: Colors.amber,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Blogs",
                                      style: TextStyle(
                                        fontSize: fontSize,
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
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RefreshIndicator(
            onRefresh: _refreshData,
            child: FutureBuilder<bool>(
              future: InternetConnectionChecker().hasConnection,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: const Color.fromARGB(255, 34, 20, 227),
                      size: 50,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text("Error: ${snapshot.error}",
                          style: TextStyle(fontSize: fontSize * 0.04)));
                } else if (snapshot.hasData && snapshot.data == true) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              FutureBuilder<List<Categori>>(
                                future: futureCategori,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text("");
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child: Text('Error: ${snapshot.error}',
                                            style: TextStyle(
                                                fontSize: fontSize * 0.04)));
                                  } else if (!snapshot.hasData ||
                                      snapshot.data!.isEmpty) {
                                    return Center(
                                        child: Text('No categories available.',
                                            style: TextStyle(
                                                fontSize: fontSize * 0.04)));
                                  } else {
                                    return Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9, // Lebar menyesuaikan layar
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.10, // Lebar menyesuaikan layar
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: DropdownButtonFormField<Categori>(
                                        hint: Text(
                                          'Select Category',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04, // Ukuran teks responsif
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                        ),
                                        value: selectedCategori,
                                        onChanged: (Categori? newValue) {
                                          setState(() {
                                            selectedCategori = newValue;
                                            futureBlog = fetchBlogcategoriid(
                                                selectedCategori!.id);
                                          });
                                        },
                                        items: snapshot.data!
                                            .map<DropdownMenuItem<Categori>>(
                                                (Categori categori) {
                                          return DropdownMenuItem<Categori>(
                                            value: categori,
                                            child: Text(
                                              categori.category_name,
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(
                                                              context)
                                                          .size
                                                          .width *
                                                      0.04, // Ukuran teks lebih kecil
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        isExpanded:
                                            true, // Agar teks tidak terpotong
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select a category';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          selectedCategori = value;
                                        },
                                        decoration: InputDecoration(
                                          isDense:
                                              true, // Agar dropdown tidak terlalu kecil
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.012, // Padding responsif
                                            horizontal: 16.0,
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                                // color: const Color.fromARGB(255, 7, 255, 61),
                                width: screenWidth,
                                height: inheight * 1.0,
                                child: FutureBuilder<List<Blog>>(
                                  future: futureBlog,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: LoadingAnimationWidget
                                                    .inkDrop(
                                                  color: const Color.fromARGB(
                                                      255, 34, 20, 227),
                                                  size: 50,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Center(
                                          child: Text("${snapshot.error}"));
                                    } else if (snapshot.hasData) {
                                      List<Blog> posts = snapshot.data!.reversed.toList();
                                      return GridView.builder(
                                        itemCount: posts.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              2, // Number of columns
                                          crossAxisSpacing:
                                              2.0, // Spacing between columns
                                          mainAxisSpacing:
                                              5.0, // Spacing between rows
                                          childAspectRatio:
                                              0.8, // Aspect ratio for each item
                                        ),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Artikelpage(
                                                    id: posts[index].id,
                                                    title: posts[index].title,
                                                    photo: posts[index].photo,
                                                    body: posts[index].body,
                                                    category:
                                                        posts[index].category,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Card(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0 ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                      borderRadius:
                                                          BorderRadiusDirectional
                                                              .only(
                                                                  topStart: Radius
                                                                      .circular(
                                                                          12),
                                                                  topEnd: Radius
                                                                      .circular(
                                                                          12)),
                                                      child:
                                                          // Image.network(
                                                          //   posts[index].photo,
                                                          //   width: double.infinity,
                                                          //   height: 100,
                                                          //   fit: BoxFit.cover,
                                                          // ),
                                                          CachedNetworkImage(
                                                        imageUrl:
                                                            posts[index].photo,
                                                        width: screenWidth,
                                                        fit: BoxFit.cover,
                                                        placeholder:
                                                            (context, url) =>
                                                                Container(
                                                          width: screenWidth,
                                                          height: 100,
                                                          color: Colors.grey,
                                                          child: Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ),
                                                        ),
                                                      )),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5,
                                                            right: 5,
                                                            top: 5),
                                                    child: Text(
                                                      posts[index].title,
                                                      style: TextStyle(
                                                        fontSize: fontSize,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      textAlign:
                                                          TextAlign.start,
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
                                          child: Text("No data available",
                                              style: TextStyle(
                                                  fontSize: fontSize * 0.04)));
                                    }
                                  },
                                ),
                              ),
                            ),
                          
                        ],
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenheight * 3.0,
                        ),
                        Image.asset(
                          'images/assets/No_internet.png',
                          width: screenWidth * 5.0,
                          height: screenheight * 5.0,
                        ),
                        SizedBox(
                          height: screenheight * 0.5,
                        ),
                        Text(
                          'Please check your internet connection',
                          style: TextStyle(
                              fontSize: fontSize * 1.0, color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
