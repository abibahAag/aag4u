// ///////////////////////////////////////////////
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_Blog/ArtikelPage.dart';
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

// class MenuBlogWidgetCate extends StatefulWidget {
//   const MenuBlogWidgetCate({super.key});

//   @override
//   State<MenuBlogWidgetCate> createState() => _MenuBlogWidgetState();
// }

// class _MenuBlogWidgetState extends State<MenuBlogWidgetCate> {
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
//         final response = await http
//             .get(Uri.parse('http://www.app.aag4u.co.id/api/getPostCatePest/'));

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
//                                 future: fetchCategori(),
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
//                                               onTap: () {
//                                                 Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         MenuBlogWidgetCate(),
//                                                   ),
//                                                 );
//                                               },
//                                               child:
//                                                   Text(categori.category_name),
//                                             ),
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
