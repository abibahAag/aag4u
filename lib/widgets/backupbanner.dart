import 'dart:convert';

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
  late Future<List<Banner>> _banners;
  late Future<List<Map<String, dynamic>>> _hiveData;
  // Future<List<Testi>>? futureTesti;

  @override
  void initState() {
    super.initState();
    _banners = fetchTesti();
    fetchTesti();
    // futureTesti = fetchTesti();
  }

  // Future<List<Banner>> fetchBanner() async {
  //   var box = await Hive.openBox('bannerBox');

  //   // Cek status koneksi internet
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   bool isConnected = await InternetConnectionChecker().hasConnection;

  //   if (isConnected) {
  //     // Fetch data from API jika ada internet
  //     print('Fetching data from API');
  //     final response =
  //         await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

  //     if (response.statusCode == 200) {
  //       List jsonResponse = json.decode(response.body);
  //       List<Banner> banners =
  //           jsonResponse.map((data) => Banner.fromJson(data)).toList();

  //       // Periksa dan update Hive jika diperlukan
  //       for (var banner in banners) {
  //         String imageName = banner.gambar_banner.split('/').last;

  //         // Periksa apakah gambar sudah ada di Hive
  //         String? storedBase64Image = box.get(imageName);

  //         // Ambil gambar terbaru dari API sebagai base64
  //         String? newBase64Image =
  //             await fetchImageAsBase64(banner.gambar_banner);

  //         // Jika gambar dari API berbeda dengan di Hive, update Hive
  //         // if (newBase64Image != null && newBase64Image != storedBase64Image) {
  //         await box.put(imageName, newBase64Image);
  //         // }
  //       }

  //       // Mengambil semua data dari Hive setelah pembaruan
  //       List<Banner> updatedBanners = [];
  //       for (var key in box.keys) {
  //         String base64Image = box.get(key);
  //         String imageUrl = 'https://app.aag4u.co.id/public/image/banner/$key';

  //         // Membuat objek Banner dengan imageUrl
  //         updatedBanners.add(Banner(gambar_banner: imageUrl));
  //       }

  //       // Return daftar banner terbaru
  //       return updatedBanners.reversed.toList();
  //     } else {
  //       // Gagal mengambil data dari API: Ambil data dari Hive
  //       print('Error response: ${response.statusCode}');
  //     }
  //   }

  //   // Tidak ada internet: Ambil data dari Hive
  //   print('No internet, fetching data from Hive');
  //   List<Banner> banners = [];

  //   // Iterasi melalui Hive dan buat objek Banner
  //   for (var key in box.keys) {
  //     String base64Image = box.get(key);
  //     String imageUrl = 'https://app.aag4u.co.id/public/image/banner/$key';

  //     // Membuat objek Banner dengan imageUrl
  //     banners.add(Banner(gambar_banner: imageUrl));
  //   }

  //   // Return daftar banner dari Hive
  //   return banners.reversed.toList();
  // }

// Fungsi untuk mengambil gambar sebagai base64
  Future<String?> fetchImageAsBase64(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      // Mengonversi byte dari response body ke base64
      return base64Encode(response.bodyBytes);
    }
    return null;
  }

// // Fungsi untuk refresh data banner
//   Future<void> _refreshData() async {
//     await fetchBanner();
//     setState(() {});
//   }

// Fungsi untuk mengambil data dari Hive
  // Future<List<Banner>> _fetchHiveData() async {
  //   var box = await Hive.openBox('bannerBox');
  //   List<Map<String, dynamic>> hiveData = [];

  //   for (var key in box.keys) {
  //     String base64Image = box.get(key);
  //     hiveData.add({
  //       'imageName': key,
  //       'base64Image': base64Image,
  //     });
  //   }

  Future<List<Banner>> _fetchHiveData() async {
    var box = await Hive.openBox('bannerBox');
    List<Banner> banners = [];

    for (var key in box.keys) {
      // Get the base64 image stored in Hive
      String? base64Image = box.get(key);

      if (base64Image != null) {
        // Create Banner object with the base64 image
        banners.add(Banner(
          gambar_banner: base64Image, // Storing the base64 image string
          // Add any other fields necessary for the Banner object here
        ));
      }
    }

    // Return the list of Banner objects
    return banners;
  }

  // Future<List<Banner>> _fetchHiveData() async {
  //   var box = await Hive.openBox('bannerBox');
  //   List<Banner> bannerList = [];

  //   // Iterate through the Hive box and collect the stored data
  //   for (var key in box.keys) {
  //     String? base64Image = box.get(key);
  //     if (base64Image != null) {
  //       // Construct the Banner object with the stored image name
  //       bannerList.add({
  //         'imageName': key, // Key is the image name
  //         'base64Image': base64Image, // Base64 image data
  //       } as Banner);
  //     }
  //   }

  //   // Return the list of Banner objects
  //   return bannerList;
  // }

