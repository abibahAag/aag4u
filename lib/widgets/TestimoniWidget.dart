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

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Testi {
  final String gambar_testi;

  Testi({required this.gambar_testi});

  factory Testi.fromJson(Map<String, dynamic> json) {
    String imageName = json['gambar_testi'].toString();
    String imageUrl = 'https://app.aag4u.co.id/public/image/testi/$imageName';
    return Testi(
      gambar_testi: imageUrl,
    );
  }
}

class Testimoniwidget extends StatefulWidget {
  const Testimoniwidget({super.key});

  @override
  State<Testimoniwidget> createState() => _TestimoniwidgetState();
}

class _TestimoniwidgetState extends State<Testimoniwidget> {
  Future<List<Testi>>? futureTesti;
  // Box box = Hive.box('testiBox');

  @override
  void initState() {
    super.initState();
    futureTesti = fetchTesti();
  }

  Future<List<Testi>> fetchTesti() async {
    var box = await Hive.openBox('testiBox');

    // Show current data from Hive immediately
    List<Testi> hiveData = await _fetchHiveTestiData();

    // Start updating Hive box in the background (if connected)
    _updateHiveDataInBackground(box);

    // Return data from Hive immediately, no loading state
    return hiveData;
  }

  Future<void> _updateHiveDataInBackground(Box box) async {
    bool connected = await InternetConnectionChecker().hasConnection;

    if (connected) {
      String apiUrl = 'https://app.aag4u.co.id/api/getTesti'; // API URL
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Testi> testis =
            jsonResponse.map((data) => Testi.fromJson(data)).toList();

        int testiCount = testis.length;
        int hiveTestiCount = box.length;

        // If count differs, update the Hive box with new data
        if (hiveTestiCount != testiCount) {
          await box.clear();

          for (var testi in testis) {
            String imageName = testi.gambar_testi.split('/').last;
            String? base64Image = await fetchImageAsBase64(testi.gambar_testi);

            if (base64Image != null) {
              await box.put(imageName, base64Image);
            }
          }
          print('Hive data updated in background testi');
        }
      }
    }
  }

  Future<List<Testi>> _fetchHiveTestiData() async {
    var box = await Hive.openBox('testiBox');
    List<Testi> testis = [];

    // Iterate over the keys in the Hive box
    for (var key in box.keys) {
      // Get the base64 image stored in Hive for each key
      String? base64Image = box.get(key);

      if (base64Image != null) {
        // Create Testi object using the base64 image
        testis.add(Testi(
          gambar_testi: base64Image, // Using the base64 image string
          // You can add other fields if necessary for the Testi object
        ));
      }
    }

    // Return the list of Testi objects
    return testis;
  }

// Fungsi untuk mengambil gambar sebagai base64
  Future<String?> fetchImageAsBase64(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      // Mengonversi byte dari response body ke base64
      return base64Encode(response.bodyBytes);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    double screen = MediaQuery.of(context).size.width * 0.8;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: FutureBuilder<List<Testi>>(
          future: fetchTesti(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              List<Testi> posts = snapshot.data!;
              return Row(
                children: posts.map((testi) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            // width: screenWidth,
                            // width: 320,
                            // height: 200,
                            // padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(24)),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: testi.gambar_testi != null
                                      ? Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  child: Image.memory(
                                                    base64Decode(
                                                        testi.gambar_testi),
                                                    width: screen,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Container(
                                          width: screenWidth,
                                          height: 100,
                                          color: Colors.grey,
                                          child: Center(
                                              child: Text("Image not found")),
                                        ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  );
                }).toList(),
              );
            } else {
              return Center(child: Text("No data available"));
            }
          },
        ),
      ),
    );
  }
}
