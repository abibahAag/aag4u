// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'BlogPage.dart';

// class CategoryBlogPage extends StatefulWidget {
//   final int categoryId;

//   CategoryBlogPage({required this.categoryId});

//   @override
//   _CategoryBlogPageState createState() => _CategoryBlogPageState();
// }

// class _CategoryBlogPageState extends State<CategoryBlogPage> {
//   late Future<List<Blog>> futureBlogPosts;

//   @override
//   void initState() {
//     super.initState();
//     futureBlogPosts = fetchBlogPostsByCategory(widget.categoryId);
//   }

//   Future<List<Blog>> fetchBlogPostsByCategory(int categoryId) async {
//     try {
//       final response = await http.get(
//         Uri.parse('https://app.aag4u.co.id/api/getPostCatePest/$categoryId'),
//       );

//       if (response.statusCode == 200) {
//         List jsonResponse = json.decode(response.body);
//         return jsonResponse.map((data) => Blog.fromJson(data)).toList();
//       } else {
//         throw Exception('Failed to load blog posts');
//       }
//     } catch (e) {
//       print('Error fetching blog posts: $e');
//       return []; // Or return a placeholder list if preferred
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Blog Posts'),
//       ),
//       body: FutureBuilder<List<Blog>>(
//         future: futureBlogPosts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No blog posts available.'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final blog = snapshot.data![index];
//                 return ListTile(
//                   title: Text(blog.title),
//                   subtitle: Text(blog.body ?? ''),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
