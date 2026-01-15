// // import 'package:flutter/material.dart';
// // import 'package:flutter_aag4u/template/navbar.dart';

// // class ChatPage extends StatelessWidget {
// //   const ChatPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: Navbar(),
// //       body: SafeArea(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Padding(
// //                   padding: EdgeInsets.all(0),
// //                   child: Container(
// //                     child: Column(
// //                       children: [
// //                         Row(
// //                           children: [
// //                             Text(
// //                               "CHAT",
// //                               style: TextStyle(
// //                                 fontSize: 25,
// //                               ),
// //                             )
// //                           ],
// //                         ),
// //                         SizedBox(
// //                           height: 10,
// //                         ),
// //                         Row(
// //                           children: [
// //                             Column(
// //                               children: [
// //                                 Container(
// //                                   child: Text(
// //                                     "COMING SOON",
// //                                     style: TextStyle(
// //                                       fontSize: 35,
// //                                       fontWeight: FontWeight.bold,
// //                                     ),
// //                                   ),
// //                                 )
// //                               ],
// //                             )
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'dart:convert';

// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_aag4u/widgets/ArtikelWidget.dart';
// // import 'package:hive/hive.dart';
// // import 'package:http/http.dart' as http;

// // class ImageData {
// //   final int id; // Change type to int
// //   final String photo;
// //   final String title;
// //   final String body;

// //   ImageData({
// //     required this.id,
// //     required this.photo,
// //     required this.title,
// //     required this.body,
// //   });

// //   // Method to convert the object to a Map for Hive storage
// //   Map<String, dynamic> toMap() {
// //     return {
// //       'id': id,
// //       'photo': photo,
// //       'title': title,
// //       'body': body,
// //     };
// //   }

// //   // Method to create an object from a Map
// //   factory ImageData.fromMap(Map<String, dynamic> map) {
// //     return ImageData(
// //       id: map['id'] ?? 0, // Set a default value if null (0 for int)
// //       photo: map['photo'] ?? '', // Set as empty string if null
// //       title: map['title'] ?? 'Untitled', // Default title if null
// //       body: map['body'] ?? '', // Default body if null
// //     );
// //   }
// // }

// // class ChatPage extends StatefulWidget {
// //   @override
// //   _ChatPageState createState() => _ChatPageState();
// // }

// // class _ChatPageState extends State<ChatPage> {
// //   // List<ImageData> _imageUrls = []; // Tidak perlu menggunakan `late` di sini
// //   List<Map<String, dynamic>> _imageUrls = [];
// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadData(); // Memulai proses mengambil data dari Hive dan API
// //   }

// //   Future<List<ImageData>> _fetchImageDataFromApi() async {
// //     try {
// //       final response =
// //           await http.get(Uri.parse('https://app.aag4u.co.id/api/getPostLimit'));
// //       if (response.statusCode == 200) {
// //         List jsonData = json.decode(response.body);
// //         // Asumsikan API mengembalikan list objek JSON
// //         return jsonData.map((item) => ImageData.fromMap(item)).toList();
// //       } else {
// //         throw Exception('Failed to load image data from API');
// //       }
// //     } catch (error) {
// //       throw Exception('Error fetching data from API: $error');
// //     }
// //   }

// //   Future<void> _loadData() async {
// //     var hiveBox = await Hive.openBox('dataBox');

// //     // Ambil data dari Hive terlebih dahulu
// //     List<Map<String, dynamic>> loadedData = [];
// //     for (int i = 0; i < hiveBox.length; i++) {
// //       Map<String, dynamic> item = Map<String, dynamic>.from(hiveBox.getAt(i));
// //       loadedData.add(item);
// //     }

// //     // Tampilkan data dari Hive terlebih dahulu
// //     setState(() {
// //       _imageUrls = loadedData;
// //     });

// //     // Coba ambil data dari API dan perbarui Hive jika ada perbedaan
// //     try {
// //       List<ImageData> apiImageData = await _fetchImageDataFromApi();

// //       if (!listEquals(apiImageData, loadedData)) {
// //         // Jika data dari API berbeda dengan data di Hive, perbarui Hive dan UI
// //         await hiveBox
// //             .clear(); // Menghapus semua data di Hive sebelum memperbarui
// //         for (var imageData in apiImageData) {
// //           // await hiveBox.add(imageData.toMap()); // Simpan data sebagai Map
// //           String imageUrl = imageData.photo; // Sesuaikan dengan struktur datamu
// //           var response = await http.get(Uri.parse(imageUrl));

