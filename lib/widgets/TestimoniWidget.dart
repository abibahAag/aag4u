// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Testi {
//   // final String id;

//   final String gambar_testi;

//   Testi({required this.gambar_testi});

//   factory Testi.fromJson(Map<String, dynamic> json) {
//     String id = json['id'].toString();
//     String imageName = json['gambar_testi'].toString();
//     String imageUrl = 'https://app.aag4u.co.id/public/image/testi/$imageName';
//     return Testi(
//       // id: json['id'],
//       gambar_testi: imageUrl.toString(),
//     );
//   }
// }

// class Testimoniwidget extends StatefulWidget {
//   const Testimoniwidget({super.key});
//   @override
//   State<Testimoniwidget> createState() => _TestimoniwidgetState();
// }

// class _TestimoniwidgetState extends State<Testimoniwidget> {
//   Future<List<Testi>>? futureTesti;

//   @override
//   void initState() {
//     super.initState();
//     futureTesti = fetchTesti();
//   }

//   Future<List<Testi>> fetchTesti() async {
//     final response =
//         await http.get(Uri.parse('https://app.aag4u.co.id/api/getTesti'));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       // print('aaaaaa ${jsonResponse}  ');
//       return jsonResponse.map((data) => Testi.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load Banner posts');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;
//     double screen = MediaQuery.of(context).size.width * 0.8;
//     return SingleChildScrollView(
//       // body: SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 0, right: 0),
//         child: FutureBuilder<List<Testi>>(
//           future: futureTesti,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text("${snapshot.error}"));
//             } else if (snapshot.hasData) {
//               List<Testi> posts = snapshot.data!;
//               return Row(
//                 children: posts.map((Testi) {
//                   return Container(
//                     width: screenWidth,
//                     decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(24)),

//                     child:  ClipRRect(
//                         borderRadius: BorderRadius.circular(24.0),
//                         child: Image.network(
//                           Testi.gambar_testi.toString(),
//                           width: screen,
//                           fit: BoxFit.cover,
//                         ),
//                       )

//                   );
//                 }).toList(),
//               );
//             } else {
//               return Center(child: Text("No data available"));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class Testi {
  final String gambar_testi;

  Testi({
    required this.gambar_testi,
  });

  // Method to convert the object to a Map for Hive storage
  Map<String, dynamic> toMap() {
    return {
      'gambar_testi': gambar_testi,
    };
  }

  factory Testi.fromMap(Map<String, dynamic> map) {
    return Testi(
      gambar_testi: map['gambar_testi'] ?? '', // Set as empty string if null
    );
  }
}

class Testimoniwidget extends StatefulWidget {
  const Testimoniwidget({super.key});

  @override
  State<Testimoniwidget> createState() => _TestimoniwidgetState();
}

class _TestimoniwidgetState extends State<Testimoniwidget> {
  List<Map<String, dynamic>> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadData(); // Start loading data from Hive and API
  }

  Future<List<Testi>> _fetchImageDataFromApi() async {
    try {
      final response =
          await http.get(Uri.parse('https://app.aag4u.co.id/api/getTesti'));
      if (response.statusCode == 200) {
        List jsonData = json.decode(response.body);
        // Assuming the API returns a list of JSON objects
        return jsonData.map((item) => Testi.fromMap(item)).toList();
      } else {
        throw Exception('Failed to load image data from API');
      }
    } catch (error) {
      throw Exception('Error fetching data from API: $error');
    }
  }

  Future<void> _loadData() async {
    var hiveBox = await Hive.openBox('testiBox');

    // Retrieve data from Hive first
    List<Map<String, dynamic>> loadedData = [];
    for (int i = 0; i < hiveBox.length; i++) {
      var item = hiveBox.getAt(i);

      // Ensure the item is a Map before proceeding
      if (item is Map) {
        Map<String, dynamic> mapItem = Map<String, dynamic>.from(item);
        loadedData.add(mapItem);
      } else {
        print('Error: Expected Map, but got ${item.runtimeType}');
      }
    }

    // Display data from Hive first
    setState(() {
      _imageUrls = loadedData;
    });

    // Try to fetch data from API and update Hive if there's a difference
    try {
      List<Testi> apiImageData = await _fetchImageDataFromApi();

      if (!listEquals(apiImageData, loadedData)) {
        // If data from API is different from data in Hive, update Hive and UI
        await hiveBox.clear(); // Clear all data in Hive before updating
        for (var imageData in apiImageData) {
          String imageUrl = imageData.gambar_testi; // Store image URL

          Map<String, dynamic> dataToStore = {
            'imageUrl': imageUrl, // Store the image URL
          };
          await hiveBox.add(dataToStore);
        }

        // Refresh loadedData from Hive
        loadedData = [];
        for (int i = 0; i < hiveBox.length; i++) {
          var item = hiveBox.getAt(i);

          // Ensure the item is a Map before proceeding
          if (item is Map) {
            Map<String, dynamic> mapItem = Map<String, dynamic>.from(item);
            loadedData.add(mapItem);
          } else {
            print('Error: Expected Map, but got ${item.runtimeType}');
          }
        }

        setState(() {
          _imageUrls = loadedData; // Update UI with new data
        });
      }
    } catch (error) {
      print('Error fetching data from API: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    double screen = MediaQuery.of(context).size.width * 0.8;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Row(
          children: _imageUrls.map((imageData) {
            // Get the image URL directly from the stored data
            String? imageUrl = imageData['imageUrl'];

            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(24)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: imageUrl != null
                              ?
                              // Image.network(
                              //     imageUrl,
                              //     width: screen,
                              //     fit: BoxFit.cover,
                              //   )
                              CachedNetworkImage(
                                  fadeInDuration: Duration(seconds: 1),
                                  imageUrl: imageUrl,
                                  width: screenWidth,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    width: screenWidth,
                                    height: 100,
                                    color: Colors.grey,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: screenWidth,
                                  height: 100,
                                  color: Colors.grey,
                                  child: Center(child: Text("Image not found")),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
