import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shimmer/shimmer.dart';

class Banner {
  // final String id;

  final String gambar_banner;

  Banner({required this.gambar_banner});

  factory Banner.fromJson(Map<String, dynamic> json) {
    String id = json['id'].toString();
    String imageName = json['gambar_banner'].toString();
    String imageUrl = 'https://app.aag4u.co.id/public/image/banner/$imageName';
    return Banner(
      // id: json['id'],
      gambar_banner: imageUrl.toString(),
    );
  }
}

class promoPage extends StatefulWidget {
  const promoPage({super.key});

  @override
  State<promoPage> createState() => _promoPageState();
}

class _promoPageState extends State<promoPage> {
//   Future<List<Promo>>? futurePromo;
//   bool isConnected = true;

//   List<String> items = List.generate(10, (index) => "Item ${index + 1}");

//   @override
//   void initState() {
//     super.initState();
//     futurePromo = fetchPromo();
//   }

//   Future<List<Promo>> fetchPromo() async {
//     var box = await Hive.openBox('promoBox');

//     // Always fetch data from API and update the cache
//     print('Fetching data from API');
//     final response =
//         await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       List<Promo> promos =
//           jsonResponse.map((data) => Promo.fromJson(data)).toList();

//       // Clear existing data in Hive before updating
//       await box.clear();

//       // Simpan data di cache Hive
//       for (var promo in promos) {
//         String imageName = promo.gambar_banner.split('/').last;
//         String? base64Image = await fetchImageAsBase64(promo.gambar_banner);
//         if (base64Image != null) {
//           await box.put(imageName, base64Image);
//         }
//       }

//       // Kembalikan data yang baru diambil dari API dengan urutan terbaru di atas
//       return promos.reversed.toList();
//     } else {
//       throw Exception('Failed to load Promo posts');
//     }
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

//   Future<void> _refreshData() async {
//     await fetchPromo();
//     setState(() {});
//   }

///////////////
// late Future<List<Map<String, dynamic>>> _hiveData;

//   @override
//   void initState() {
//     super.initState();
//     _hiveData = _fetchHiveData();
//   }

//   Future<List<Promo>> fetchPromo() async {
//     var box = await Hive.openBox('promoBox');

//     // Cek status koneksi internet
//     var connectivityResult = await Connectivity().checkConnectivity();
//     bool isConnected = await InternetConnectionChecker().hasConnection;

//     if (isConnected) {
//       // Fetch data from API if internet is available
//       print('Fetching data from API');
//       final response =
//           await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

//       if (response.statusCode == 200) {
//         List jsonResponse = json.decode(response.body);
//         List<Promo> promos =
//             jsonResponse.map((data) => Promo.fromJson(data)).toList();

//         // Iterate over banners to check and update if necessary
//         for (var promo in promos) {
//           String imageName = promo.gambar_banner.split('/').last;

//           // Periksa apakah gambar sudah ada di Hive
//           String? storedBase64Image = box.get(imageName);

//           // Ambil gambar terbaru sebagai base64 dari API
//           String? newBase64Image =
//               await fetchImageAsBase64(promo.gambar_banner);

//           // Jika gambar dari API tidak sama dengan yang ada di Hive, atau hilang, perbarui Hive
//           if (newBase64Image != null && newBase64Image != storedBase64Image) {
//             await box.put(imageName, newBase64Image);
//           }

//           // Mengambil semua data dari Hive setelah pembaruan
//           List<Promo> updatedPromo = [];
//           for (var key in box.keys) {
//             String base64Image = box.get(key);
//             String imageUrl =
//                 'https://app.aag4u.co.id/public/image/banner/$key'; // Construct the image URL based on the image name

//             // Create a Banner object with imageUrl
//             updatedPromo.add(Promo(gambar_banner: imageUrl));
//           }
//         }

//         // Return the latest banners in reverse order (newest on top)
//         return promos.reversed.toList();
//       } else {
//         // No internet: fetch data from Hive
//         List<Promo> promos = [];

//         // Iterate over the Hive box and reconstruct Banner objects
//         for (var key in box.keys) {
//           String base64Image = box.get(key);
//           String imageUrl =
//               'https://app.aag4u.co.id/public/image/banner/$key'; // Construct the image URL based on the image name

//           // Create a Banner object with imageUrl, assuming other fields are unavailable
//           promos.add(Promo(gambar_banner: imageUrl));
//         }

//         // Return data from Hive in reverse order (newest on top)
//         return promos.reversed.toList();
//       }
//     } else {
//       // No internet: fetch data from Hive
//       print('No internet, fetching data from Hive');
//       List<Promo> promos = [];

//       // Iterate over the Hive box and reconstruct Banner objects
//       for (var key in box.keys) {
//         String base64Image = box.get(key);
//         String imageUrl =
//             'https://app.aag4u.co.id/public/image/banner/$key'; // Construct the image URL based on the image name

//         // Create a Banner object with imageUrl, assuming other fields are unavailable
//         promos.add(Promo(gambar_banner: imageUrl));
//       }

//       // Return data from Hive in reverse order (newest on top)
//       return promos.reversed.toList();
//     }
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

//   Future<void> _refreshData() async {
//     await fetchPromo();
//     setState(() {});
//   }

//   Future<List<Map<String, dynamic>>> _fetchHiveData() async {
//     var box = await Hive.openBox('promoBox');
//     List<Map<String, dynamic>> hiveData = [];

//     for (var key in box.keys) {
//       String base64Image = box.get(key);
//       hiveData.add({
//         'imageName': key,
//         'base64Image': base64Image,
//       });
//     }

//     // Membalik urutan data dari Hive agar yang terbaru ada di atas
//     return hiveData.reversed.toList();
//   }