// //           Uint8List imageBytes = response.bodyBytes; // Konversi ke byte array
// //           String base64Image = base64Encode(imageBytes); // Konversi ke Base64

// //           Map<String, dynamic> dataToStore = {
// //             'id': imageData.id, // Data lain dari imageData
// //             'imageBase64': base64Image, // Simpan gambar sebagai Base64 string
// //             'title': imageData.title, // Data lain dari imageData
// //             'body': imageData.body, // Data lain dari imageData
// //           };
// //           await hiveBox.add(dataToStore);

// //           List<Map<String, dynamic>> loadedData = [];
// //           for (int i = 0; i < hiveBox.length; i++) {
// //             Map<String, dynamic> item =
// //                 Map<String, dynamic>.from(hiveBox.getAt(i));
// //             loadedData.add(item);
// //           }

// //           // var lol = imageData.toMap();
// //           print('ini xxxxxxxxxxxxx $dataToStore');

// //           setState(() {
// //             _imageUrls = loadedData;
// //           });
// //         }

// //         // Ambil semua data dari Hive box

// //         // Perbarui data di UI
// //       }
// //     } catch (error) {
// //       print('Error fetching data from API: $error');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return _imageUrls.isEmpty
// //         ? Center(child: CircularProgressIndicator())
// //         : SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 Center(
// //                   child: Container(
// //                     width: MediaQuery.of(context)
// //                         .size
// //                         .width, // Gunakan lebar layar
// //                     child: CarouselSlider(
// //                       options: CarouselOptions(
// //                         height: 310.0,
// //                         aspectRatio: 19 / 19,
// //                         viewportFraction: 0.8,
// //                         initialPage: 0,
// //                         enableInfiniteScroll: true,
// //                         reverse: false,
// //                         autoPlay: true,
// //                         autoPlayInterval: Duration(seconds: 5),
// //                         autoPlayAnimationDuration: Duration(milliseconds: 800),
// //                         autoPlayCurve: Curves.fastOutSlowIn,
// //                         enlargeCenterPage: true,
// //                         scrollDirection: Axis.horizontal,
// //                       ),
// //                       items: _imageUrls.map((imageData) {
// //                         // Ambil gambar dalam Base64 dari Hive
// //                         String base64Image = imageData['imageBase64'];

// //                         // Dekode Base64 menjadi Uint8List
// //                         Uint8List decodedBytes = base64Decode(base64Image);

// //                         return Builder(
// //                           builder: (BuildContext context) {
// //                             return InkWell(
// //                               onTap: () {
// //                                 Navigator.push(
// //                                   context,
// //                                   MaterialPageRoute(
// //                                     builder: (context) => Artikelwidget(
// //                                       id: imageData['id'],
// //                                       title: imageData['title'],
// //                                       photo: imageData['photo'],
// //                                       body: imageData['body'],
// //                                     ),
// //                                   ),
// //                                 );
// //                               },
// //                               child: Container(
// //                                 margin: EdgeInsets.symmetric(horizontal: 5.0),
// //                                 decoration: BoxDecoration(
// //                                   color: Colors.grey[100],
// //                                   borderRadius: BorderRadius.circular(20),
// //                                 ),
// //                                 child: ClipRRect(
// //                                   borderRadius: BorderRadius.circular(20),
// //                                   child: Column(
// //                                     children: [
// //                                       Container(
// //                                         width:
// //                                             MediaQuery.of(context).size.width,
// //                                         // Tampilkan gambar menggunakan Image.memory
// //                                         child: Image.memory(
// //                                           decodedBytes,
// //                                           fit: BoxFit.cover,
// //                                         ),
// //                                       ),
// //                                       SizedBox(height: 10),
// //                                       Center(
// //                                         child: Container(
// //                                           width: MediaQuery.of(context)
// //                                                   .size
// //                                                   .width *
// //                                               0.7,
// //                                           child: Text(
// //                                             imageData['title'],
// //                                             style: TextStyle(
// //                                               fontSize: 15,
// //                                               fontWeight: FontWeight.bold,
// //                                             ),
// //                                             overflow: TextOverflow
// //                                                 .visible, // Handle overflow
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ),
// //                             );
// //                           },
// //                         );
// //                       }).toList(),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //   }
// // }
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
import 'package:flutter_aag4u/pages/FaqPage.dart';
import 'package:flutter_aag4u/pages/LayananPelangganPage.dart';
import 'package:flutter_aag4u/pages/homepage.dart';

