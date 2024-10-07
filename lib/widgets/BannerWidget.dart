// import 'dart:convert';
// import 'dart:ffi';
// import 'package:shimmer/shimmer.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:api_cache_manager/api_cache_manager.dart';
// import 'package:hive/hive.dart';

// class Banner {
//   // final String id;

//   final String gambar_banner;

//     Banner({  required this.gambar_banner});

//   factory Banner.fromJson(Map<String, dynamic> json) {
//      String id = json['id'].toString();
//      String imageName = json['gambar_banner'].toString();
//     String imageUrl = 'https://app.aag4u.co.id/public/image/banner/$imageName';
//     return Banner(
//       // id: json['id'],
//       gambar_banner: imageUrl.toString(),
//     );
//   }
// }

// class BannerWidget extends StatefulWidget {
//   const BannerWidget({super.key});
//   @override
//   State<BannerWidget> createState() => _BannerWidgetState();
// }

// class _BannerWidgetState extends State<BannerWidget> {

//   Future<List<Banner>>? futureBanner;

//   @override
//   void initState() {
//     super.initState();
//     futureBanner = fetchBanner();
//   }

//   // Future<List<Banner>> fetchBanner() async {
//   //   final response =
//   //       await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));
//   //   if (response.statusCode == 200) {
//   //     List jsonResponse = json.decode(response.body);
//   //     // print('aaaaaa ${jsonResponse}  ');
//   //     return jsonResponse.map((data) => Banner.fromJson(data)).toList();
//   //   } else {
//   //     throw Exception('Failed to load Banner posts');
//   //   }
//   // }

//   Future<List<Banner>> fetchBanner() async {
//     final response =
//         await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       List<Banner> banners =
//           jsonResponse.map((data) => Banner.fromJson(data)).toList();

//       // Membuka Hive box
//       var box = Hive.box('bannerBox');

//       // Menyimpan setiap gambar ke Hive menggunakan nama file sebagai kunci
//       for (var banner in banners) {
//         String imageName = banner.gambar_banner.split('/').last;
//         String? base64Image = await fetchImageAsBase64(banner.gambar_banner);
//         if (base64Image != null) {
//           await box.put(imageName, base64Image);
//         }
//       }

//       return banners;
//     } else {
//       throw Exception('Failed to load Banner posts');
//     }
//   }

// Future<String?> fetchImageAsBase64(String imageUrl) async {
//     try {
//       final response = await http.get(Uri.parse(imageUrl));
//       if (response.statusCode == 200) {
//         // Mengonversi bodyBytes menjadi string Base64
//         return base64Encode(response.bodyBytes);
//       }
//     } catch (e) {
//       print("Error fetching image: $e");
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//         double screenWidth = MediaQuery.of(context).size.width ;

//     return SingleChildScrollView(
//       // body: SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child:
//         FutureBuilder<List<Banner>>(
//       future: futureBanner,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return buildShimmer(); // Assuming buildShimmer() is your loading widget
//         } else if (snapshot.hasError) {
//           return Center(child: Text("${snapshot.error}"));
//         } else if (snapshot.hasData) {
//           List<Banner> posts = snapshot.data!;

//           return Row(
//             children: posts.map((banner) {
//               // Mengambil gambar dari Hive
//               var box = Hive.box('bannerBox');
//               String imageName = banner.gambar_banner.split('/').last;
//               String? base64Image = box.get(imageName);

//               return Card(
//                 margin: EdgeInsets.all(0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     base64Image != null
//                         ? Image.memory(
//                             base64Decode(base64Image),
//                             width: screenWidth,
//                             height: 100,
//                             fit: BoxFit.cover,
//                           )
//                         : Container(
//                             width: screenWidth,
//                             height: 100,
//                             color: Colors.grey,
//                             child: Center(child: Text("Image not found")),
//                           ),
//                   ],
//                 ),
//               );
//             }).toList(),
//           );
//         } else {
//           return Center(child: Text("No data available"));
//         }
//       },
//     ),
//       // Row(
//       //   // crossAxisAlignment: CrossAxisAlignment.center,
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       //     Container(
//       //       // color: Colors.amber,
//       //       height: 120,
//       //       // margin: EdgeInsets.only(
//       //       //     top: 5, bottom: 0, left: 20,right: 20 ),
//       //       // padding: EdgeInsets.symmetric(horizontal: 15),
//       //       child: Row(
//       //         children: [
//       //           Stack(
//       //             alignment: Alignment.topCenter,
//       //             children: [
//       //               Image.asset(
//       //                 "images/banner/bannerslide.png",
//       //                 // height: 150,
//       //                 // width: 100%,
//       //                 fit: BoxFit.contain,
//       //               ),
//       //             ],
//       //           ),
//       //         ],
//       //       ),
//       //     ),
//       //     SizedBox(
//       //       width: 25,
//       //     ),
//       //     Container(
//       //       height: 120,
//       //       // margin: EdgeInsets.only(top: 5, bottom: 0, left: 20, right: 20),
//       //       // padding: EdgeInsets.symmetric(horizontal: 15),
//       //       // height: 180,