/////////////////////////////////////////////////

//   Future<List<Banner>> fetchTesti() async {
//     var box = await Hive.openBox('bannerBox');

//     box.toMap().forEach((key, value) {
//       print("data banner dalam hive box $key,$value.");
//     });

//     bool connected =  await InternetConnectionChecker().hasConnection;
// // ==============================================
//     if(connected){
//        final response =
//           await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

//            if (response.statusCode == 200) {
//             List jsonResponse = json.decode(response.body);
//             List<Banner> banner =
//           jsonResponse.map((data) => Banner.fromJson(data)).toList();

//           int hiveBlogCount = box.length;

//         // If the count differs, clear Hive box and store new data
//           if (banner.length != hiveBlogCount) {
//             //print('Blog count differs. Clearing Hive and saving new data.');
//             await box.clear();

//           for (var Testi in banner) {
//             String imageName = Testi.gambar_banner.split('/').last;
//             String? base64Image = await fetchImageAsBase64(Testi.gambar_banner);

//             if (base64Image != null) {
//               await box.put(imageName, base64Image);
//             }
//           }            //tampil _fetchHiveData
//           return await _fetchHiveData();

//           }else{
//             //tampil _fetchHiveData

//           }

//            }
//     }
//     //tampil _fetchHiveData

//     // ============================================================

//     // Cek apakah data sudah ada di cache Hive
//     if (box.isNotEmpty) {
//       List<String> imageNames = box.keys.cast<String>().toList();
//       List<Banner> Testis = [];

//       // Ambil data dari Hive
//       for (var imageName in imageNames) {
//         String? base64Image = box.get(imageName);
//         // if (base64Image != null) {
//         //   Testis.add(Banner(
//         //       gambar_banner:
//         //           'https://app.aag4u.co.id/public/image/banner/$imageName'));
//         // }
//       }

//       // Kembalikan data dari cache Hive
//       print('Data loaded from cache');
//       return Testis;
//     }

//     // Jika cache kosong, ambil data dari API dan simpan ke cache
//     print('Fetching data from API');
//     final response =
//         await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       List<Banner> Testis =
//           jsonResponse.map((data) => Banner.fromJson(data)).toList();

//       // Simpan data di cache Hive
//       for (var Testi in Testis) {
//         String imageName = Testi.gambar_banner.split('/').last;
//         String? base64Image = await fetchImageAsBase64(Testi.gambar_banner);

//         if (base64Image != null) {
//           await box.put(imageName, base64Image);
//         }
//       }
//       print("ini data banner ${Hive.box('bannerBox')}");

//       // Kembalikan data yang baru diambil dari API
//       return Testis;
//     } else {
//       throw Exception('Failed to load Banner posts');
//     }
//   }

  Future<List<Banner>> fetchTesti() async {
    var box = await Hive.openBox('bannerBox');
    int hiveBlogCount = box.length;

    // Show current data in Hive box
    box.toMap().forEach((key, value) {
      print("Data banner in Hive box: $key, $value.");
    });

    bool connected = await InternetConnectionChecker().hasConnection;

    if (connected) {
      // final response =
      //     await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

      String apiUrl =
          'https://app.aag4u.co.id/api/getBanner'; // Ganti dengan URL API Anda
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Banner> banner =
            jsonResponse.map((data) => Banner.fromJson(data)).toList();

        int bannerCount = banner.length;

        // If the count differs, clear Hive box and store new data
        if (hiveBlogCount != bannerCount) {
          await box.clear();

          for (var Testi in banner) {
            String imageName = Testi.gambar_banner.split('/').last;
            String? base64Image = await fetchImageAsBase64(Testi.gambar_banner);

            if (base64Image != null) {
              await box.put(imageName, base64Image);
            }
          }

          // Fetch updated data from Hive
          return await _fetchHiveData();
        }
        return await _fetchHiveData();
      }
      return await _fetchHiveData();
    } else {
      // If no internet, fetch data from Hive
      return await _fetchHiveData();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: FutureBuilder<List<Banner>>(
          future: _fetchHiveData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              List<Banner> posts = snapshot.data!;
              return Row(
                children: posts.map((testi) {
                  return Container(
                    width: screenWidth,
                    child: Column(
                      children: [
                        ClipRRect(
                          child: testi.gambar_banner != null
                              ? Image.memory(
                                  base64Decode(testi.gambar_banner),
                                  width: screenWidth,
                                  fit: BoxFit.cover,
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
