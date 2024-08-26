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

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

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
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  Future<List<Banner>>? futureBanner;

  @override
  void initState() {
    super.initState();
    futureBanner = fetchBanner();
  }

  Future<List<Banner>> fetchBanner() async {
    var box = await Hive.openBox('bannerBox');
    bool hasConnection = await InternetConnectionChecker().hasConnection;

    if (!hasConnection) {
      // Jika tidak ada koneksi internet, ambil data dari Hive
      List<String> imageNames = box.keys.cast<String>().toList();
      List<Banner> banners = [];

      for (var imageName in imageNames) {
        String? base64Image = box.get(imageName);
        if (base64Image != null) {
          // Anda bisa menambahkan logika untuk membangun objek Banner dari base64Image
          banners.add(Banner(
              gambar_banner:
                  'https://app.aag4u.co.id/public/image/banner/$imageName'));
          print('tidak ada internet');
        }
      }

      return banners;
    } else {
      // Jika ada koneksi internet, ambil data dari API dan simpan ke Hive
      final response =
          await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Banner> banners =
            jsonResponse.map((data) => Banner.fromJson(data)).toList();
      print("ada internet");
        // Menyimpan setiap gambar ke Hive
        for (var banner in banners) {
          String imageName = banner.gambar_banner.split('/').last;
          String? base64Image = await fetchImageAsBase64(banner.gambar_banner);
          if (base64Image != null) {
            await box.put(imageName, base64Image);

          }
        }

        return banners;
      } else {
        throw Exception('Failed to load Banner posts');
      }
    }
  }

  Future<String?> fetchImageAsBase64(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        return base64Encode(response.bodyBytes);
      }
    } catch (e) {
      print("Error fetching image: $e");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder<List<Banner>>(
        future: futureBanner,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildShimmer();
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<Banner> posts = snapshot.data!;

            return Row(
              children: posts.map((banner) {
                var box = Hive.box('bannerBox');
                String imageName = banner.gambar_banner.split('/').last;
                String? base64Image = box.get(imageName);

                return Card(
                  margin: EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      base64Image != null
                          ? Image.memory(
                              base64Decode(base64Image),
                              width: screenWidth,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: screenWidth,
                              height: 100,
                              color: Colors.grey,
                              child: Center(child: Text("Image not found")),
                            ),
                    ],
                  ),
                );
              }).toList(),
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 24,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 16,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