/////////////////// Chat 1 aplikasi  2 chat ////////////////
///
// import 'package:flutter/material.dart';

// class ChatPage extends StatefulWidget {
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   TextEditingController _messageController = TextEditingController();
//   List<Map<String, dynamic>> _messages = [];

//   // Data akun manual
//   String _currentUserId = "user1"; // Akun aktif saat ini
//   String _currentUserName = "User 1"; // Nama akun aktif
//   final List<Map<String, String>> _accounts = [
//     {"id": "user1", "name": "User 1"},
//     {"id": "user2", "name": "User 2"},
//   ];

//   String _receiverId = "user2"; // Default penerima

//   // Kirim pesan
//   void _sendMessage() {
//     final message = _messageController.text.trim();
//     if (message.isNotEmpty) {
//       setState(() {
//         _messages.add({
//           'from_id': _currentUserId, // ID Pengirim
//           'receiver_id': _receiverId, // ID Penerima
//           'name': _currentUserName, // Nama Pengirim
//           'message': message, // Pesan
//           'timestamp': DateTime.now().toString(), // Waktu pengiriman
//         });
//       });

//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat App'),
//         actions: [
//           // Dropdown untuk mengganti akun aktif
//           DropdownButton<String>(
//             value: _currentUserId,
//             onChanged: (String? newValue) {
//               setState(() {
//                 _currentUserId = newValue!;
//                 _currentUserName = _accounts.firstWhere(
//                     (account) => account['id'] == newValue)['name']!;
//                 _receiverId =
//                     newValue == "user1" ? "user2" : "user1"; // Ubah penerima
//               });
//             },
//             items: _accounts.map((account) {
//               return DropdownMenuItem<String>(
//                 value: account['id'],
//                 child: Text(account['name']!),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Daftar pesan
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 final isSender = message['sender_id'] == _currentUserId;