//       //       child: Row(
//       //         children: [
//       //           Stack(
//       //             alignment: Alignment.topCenter,
//       //             children: [
//       //               Image.asset(
//       //                 "images/banner/benner3.png",
//       //                 // height: 150,
//       //                 // width: 370,
//       //                 fit: BoxFit.contain,
//       //               ),
//       //             ],
//       //           ),
//       //         ],
//       //       ),
//       //     ),
//       //     SizedBox(
//       //       width: 25,
//       //     ),
//       //     Container(
//       //       height: 120,
//       //       // margin: EdgeInsets.only(top: 5, bottom: 0, left: 20, right: 20),
//       //       // padding: EdgeInsets.symmetric(horizontal: 15),
//       //       // height: 180,

//       //       child: Row(
//       //         children: [
//       //           Stack(
//       //             alignment: Alignment.topCenter,
//       //             children: [
//       //               Image.asset(
//       //                 "images/banner/benner2.png",
//       //                 // height: 150,
//       //                 // width: 370,
//       //                 fit: BoxFit.contain,
//       //               ),
//       //             ],
//       //           ),
//       //         ],
//       //       ),
//       //     ),
//       //   ],
//       // ),
//     );
//   }

//   Widget buildShimmer() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Shimmer.fromColors(
//             baseColor: Colors.grey[300]!,
//             highlightColor: Colors.grey[100]!,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 200,
//               color: Colors.white,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 height: 24,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 height: 16,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 height: 16,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// }

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;
// import 'package:shimmer/shimmer.dart';

// class Banner {
//   final String gambar_banner;

//   Banner({required this.gambar_banner});

//   factory Banner.fromJson(Map<String, dynamic> json) {
//     String imageName = json['gambar_banner'].toString();
//     String imageUrl = 'https://app.aag4u.co.id/public/image/banner/$imageName';
//     return Banner(
//       gambar_banner: imageUrl,
//     );
//   }
// }

// class BannerWidget extends StatefulWidget {
//   const BannerWidget({super.key});

//   @override
//   State<BannerWidget> createState() => _BannerWidgetState();
// }

// class _BannerWidgetState extends State<BannerWidget> {
//   Future<List<Banner>>? futureBanner;

//   @override
//   void initState() {
//     super.initState();
//     futureBanner = fetchBanner();
//   }

//  Future<List<Banner>> fetchBanner() async {
//     var box = await Hive.openBox('bannerBox');

//     // Always fetch data from API and update the cache
//     print('Fetching data from API');
//     final response =
//         await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       List<Banner> banners =
//           jsonResponse.map((data) => Banner.fromJson(data)).toList();

//       // Clear existing data in Hive before updating
//       await box.clear();

//       // Simpan data di cache Hive
//       for (var banner in banners) {
//         String imageName = banner.gambar_banner.split('/').last;
//         String? base64Image = await fetchImageAsBase64(banner.gambar_banner);
//         if (base64Image != null) {
//           await box.put(imageName, base64Image);
//         }
//       }

//     // Kembalikan data yang baru diambil dari API dengan urutan terbaru di atas
//     return banners.reversed.toList();
//   } else {
//     throw Exception('Failed to load Promo posts');
//   }
//   }

// // Fungsi untuk mengambil gambar sebagai base64
//   Future<String?> fetchImageAsBase64(String imageUrl) async {
//     final response = await http.get(Uri.parse(imageUrl));
//     if (response.statusCode == 200) {
//       // Mengonversi byte dari response body ke base64
//       return base64Encode(response.bodyBytes);
//     }
//     return null;
//   }

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart'; // Gunakan untuk cek koneksi
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shimmer/shimmer.dart';

