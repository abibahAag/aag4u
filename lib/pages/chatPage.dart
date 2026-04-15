// import 'package:flutter/material.dart';

// // void main() {
// //   runApp(ChatPage());
// // }

// class ChatPage extends StatelessWidget {
//   const ChatPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     // return MaterialApp(
//     return ChatScreen();
//     // );
//   }
// }

// class ChatScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Row(
//           children: [
//             // CircleAvatar(
//             //   // backgroundImage: Image.network('https://png.pngtree.com/png-vector/20230316/ourlarge/pngtree-admin-and-customer-service-job-vacancies-vector-png-image_6650726.png'),
//             //   backgroundImage: NetworkImage(
//             //       'https://png.pngtree.com/png-vector/20230316/ourlarge/pngtree-admin-and-customer-service-job-vacancies-vector-png-image_6650726.png'), // Replace with your avatar image
//             //   onBackgroundImageError: (exception, stackTrace) {
//             //     print('Image load failed!'); // Handle image loading error
//             //   },
//             // ),
//             CircleAvatar(
//               // radius: 100, // Adjust the radius for the size of the circle
//               backgroundImage: NetworkImage(
//                 'https://images.tokopedia.net/blog-tokopedia-com/uploads/2021/03/Freepik2.jpg',
//               ),
//             ),
//             SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('AAG4U CS', style: TextStyle(fontSize: 18)),
//                 Text('Online', style: TextStyle(fontSize: 12)),
//               ],
//             ),
//             Spacer(),
//             Icon(Icons.videocam),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(16.0),
//               children: [
//                 buildTextMessage('Halo, Ada yang bisa di bantu ..', false),
//                 buildTextMessage(
//                     'Terdapat lubang di area kamar mandi saya, dan ada akses untuk tikus masuk, apa treatment yg cocok untuk kendala tersebut ?',
//                     true),
//                 // buildVoiceMessage(true),
//                 // buildVoiceMessage(false),
//               ],
//             ),
//           ),
//           buildInputField(),
//         ],
//       ),
//     );
//   }

//   Widget buildTextMessage(String message, bool isSent) {
//     return Align(
//       alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 8),
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: isSent ? Colors.blue : Colors.grey[300],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           message,
//           style: TextStyle(color: isSent ? Colors.white : Colors.black),
//         ),
//       ),
//     );
//   }

//   Widget buildVoiceMessage(bool isSent) {
//     return Align(
//       alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 8),
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: isSent ? Colors.blue : Colors.grey[300],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.play_arrow, color: isSent ? Colors.white : Colors.black),
//             SizedBox(width: 10),
//             Container(
//               width: 100,
//               height: 20,
//               color: isSent ? Colors.white : Colors.black,
//             ),
//             SizedBox(width: 10),
//             Text('01:19',
//                 style: TextStyle(color: isSent ? Colors.white : Colors.black)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildInputField() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       color: Colors.white,
//       child: Row(
//         children: [
//           Icon(Icons.mic, color: Colors.grey),
//           SizedBox(width: 10),
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Your messages',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           Icon(Icons.camera_alt, color: Colors.grey),
//           SizedBox(width: 10),
//           Icon(Icons.send, color: Colors.blue),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<dynamic> articles = [];
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    fetchArticles(selectedCategory); // Fetch articles for initial category
  }

  Future<void> fetchArticles(String category) async {
    final url = category == 'All'
        ? 'https://app.aag4u.co.id/api/getVideoHama'
        : 'https://app.aag4u.co.id/api/getVideoHamaBy/$category'; // Adjust API endpoint as needed
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          articles = json.decode(response.body);
        });
      } else {
        // Handle error
        print('Failed to load articles');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void onSegmentSelected(String category) {
    setState(() {
      selectedCategory = category;
      fetchArticles(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AAG4U Event'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_rounded),
            onPressed: () {
              fetchArticles(selectedCategory); // Refresh articles
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.blueGrey),
              ),
            ),
          ),
          // Segmented Control
          Container(
            padding: EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSegmentButton('All', selectedCategory == 'All'),
                  SizedBox(width: 7),
                  _buildSegmentButton('Pest Awareness', selectedCategory == 6),
                  SizedBox(width: 7),
                  _buildSegmentButton('Training', selectedCategory == 5),
                  SizedBox(width: 7),
                  _buildSegmentButton('Tips & Trick', selectedCategory == 5),
                ],
              ),
            ),
          ),
          // Article List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return _buildArticleCard(
                  title: article['judul'],
                  time: "4 NOv 24",
                  category: "jajaj",
                  imageUrl:
                      "https://www.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg",
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentButton(String title, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.orange.withOpacity(0.3)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextButton(
            onPressed: () => onSegmentSelected(title),
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.orange : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildArticleCard({
    required String title,
    required String time,
    required String category,
    required String imageUrl,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image on the left
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    time,
                    style: TextStyle(fontSize: 9, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    category,
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