//                 return Align(
//                   alignment:
//                       isSender ? Alignment.centerRight : Alignment.centerLeft,
//                   child: Container(
//                     margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: isSender ? Colors.blue : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if (!isSender)
//                           Text(
//                             message['name'],
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         SizedBox(height: 5),
//                         Text(
//                           message['message'],
//                           style: TextStyle(
//                             color: isSender ? Colors.white : Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           message['timestamp'],
//                           style: TextStyle(
//                             fontSize: 10,
//                             color: isSender ? Colors.white70 : Colors.black54,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           // Input pesan
//           Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(hintText: 'Type a message'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
////////////////////////////////////////////////////

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Client {
//   final String name;
//   final String chat_user_id;
//   final String email;
//   final String photo;

//   Client({
//     required this.name,
//     required this.email,
//     required this.chat_user_id,
//     required this.photo,
//   });

//   factory Client.fromJson(Map<String, dynamic> json) {
//     return Client(
//       chat_user_id: json['chat_user_id'],
//       name: json['name'],
//       email: json['email'],
//       photo: json['photo'] ?? '',
//     );
//   }
// }

// class Message {
//   final String fromChat;
//   final int id;

//   final String targetChat;
//   final String body;
//   final String file;

//   Message({
//     required this.fromChat,
//     required this.body,
//     required this.targetChat,
//     required this.file,
//     required this.id,
//   });

//   factory Message.fromMap(Map<String, dynamic> json) {
//     return Message(
//       id: json['id'],
//       targetChat: json['targetChat'],
//       fromChat: json['fromChat'],
//       body: json['body'],
//       file: json['file'] ?? '',
//     );
//   }
//   // Convert ChatMessage to JSON for sending to API
//   Map<String, dynamic> toJson() {
//     return {
//       'targetChat': targetChat,
//       'fromChat': fromChat,
//       'body': body,
//       'file': file,
//       'id': id,
//     };
//   }
// }

// class ChatMessage {
//   final String from;
//   final String to;
//   final String body;
//   final String? file;

//   ChatMessage({
//     required this.from,
//     required this.to,
//     required this.body,
//     required this.file,
//   });

//   // Factory constructor to create ChatMessage from JSON
//   factory ChatMessage.fromJson(Map<String, dynamic> json) {
//     return ChatMessage(
//       from: json['from'],
//       to: json['to'],
//       body: json['body'],
//       file: json['file'],
//     );
//   }

//   // Convert ChatMessage to JSON for sending to API
//   Map<String, dynamic> toJson() {
//     return {
//       'from': from,
//       'to': to,
//       'body': body,
//       'file': file,
//     };
//   }
// }

// // Admin Chat Page (Displays the list of clients)
// class ChatPageAdmin extends StatefulWidget {
//   final String adminEmail;
//   // final String clientEmail;
//   ChatPageAdmin({
//     required this.adminEmail,
//     // required this.clientEmail
//   });
//   @override
//   _ChatPageAdminState createState() => _ChatPageAdminState();
// }

// class _ChatPageAdminState extends State<ChatPageAdmin> {
//   List<Client> clients = [];
//   bool isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     fetchChatList();
//   }

//   Future<void> fetchChatList() async {
//     try {
//       final response = await http.get(
//         Uri.parse(
//             'https://app.aag4u.co.id/api/getChatList/${widget.adminEmail}'),
//       );
//       // print("data chat list: $response");

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           clients =
//               (data as List).map((item) => Client.fromJson(item)).toList();
//           isLoading = false;
//         });
//       } else {
//         // setState(() {
//         //   isLoading = false;
//         // });
//         throw Exception('Failed to load chat list');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       print("Error fetching chat list: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Admin Chat (${widget.adminEmail})")),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.separated(
//               itemCount: clients.length,
//               itemBuilder: (context, index) {
//                 final client = clients[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                     radius: 25,
//                     backgroundImage: client.photo.isNotEmpty
//                         ? NetworkImage(client.photo)
//                         : AssetImage('images/profile.png') as ImageProvider,
//                   ),
//                   title: Text(client.name,
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   // subtitle: Text(client.email),
//                   onTap: () {
//                     // Navigate to chat with the selected client
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ClientChatPage(
//                           adminEmail: widget.adminEmail, // Admin email
//                           chat_user_id: client.chat_user_id,
//                           clientEmail: client.email, // Client email
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return Divider(
//                   thickness: 1, // Thickness of the line
//                   color: Colors.grey.shade300, // Line color
//                   indent: 16, // Start of the line
//                   endIndent: 16, // End of the line
//                 );
//               },
//             ),
//     );
//   }
// }

// ////
// class ClientChatPage extends StatefulWidget {
//   final String adminEmail;
//   final String clientEmail;
//   final String chat_user_id;

//   ClientChatPage({
//     required this.adminEmail,
//     required this.chat_user_id,
//     required this.clientEmail,
//   });

//   @override
//   _ClientChatPageState createState() => _ClientChatPageState();
// }

// class _ClientChatPageState extends State<ClientChatPage> {
//   final TextEditingController _messageController = TextEditingController();
//   bool _isLoading = false;
//   List<ChatMessage> _messages = [];
//   List<Message> messagesChat = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadChatMessages();
//     fetchChatMessages();
//   }

//   // Fetch Chat Messages dari API
//   Future<void> fetchChatMessages() async {
//     final response = await http.get(
//       Uri.parse(
//           'https://app.aag4u.co.id/api/getChat/${widget.clientEmail}/${widget.adminEmail}'),
//     );

//     if (response.statusCode == 200) {
//       List data = json.decode(response.body);
//       messagesChat = data.map((item) => Message.fromMap(item)).toList();

//       // List jsonData = json.decode(response.body);
//       // return jsonData.map((item) => ImageData.fromMap(item)).toList();
//       print("API Response aaaaaaaaaaaa: $data");
//       print("API Response: $messagesChat");
//       // if (data is List) {
//       //   // Memetakan data menjadi list ChatMessage
//       //   return data.map((json) => Message.fromJson(json)).toList();
//       // } else {
//       //   throw Exception('Invalid data format');
//       // }
//     } else {
//       throw Exception('Failed to load chat messages');
//     }
//   }

//   // Kirim Pesan ke API
//   Future<void> sendChatMessage(ChatMessage message) async {
//     final response = await http.post(
//       Uri.parse('https://app.aag4u.co.id/api/sendChat'),
//       body: json.encode(message.toJson()),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode != 200) {
//       print("Gagal mengirim pesan");
//     }
//   }

//   // Load Chat dari API
//   Future<void> _loadChatMessages() async {
//     try {
//       final messages = await fetchChatMessages();
//       setState(() {
//         messagesChat = messagesChat;
//       });
//     } catch (e) {
//       print("Error loading messages: $e");
//     }
//   }

//   // Kirim Pesan Baru
//   void _sendMessage() async {
//     if (_messageController.text.isEmpty) return;

//     setState(() {
//       _isLoading = true;
//     });

//     ChatMessage message = ChatMessage(
//         from: widget.adminEmail,
//         to: widget.clientEmail,
//         body: _messageController.text,
//         file: null);

//     await sendChatMessage(message);

//     setState(() {
//       _messages.add(message);
//       _isLoading = false;
//     });

//     _messageController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Chat dengan ${widget.clientEmail}")),
//       body: Column(
//         children: [
//           Expanded(
//               child: messagesChat.isEmpty
//                   ? ListView.builder(
//                       itemCount: _messages.length,
//                       itemBuilder: (context, index) {
//                         final msg = messagesChat[index];
//                         print("isi data chat : $msg");

//                         return ListTile(
//                           title: Text("data",
//                               // msg.body,
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                         );

//                         // Text(
//                         //   msg.body,
//                         //   style: TextStyle(color: Colors.amber),
//                         // );
//                         //  Align(
//                         //   alignment: msg.fromChat == widget.adminEmail
//                         //       ? Alignment.centerRight
//                         //       : Alignment.centerLeft,
//                         //   child: Container(
//                         //     margin:
//                         //         EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                         //     padding: EdgeInsets.all(10),
//                         //     decoration: BoxDecoration(
//                         //       color: msg.fromChat == widget.adminEmail
//                         //           ? Colors.blue[100]
//                         //           : Colors.grey[300],
//                         //       borderRadius: BorderRadius.circular(10),
//                         //     ),
//                         //     child: Text(msg.body), // Menampilkan data body pesan
//                         //   ),
//                         // );
//                       },
//                     )
//                   : Center(child: Text("Belum ada pesan."))),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(hintText: 'Ketik pesan...'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: _isLoading
//                       ? CircularProgressIndicator()
//                       : Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
////////////////////////////////////////////////////

class Bantuanpage extends StatelessWidget {
  const Bantuanpage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    homePage(
                  isRegistered: false,
                  // login: false,
                  isLoggedIn: false,
                ),
              ),
              (route) => false, // Menghapus semua rute sebelumnya
            );
          },
        ),
        title: Text("Pusat Bantuan "),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 57, 7, 255),
            width: screenWidth,
            // width: 300,
            height: 500,
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.amber,
                      width: screenWidth,
                      // width: 300,
                      height: 500,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 50, left: 5, right: 5),
                                child: Container(
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FaqPage()),
                                          );
                                        },
                                        child: Card(
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              width: 300,
                                              height: 100,
                                              // color: Colors.blue,
                                              child: Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .question_mark_sharp,
                                                        size: 34.0,
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 250,
                                                            height: 100,
                                                            color: Colors.amber,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "FAQ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              17,
                                                                          color: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                    "Temukan jawaban atas pertanyaan yang sering di ajukan",
                                                                    style: TextStyle(
                                                                        overflow:
                                                                            TextOverflow
                                                                                .fade,
                                                                        fontSize:
                                                                            13,
                                                                        color: Colors
                                                                            .grey[600]),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LayananPelanggan()),
                                          );
                                        },
                                        child: Card(
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              width: 300,
                                              height: 100,
                                              // color: Colors.blue,
                                              child: Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .headset_mic_rounded,
                                                        size: 34.0,
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 250,
                                                            height: 100,
                                                            // color: Colors.amber,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Layanan Pelanggan",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              17,
                                                                          color: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                    "Hubungi kami melalui Layanan Pest Control ",
                                                                    style: TextStyle(
                                                                        overflow:
                                                                            TextOverflow
                                                                                .fade,
                                                                        fontSize:
                                                                            13,
                                                                        color: Colors
                                                                            .grey[600]),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