class Banner {
  final String gambar_banner;

  Banner({required this.gambar_banner});

  factory Banner.fromJson(Map<String, dynamic> json) {
    String imageName = json['gambar_banner'].toString();
    String imageUrl = 'https://app.aag4u.co.id/public/image/banner/$imageName';
    return Banner(
      gambar_banner: imageUrl,
    );
  }
}

class BannerWidget extends StatefulWidget {
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  // late Future<List<Banner>> _banners;
  late Future<List<Map<String, dynamic>>> _hiveData;

  @override
  void initState() {
    super.initState();
    _hiveData = _fetchHiveData();
  }

  Future<List<Banner>> fetchBanner() async {
    var box = await Hive.openBox('bannerBox');

    // Cek status koneksi internet
    var connectivityResult = await Connectivity().checkConnectivity();
    bool isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      // Fetch data from API jika ada internet
      print('Fetching data from API');
      final response =
          await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Banner> banners =
            jsonResponse.map((data) => Banner.fromJson(data)).toList();

        // Periksa dan update Hive jika diperlukan
        for (var banner in banners) {
          String imageName = banner.gambar_banner.split('/').last;

          // Periksa apakah gambar sudah ada di Hive
          String? storedBase64Image = box.get(imageName);

          // Ambil gambar terbaru dari API sebagai base64
          String? newBase64Image =
              await fetchImageAsBase64(banner.gambar_banner);

          // Jika gambar dari API berbeda dengan di Hive, update Hive
          if (newBase64Image != null && newBase64Image != storedBase64Image) {
            await box.put(imageName, newBase64Image);
          }
        }

        // Mengambil semua data dari Hive setelah pembaruan
        List<Banner> updatedBanners = [];
        for (var key in box.keys) {
          String base64Image = box.get(key);
          String imageUrl = 'https://app.aag4u.co.id/public/image/banner/$key';

          // Membuat objek Banner dengan imageUrl
          updatedBanners.add(Banner(gambar_banner: imageUrl));
        }

        // Return daftar banner terbaru
        return updatedBanners.reversed.toList();
      } else {
        // Gagal mengambil data dari API: Ambil data dari Hive
        print('Error response: ${response.statusCode}');
      }
    }

    // Tidak ada internet: Ambil data dari Hive
    print('No internet, fetching data from Hive');
    List<Banner> banners = [];

    // Iterasi melalui Hive dan buat objek Banner
    for (var key in box.keys) {
      String base64Image = box.get(key);
      String imageUrl = 'https://app.aag4u.co.id/public/image/banner/$key';

      // Membuat objek Banner dengan imageUrl
      banners.add(Banner(gambar_banner: imageUrl));
    }

    // Return daftar banner dari Hive
    return banners.reversed.toList();
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

// Fungsi untuk refresh data banner
  Future<void> _refreshData() async {
    await fetchBanner();
    setState(() {});
  }

// Fungsi untuk mengambil data dari Hive
  Future<List<Map<String, dynamic>>> _fetchHiveData() async {
    var box = await Hive.openBox('bannerBox');
    List<Map<String, dynamic>> hiveData = [];

    for (var key in box.keys) {
      String base64Image = box.get(key);
      hiveData.add({
        'imageName': key,
        'base64Image': base64Image,
      });
    }

    // Membalik urutan data dari Hive agar gambar terbaru ada di atas
    return hiveData.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _hiveData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildShimmer(); // Menampilkan loading
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available');
        } else {
          List<Map<String, dynamic>> hiveData = snapshot.data!;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Mengatur scroll horizontal
            child: Row(
              children: List.generate(hiveData.length, (index) {
                String base64Image = hiveData[index]['base64Image'];

                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      base64Image.isNotEmpty
                          ? Image.memory(
                              base64Decode(base64Image),
                              width: screenWidth,
                              // height: 100,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: 300,
                              height: 200,
                              color: Colors.grey[300],
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Tidak ada banner yang tersedia",
                                                    style: TextStyle(
                                                      fontSize: 20,
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
                            ),
                    ],
                  ),
                );
              }),
            ),
          );
        }
      },
    );
  }

  Widget buildShimmer() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
