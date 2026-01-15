import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailBlogWidget extends StatefulWidget {
  final int blogId;
  const DetailBlogWidget({required this.blogId, super.key});

  @override
  State<DetailBlogWidget> createState() => _DetailBlogWidgetState();
}

class _DetailBlogWidgetState extends State<DetailBlogWidget> {
  Future<Map<String, dynamic>>? futureBlogDetail;

  @override
  void initState() {
    super.initState();
    futureBlogDetail = fetchBlogDetail();
  }

  Future<Map<String, dynamic>> fetchBlogDetail() async {
    final response = await http
        .get(Uri.parse('https://app.aag4u.co.id/api/getPost/${widget.blogId}'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load blog detail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blog Detail')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureBlogDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            var data = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(data['photo']),
                  SizedBox(height: 16),
                  Text(
                    data['title'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    data[
                        'content'], // Assuming the API returns a `content` field
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