  late Future<List<Map<String, dynamic>>> _hiveData;

  @override
  void initState() {
    super.initState();
    _hiveData = _fetchHiveData();
  }

  Future<List<Banner>> fetchBanner() async {
    var box = await Hive.openBox('bannerBox');
    bool isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      // Fetch data from API if internet is available
      print('Fetching data from API');
      final response =
          await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Banner> banners =
            jsonResponse.map((data) => Banner.fromJson(data)).toList();

        // Buat list untuk menyimpan image names dari API
        List<String> apiImageNames = [];

        // Iterate over banners to check and update if necessary
        for (var banner in banners) {
          String imageName = banner.gambar_banner.split('/').last;
          apiImageNames.add(imageName);

          // Periksa apakah gambar sudah ada di Hive
          String? storedBase64Image = box.get(imageName);

          // Ambil gambar terbaru sebagai base64 dari API
          String? newBase64Image =
              await fetchImageAsBase64(banner.gambar_banner);

          // Jika gambar dari API tidak sama dengan yang ada di Hive, atau hilang, perbarui Hive
          if (newBase64Image != null && newBase64Image != storedBase64Image) {
            await box.put(imageName, newBase64Image);
            print('Hive updated for $imageName');
          }
        }

        // Hapus data di Hive yang tidak ada di API
        List<String> hiveKeys = box.keys.cast<String>().toList();
        for (String hiveKey in hiveKeys) {
          if (!apiImageNames.contains(hiveKey)) {
            await box.delete(hiveKey);
            print('Removed $hiveKey from Hive');
          }
        }

        // Mengambil semua data dari Hive setelah pembaruan
        List<Banner> updatedBanners = [];
        for (var key in box.keys) {
          String base64Image = box.get(key);
          String imageUrl =
              'https://app.aag4u.co.id/public/image/banner/$key'; // Construct the image URL based on the image name

          // Create a Banner object with imageUrl
          updatedBanners.add(Banner(gambar_banner: imageUrl));
        }

        // Return the latest banners in reverse order (newest on top)
        return updatedBanners.reversed.toList();
      } else {
        throw Exception('Failed to fetch data from API');
      }
    } else {
      // No internet: fetch data from Hive
      print('No internet, fetching data from Hive');
      List<Banner> banners = [];

      // Iterate over the Hive box and reconstruct Banner objects
      for (var key in box.keys) {
        String base64Image = box.get(key);
        String imageUrl =
            'https://app.aag4u.co.id/public/image/banner/$key'; // Construct the image URL based on the image name

        // Create a Banner object with imageUrl
        banners.add(Banner(gambar_banner: imageUrl));
      }

      // Return data from Hive in reverse order (newest on top)
      return banners.reversed.toList();
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

  Future<void> _refreshData() async {
    // Refresh data dengan mengambil data dari API dan mengupdate Hive
    List<Banner> updatedData = await fetchBanner();

    // Set state untuk memperbarui tampilan dengan data terbaru
    setState(() {
      _hiveData = _fetchHiveData();
    });
  }

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

    // Membalik urutan data dari Hive agar yang terbaru ada di atas
    return hiveData.reversed.toList();
  }

  // @override
  // Widget build(BuildContext context) {
  //   double screenWidth = MediaQuery.of(context).size.width * 0.9;

  //   return Scaffold(
  //     appBar: Navbar(),
  //     body: RefreshIndicator(
  //       onRefresh: _refreshData,
  //       child: SingleChildScrollView(
  //         scrollDirection: Axis.vertical,
  //         child: Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 0, vertical: 10.0),
  //                   child: Column(
  //                     children: [
  //                       Container(
  //                         width: screenWidth,
  //                         height: 50,
  //                         alignment: Alignment.center,
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(24),
  //                         ),
  //                         child: Column(
  //                           // mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             Row(
  //                               // mainAxisAlignment: MainAxisAlignment.center,
  //                               children: [
  //                                 Text(
  //                                   "Promo",
  //                                   style: TextStyle(
  //                                     fontSize: 35,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: Color(0xFF233d63),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Column(
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Container(

  //                       child: Column(
  //                         children: [
  //                           FutureBuilder<List<Map<String, dynamic>>>(
  //                             future: _hiveData,
  //                             builder: (context, snapshot) {
  //                               if (snapshot.connectionState ==
  //                                   ConnectionState.waiting) {
  //                                 return buildShimmer(); // Menampilkan loading
  //                               } else if (snapshot.hasError) {
  //                                 return Text('Error: ${snapshot.error}');
  //                               } else if (!snapshot.hasData ||
  //                                   (snapshot.data!.isEmpty)) {
  //                                 return Text('No data available');
  //                               } else {
  //                                 List<Map<String, dynamic>> hiveData =
  //                                     snapshot.data!;

  //                                 return RefreshIndicator(
  //                                   onRefresh: () async {
  //                                     // Refresh data dengan mengambil data dari API
  //                                     List<Banner> newData =
  //                                         await fetchBanner(); // Ambil data terbaru dari internet jika ada
  //                                     setState(() {
  //                                       _hiveData =
  //                                           _fetchHiveData(); // Perbarui tampilan dengan data terbaru dari Hive
  //                                     });
  //                                   },
  //                                   child: ListView.builder(
  //                                     itemCount: hiveData.length,
  //                                     itemBuilder: (context, index) {
  //                                       String base64Image =
  //                                           hiveData[index]['base64Image'];

  //                                       return Card(
  //                                         child: Column(
  //                                           children: [
  //                                             base64Image.isNotEmpty
  //                                                 ? Image.memory(base64Decode(
  //                                                     base64Image)) // Menampilkan gambar dari base64
  //                                                 : Container(), // Jika gambar kosong
  //                                           ],
  //                                         ),
  //                                       );
  //                                     },
  //                                   ),
  //                                 );
  //                               }
  //                             },
  //                           ),
  //                         ],
  //                       ),

  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: AppBar(
        // leading: Container(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Row(
        //         // crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Container(
        //             // color: Colors.amber,
        //             width: 130,
        //             height: 55,
        //             child: Row(
        //               children: [
        //                 Column(
        //                   // mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Container(
        //                       child: Image.asset(
        //                         "images/icons/aagu.png",
        //                         height: 55,
        //                         width: 100,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // leadingWidth: 130,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.blue,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Promo",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF233d63),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              // Saat tombol refresh ditekan, ambil data terbaru dari API
              List<Banner> newData =
                  await fetchBanner(); // Ambil data terbaru dari internet jika ada
              setState(() {
                _hiveData =
                    _fetchHiveData(); // Perbarui tampilan dengan data terbaru dari Hive
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _hiveData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildShimmer(); // Menampilkan loading
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || (snapshot.data!.isEmpty)) {
            return Text('No data available');
          } else {
            List<Map<String, dynamic>> hiveData = snapshot.data!;

            return RefreshIndicator(
              onRefresh: () async {
                // Refresh data dengan mengambil data dari API
                List<Banner> newData =
                    await fetchBanner(); // Ambil data terbaru dari internet jika ada
                setState(() {
                  _hiveData =
                      _fetchHiveData(); // Perbarui tampilan dengan data terbaru dari Hive
                });
              },
              child: ListView.builder(
                itemCount: hiveData.length,
                itemBuilder: (context, index) {
                  String base64Image = hiveData[index]['base64Image'];

                  return Card(
                    child: Column(
                      children: [
                        base64Image.isNotEmpty
                            ? Image.memory(base64Decode(
                                base64Image)) // Menampilkan gambar dari base64
                            : Container(), // Jika gambar kosong
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),

      //     FutureBuilder<List<Map<String, dynamic>>>(
      //   future: _hiveData,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return buildShimmer(); // Menampilkan loading
      //     } else if (snapshot.hasError) {
      //       return Text('Error: ${snapshot.error}');
      //     } else if (!snapshot.hasData || (snapshot.data!.isEmpty)) {
      //       return Text('No data available');
      //     } else {
      //       List<Map<String, dynamic>> hiveData = snapshot.data!;
      //       return RefreshIndicator(
      //         onRefresh: () async {
      //           // Refresh data dengan mengambil data dari API
      //           List<Banner> newData =
      //               await fetchBanner(); // Ambil data terbaru dari internet jika ada
      //           setState(() {
      //             _hiveData =
      //                 _fetchHiveData(); // Perbarui tampilan dengan data terbaru dari Hive
      //           });
      //         },
      //         child: ListView.builder(
      //           itemCount: hiveData.length,
      //           itemBuilder: (context, index) {
      //             String base64Image = hiveData[index]['base64Image'];

      //             return Card(
      //               child: Column(
      //                 children: [
      //                   base64Image.isNotEmpty
      //                       ? Image.memory(base64Decode(
      //                           base64Image)) // Menampilkan gambar dari base64
      //                       : Container(), // Jika gambar kosong
      //                 ],
      //               ),
      //             );
      //           },
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   double screenWidth = MediaQuery.of(context).size.width * 0.9;

  //   return SingleChildScrollView(
  //     scrollDirection: Axis.vertical,
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.symmetric(
  //                   horizontal: 12.0, vertical: 15.0),
  //               child: Column(
  //                 children: [
  //                   Container(
  //                     width: screenWidth,
  //                     height: 50,
  //                     alignment: Alignment.center,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(24),
  //                     ),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             Text(
  //                               "Promo",
  //                               style: TextStyle(
  //                                 fontSize: 35,
  //                                 fontWeight: FontWeight.bold,
  //                                 color: Color(0xFF233d63),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),

  //       ],
  //     ),
  //   );
  // }

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
