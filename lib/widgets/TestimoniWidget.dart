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

  @override
  void initState() {
    super.initState();
    futureTesti = fetchTesti();
  }

   Future<List<Testi>> fetchTesti() async {
    var box = await Hive.openBox('testiBox');

    // Cek apakah data sudah ada di cache Hive
    if (box.isNotEmpty) {
      List<String> imageNames = box.keys.cast<String>().toList();
      List<Testi> Testis = [];

      // Ambil data dari Hive
      for (var imageName in imageNames) {
        String? base64Image = box.get(imageName);
        if (base64Image != null) {
          Testis.add(Testi(
              gambar_testi:
                  'https://app.aag4u.co.id/api/getTesti/$imageName'));
        }
      }

      // Kembalikan data dari cache Hive
      print('Data loaded from cache');
      return Testis;
    }

    // Jika cache kosong, ambil data dari API dan simpan ke cache
    print('Fetching data from API');
    final response =
        await http.get(Uri.parse('https://app.aag4u.co.id/api/getTesti'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Testi> Testis =
          jsonResponse.map((data) => Testi.fromJson(data)).toList();

      // Simpan data di cache Hive
      for (var Testi in Testis) {
        String imageName = Testi.gambar_testi.split('/').last;
        String? base64Image = await fetchImageAsBase64(Testi.gambar_testi);
        if (base64Image != null) {
          await box.put(imageName, base64Image);
        }
      }

      // Kembalikan data yang baru diambil dari API
      return Testis;
    } else {
      throw Exception('Failed to load Banner posts');
    }
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

  // Future<List<Testi>> fetchTesti() async {
  //   var box = await Hive.openBox('testiBox');
  //   bool hasConnection = await InternetConnectionChecker().hasConnection;

  //   if (!hasConnection) {
  //     // Jika tidak ada koneksi internet, ambil data dari Hive
  //     List<String> imageNames = box.keys.cast<String>().toList();
  //     List<Testi> testis = [];

  //     for (var imageName in imageNames) {
  //       String? base64Image = box.get(imageName);
  //       if (base64Image != null) {
  //         // Anda bisa menambahkan logika untuk membangun objek Testi dari base64Image
  //         testis.add(Testi(
  //             gambar_testi:
  //                 'https://app.aag4u.co.id/public/image/testi/$imageName'));
  //       }
  //     }

  //     return testis;
  //   } else {
  //     // Jika ada koneksi internet, ambil data dari API dan simpan ke Hive
  //     try {
  //       final response =
  //           await http.get(Uri.parse('https://app.aag4u.co.id/api/getTesti'));

  //       if (response.statusCode == 200) {
  //         List jsonResponse = json.decode(response.body);
  //         List<Testi> testis =
  //             jsonResponse.map((data) => Testi.fromJson(data)).toList();

  //         // Menyimpan setiap gambar ke Hive
  //         for (var testi in testis) {
  //           String imageName = testi.gambar_testi.split('/').last;
  //           String? base64Image = await fetchImageAsBase64(testi.gambar_testi);
  //           if (base64Image != null) {
  //             await box.put(imageName, base64Image);
  //           }
  //         }

  //         return testis;
  //       } else {
  //         throw Exception('Failed to load Testi posts');
  //       }
  //     } catch (e) {
  //       print("Error fetching data: $e");
  //       // Jika terjadi kesalahan saat fetching dari API, ambil data dari Hive
  //       List<String> imageNames = box.keys.cast<String>().toList();
  //       List<Testi> testis = [];

  //       for (var imageName in imageNames) {
  //         String? base64Image = box.get(imageName);
  //         if (base64Image != null) {
  //           testis.add(Testi(
  //               gambar_testi:
  //                   'https://app.aag4u.co.id/public/image/testi/$imageName'));
  //         }
  //       }

  //       return testis;
  //     }
  //   }
  // }

  // Future<String?> fetchImageAsBase64(String imageUrl) async {
  //   try {
  //     final response = await http.get(Uri.parse(imageUrl));
  //     if (response.statusCode == 200) {
  //       return base64Encode(response.bodyBytes);
  //     }
  //   } catch (e) {
  //     print("Error fetching image: $e");
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    double screen = MediaQuery.of(context).size.width * 0.8;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: FutureBuilder<List<Testi>>(
          future: futureTesti,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              List<Testi> posts = snapshot.data!;
              return Row(
                children: posts.map((testi) {
                  var box = Hive.box('testiBox');
                  String imageName = testi.gambar_testi.split('/').last;
                  String? base64Image = box.get(imageName);

                  return Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: base64Image != null
                                ? Image.memory(
                                    base64Decode(base64Image),
                                    width: screen,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    width: screenWidth,
                                    height: 100,
                                    color: Colors.grey,
                                    child:
                                        Center(child: Text("Image not found")),
                                  ),
                            //  Image.network(
                            //   testi.gambar_testi,
                            //   width: screen,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ],
                      ));
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
