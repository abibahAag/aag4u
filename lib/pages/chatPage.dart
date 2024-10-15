import 'package:flutter/material.dart';
import 'package:flutter_aag4u/template/navbar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "CHAT",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Text(
                                    "COMING SOON",
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
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

// class ChatPage extends StatefulWidget {
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
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
//             'imageBase64': base64Image, // Simpan gambar sebagai Base64 string
//             'title': imageData.title, // Data lain dari imageData
//             'body': imageData.body, // Data lain dari imageData
//           };
//           await hiveBox.add(dataToStore);

//           List<Map<String, dynamic>> loadedData = [];
//           for (int i = 0; i < hiveBox.length; i++) {
//             Map<String, dynamic> item =
//                 Map<String, dynamic>.from(hiveBox.getAt(i));
//             loadedData.add(item);
//           }

//           // var lol = imageData.toMap();
//           print('ini xxxxxxxxxxxxx $dataToStore');

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
//                         // Ambil gambar dalam Base64 dari Hive
//                         String base64Image = imageData['imageBase64'];

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
//                                       photo: imageData['photo'],
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
