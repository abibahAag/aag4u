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
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Blog/ArtikelPage.dart';
import 'package:flutter_aag4u/Menu_Promo/MenuPromoPage.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

// class Blog {
//   final int id; // Change type to int
//   final String photo;
//   final String title;
//   final String body;

//   Blog({
//     required this.id,
//     required this.photo,
//     required this.title,
//     required this.body,
//   });

//   // Method to convert the object to a Map for Hive storage
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'photo': photo,
//       'title': title,
//       'body': body,
//     };
//   }

//   // Method to create an object from a Map
//   factory Blog.fromMap(Map<String, dynamic> map) {
//     return Blog(
//       id: map['id'] ?? 0, // Set a default value if null (0 for int)
//       photo: map['photo'] ?? '', // Set as empty string if null
//       title: map['title'] ?? 'Untitled', // Default title if null
//       body: map['body'] ?? '', // Default body if null
//     );
//   }
// }

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
  bool isConnected = true; // Assume initially connected

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
          throw Exception('Failed to load blog posts');
        }
      } catch (e) {
        print('Error fetching data: $e');
        return _getPlaceholderCategori();
      }
    } else {
      return _getPlaceholderCategori();
    }
  }

  List<Categori> _getPlaceholderCategori() {
    return [
      Categori(
        id: 0,
        category_name: '',
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
    double inWidth = MediaQuery.of(context).size.width * 0.8;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
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
          RefreshIndicator(
            onRefresh: _refreshData,
            child: FutureBuilder<bool>(
              future: InternetConnectionChecker().hasConnection,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData && snapshot.data == true) {
                  // Internet is available
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
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child:
                                            Text('Error: ${snapshot.error}'));
                                  } else if (!snapshot.hasData ||
                                      snapshot.data!.isEmpty) {
                                    return Center(
                                        child:
                                            Text('Tidak ada data kategori.'));
                                  } else {
                                    return Container(
                                      width: inWidth,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                        items: snapshot.data!
                                            .map<DropdownMenuItem<Categori>>(
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
                                                child: Text(
                                                    categori.category_name)),
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
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth,
                            height: 650,
                            child: FutureBuilder<List<Blog>>(
                              future: futureBlog,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text("${snapshot.error}"));
                                } else if (snapshot.hasData) {
                                  List<Blog> posts = snapshot.data!;
                                  return GridView.builder(
                                    itemCount: posts.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, // Number of columns
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
                                              builder: (context) => Artikelpage(
                                                id: posts[index].id,
                                                title: posts[index].title,
                                                photo: posts[index].photo,
                                                body: posts[index].body,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Card(
                                          margin: EdgeInsets.all(5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.network(
                                                posts[index].photo,
                                                width: double.infinity,
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
                                  return Center(
                                      child: Text("No data available"));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  // No internet connection
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/assets/No_internet.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Please check your internet connection and try again.',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: () async {
                              // Re-check the internet connection and refresh the data
                              bool connection =
                                  await InternetConnectionChecker()
                                      .hasConnection;
                              if (connection) {
                                setState(() {
                                  isConnected = true;
                                  futureBlog = fetchBlog();
                                  futureCategori = fetchCategori();
                                });
                              } else {
                                setState(() {
                                  isConnected = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'No internet connection available')),
                                );
                              }
                            },
                            icon: Icon(Icons.refresh),
                            label: Text('Refresh'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue, // Text color
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                          ),
                        ],
                      ),
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




// import 'dart:convert';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/widgets/ArtikelWidget.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;

// class ImageData {
//   final int id; // Change type to int
//   final String photo;
//   final String title;
//   final String body;

//   ImageData({
//     required this.id,
//     required this.photo,
//     required this.title,
//     required this.body,
//   });

//   // Method to convert the object to a Map for Hive storage
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'photo': photo,
//       'title': title,
//       'body': body,
//     };
//   }

//   // Method to create an object from a Map
//   factory ImageData.fromMap(Map<String, dynamic> map) {
//     return ImageData(
//       id: map['id'] ?? 0, // Set a default value if null (0 for int)
//       photo: map['photo'] ?? '', // Set as empty string if null
//       title: map['title'] ?? 'Untitled', // Default title if null
//       body: map['body'] ?? '', // Default body if null
//     );
//   }
// }

// class MenuBlogWidget extends StatefulWidget {
//   @override
//   _MenuBlogWidgetState createState() => _MenuBlogWidgetState();
// }

// class _MenuBlogWidgetState extends State<MenuBlogWidget> {
//   // List<ImageData> _imageUrls = []; // Tidak perlu menggunakan `late` di sini
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
//         // Asumsikan API mengembalikan list objek JSON
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
//         // Jika data dari API berbeda dengan data di Hive, perbarui Hive dan UI
//         await hiveBox
//             .clear(); // Menghapus semua data di Hive sebelum memperbarui
//         for (var imageData in apiImageData) {
//           // await hiveBox.add(imageData.toMap()); // Simpan data sebagai Map
//           String imageUrl = imageData.photo; // Sesuaikan dengan struktur datamu
//           var response = await http.get(Uri.parse(imageUrl));

//           Uint8List imageBytes = response.bodyBytes; // Konversi ke byte array
//           String base64Image = base64Encode(imageBytes); // Konversi ke Base64

//           Map<String, dynamic> dataToStore = {
//             'id': imageData.id, // Data lain dari imageData
//             'title': imageData.title, // Data lain dari imageData
//             'body': imageData.body, // Data lain dari imageData
//             'imageBase64': base64Image, // Simpan gambar sebagai Base64 string
//           };
//           await hiveBox.add(dataToStore);

//           List<Map<String, dynamic>> loadedData = [];
//           for (int i = 0; i < hiveBox.length; i++) {
//             Map<String, dynamic> item =
//                 Map<String, dynamic>.from(hiveBox.getAt(i));
//             loadedData.add(item);
//           }

//           // var lol = imageData.toMap();
//           print('ini wwwwwwwwwwwww $dataToStore');

//           setState(() {
//             _imageUrls = loadedData;
//           });
//         }

//         // Ambil semua data dari Hive box

//         // Perbarui data di UI
//       }
//     } catch (error) {
//       print('Error fetching data from API: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _imageUrls.isEmpty
//         ? Center(child: CircularProgressIndicator())
//         : SingleChildScrollView(
//             child: Column(
//               children: [
//                 Center(
//                   child: Container(
//                     width: MediaQuery.of(context)
//                         .size
//                         .width, // Gunakan lebar layar
//                     child: CarouselSlider(
//                       options: CarouselOptions(
//                         height: 310.0,
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
//                         // Check if 'imageBase64' is not null
//                         String? base64Image = imageData['imageBase64'];

//                         // If base64Image is null, return a placeholder widget or handle the error
//                         if (base64Image == null) {
//                           return Center(child: Text('Image not available'));
//                         }

//                         // Dekode Base64 menjadi Uint8List
//                         Uint8List decodedBytes = base64Decode(base64Image);

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
//                                       photo:
//                                           decodedBytes, // Kirim Uint8List hasil decode
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
//                                         // Tampilkan gambar menggunakan Image.memory
//                                         child: Image.memory(
//                                           decodedBytes,
//                                           fit: BoxFit.cover,
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
//                                             overflow: TextOverflow
//                                                 .visible, // Handle overflow
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
