// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/Menu_Promo/DetailPromo.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shimmer/shimmer.dart';

// class Banner {
//   final String id;

//   final String gambar_promo;

//   Banner({required this.gambar_promo, required this.id});

//   factory Banner.fromJson(Map<String, dynamic> json) {
//     String id = json['id'].toString();
//     String imageName = json['gambar_promo'].toString();
//     String imageUrl = 'https://app.aag4u.co.id/public/image/promo/$imageName';
//     return Banner(
//       id: json['id'],
//       gambar_promo: imageUrl.toString(),
//     );
//   }
// }

// class promoPage extends StatefulWidget {
//   const promoPage({super.key});

//   @override
//   State<promoPage> createState() => _promoPageState();
// }

// class _promoPageState extends State<promoPage> {
//   late Future<List<Map<String, dynamic>>> _hiveData;

//   @override
//   void initState() {
//     super.initState();
//     _hiveData = _fetchHiveData();
//   }

//   Future<List<Banner>> fetchBanner() async {
//     var box = await Hive.openBox('promoBox');
//     bool isConnected = await InternetConnectionChecker().hasConnection;

//     if (isConnected) {
//       // Fetch data from API if internet is available
//       print('Fetching data from API');
//       final response =
//           await http.get(Uri.parse('https://app.aag4u.co.id/api/getPromo'));

//       if (response.statusCode == 200) {
//         List jsonResponse = json.decode(response.body);
//         List<Banner> banners =
//             jsonResponse.map((data) => Banner.fromJson(data)).toList();

//         // Create a list for storing image names from API
//         List<String> apiImageNames = [];

//         // Clear the Hive box before updating
//         await box.clear();

//         // Iterate over banners to save them in Hive
//         for (var banner in banners) {
//           String imageName = banner.gambar_promo.split('/').last;
//           apiImageNames.add(imageName);

//           // Fetch new base64 image from API
//           String? newBase64Image =
//               await fetchImageAsBase64(banner.gambar_promo);

//           // Save the new image in Hive
//           if (newBase64Image != null) {
//             await box.put(imageName, newBase64Image);
//             print('Hive updated for $imageName');
//           }
//         }

//         // Return the latest banners in reverse order (newest on top)
//         return banners.reversed.toList();
//       } else {
//         throw Exception('Failed to fetch data from API');
//       }
//     } else {
//       // No internet: fetch data from Hive
//       print('No internet, fetching data from Hive');
//       List<Banner> banners = [];

//       // Iterate over the Hive box and reconstruct Banner objects
//       for (var key in box.keys) {
//         String base64Image = box.get(key);
//         String imageUrl =
//             'https://app.aag4u.co.id/public/image/promo/$key'; // Construct the image URL based on the image name

//         // Create a Banner object with imageUrl
//         banners.add(Banner(gambar_promo: imageUrl, id: "id"));
//       }

//       // Return data from Hive in reverse order (newest on top)
//       return banners.reversed.toList();
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
//     // Refresh data dengan mengambil data dari API dan mengupdate Hive
//     List<Banner> updatedData = await fetchBanner();

//     // Set state untuk memperbarui tampilan dengan data terbaru
//     setState(() {
//       _hiveData = _fetchHiveData();
//     });
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

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width * 0.9;

//     return Scaffold(
//       appBar: AppBar(
//         // leading: Container(
//         //   child: Column(
//         //     crossAxisAlignment: CrossAxisAlignment.center,
//         //     mainAxisAlignment: MainAxisAlignment.center,
//         //     children: [
//         //       Row(
//         //         // crossAxisAlignment: CrossAxisAlignment.start,
//         //         children: [
//         //           Container(
//         //             // color: Colors.amber,
//         //             width: 130,
//         //             height: 55,
//         //             child: Row(
//         //               children: [
//         //                 Column(
//         //                   // mainAxisAlignment: MainAxisAlignment.center,
//         //                   children: [
//         //                     Container(
//         //                       child: Image.asset(
//         //                         "images/icons/aagu.png",
//         //                         height: 55,
//         //                         width: 100,
//         //                       ),
//         //                     ),
//         //                   ],
//         //                 ),
//         //               ],
//         //             ),
//         //           ),
//         //         ],
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         // leadingWidth: 130,
//         judul: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               // color: Colors.blue,
//               child: Row(
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         child: Text(
//                           "Promo",
//                           style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF233d63),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () async {
//               // Saat tombol refresh ditekan, ambil data terbaru dari API
//               List<Banner> newData =
//                   await fetchBanner(); // Ambil data terbaru dari internet jika ada
//               setState(() {
//                 _hiveData =
//                     _fetchHiveData(); // Perbarui tampilan dengan data terbaru dari Hive
//               });
//             },
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: _hiveData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return buildShimmer(); // Menampilkan loading
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (!snapshot.hasData || (snapshot.data!.isEmpty)) {
//             return Text('No data available');
//           } else {
//             List<Map<String, dynamic>> hiveData = snapshot.data!;

//             return RefreshIndicator(
//               onRefresh: () async {
//                 // Refresh data dengan mengambil data dari API
//                 List<Banner> newData =
//                     await fetchBanner(); // Ambil data terbaru dari internet jika ada
//                 setState(() {
//                   _hiveData =
//                       _fetchHiveData(); // Perbarui tampilan dengan data terbaru dari Hive
//                 });
//               },
//               child: ListView.builder(
//                 itemCount: hiveData.length,
//                 itemBuilder: (context, index) {
//                   String base64Image = hiveData[index]['base64Image'];
//                   String title = hiveData[index]['title'];
//                   String deskripsi = hiveData[index]['description'];
//                   String mulai = hiveData[index]['startPromo'];
//                   String akhir = hiveData[index]['akhir'];

//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DetailPromo(
//                             title: title,
//                             description: description,
//                             startPromo: startPromo,
//                             akhir: akhir,
//                             base64Image: base64Image,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(24.0),
//                         child: base64Image.isNotEmpty
//                             ? Image.memory(
//                                 base64Decode(base64Image),
//                               )
//                             : Container(), // Placeholder if image is empty
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             );
//           }
//         },
//       ),

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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Promo/DetailPromo.dart';
import 'package:flutter_aag4u/pages/homepage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shimmer/shimmer.dart';

class Banner {
  final String id;
  final String gambar_promo;
  final String judul;
  final String deskripsi;
  final String mulai;
  final String akhir;

  Banner({
    required this.id,
    required this.gambar_promo,
    required this.judul,
    required this.deskripsi,
    required this.mulai,
    required this.akhir,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    String id = json['id'].toString();
    String imageName = json['gambar_promo'].toString();
    String imageUrl = 'https://app.aag4u.co.id/public/image/promo/$imageName';
    return Banner(
      id: id,
      gambar_promo: imageUrl,
      judul: json['judul'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      mulai: json['mulai'] ?? '',
      akhir: json['akhir'] ?? '',
    );
  }
}

class Menupromopage extends StatefulWidget {
  const Menupromopage({super.key});

  @override
  State<Menupromopage> createState() => _MenupromopageState();
}

class _MenupromopageState extends State<Menupromopage> {
  late Future<List<Banner>> _banners;

  @override
  void initState() {
    super.initState();
    _banners = fetchBanner();
  }

  Future<List<Banner>> fetchBanner() async {
    var box = await Hive.openBox('promoBox'); // Buka Box jika belum dibuka
    bool isConnected = await InternetConnectionChecker().hasConnection;

    if (!isConnected) {
      print("No internet, loading from Hive...");
      List<Banner> cachedBanners = box.keys.map((key) {
        var item = json.decode(box.get(key));
        return Banner(
          id: key,
          gambar_promo: item['gambar_promo'],
          judul: item['judul'],
          deskripsi: item['deskripsi'],
          mulai: item['mulai'],
          akhir: item['akhir'],
        );
      }).toList();

      if (cachedBanners.isNotEmpty) {
        return cachedBanners;
      } else {
        throw Exception("No internet and no cached data available");
      }
    }

    // Fetch data dari API jika ada koneksi internet
    try {
      final response =
          await http.get(Uri.parse('https://app.aag4u.co.id//apigetPromo'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Banner> banners =
            jsonResponse.map((data) => Banner.fromJson(data)).toList();

        await box.clear();
        for (var banner in banners) {
          await box.put(
            banner.id,
            json.encode({
              'gambar_promo': banner.gambar_promo,
              'judul': banner.judul,
              'deskripsi': banner.deskripsi,
              'mulai': banner.mulai,
              'akhir': banner.akhir,
            }),
          );
        }

        return banners.reversed.toList();
      } else {
        throw Exception("Failed to load data from API");
      }
    } catch (e) {
      print("Error fetching banners: $e");
      throw Exception("Error fetching data");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidthIcon = MediaQuery.of(context).size.width * 0.07;
    double screenWidthcart = MediaQuery.of(context).size.width * 0.09;
    double screenWidtAppBar = MediaQuery.of(context).size.width * 0.09;
    double screenHeightcart = MediaQuery.of(context).size.height * 0.01;
    double fontSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    final data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidtAppBar,
        // backgroundColor: Colors.amber,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: screenWidthIcon,
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
        title: Column(
          // width: 150,
          // height: 50,
          // color: Colors.amber,
          // padding: EdgeInsets.only(left: 50),
          mainAxisSize: MainAxisSize.max, // Hindari tinggi berlebih
          mainAxisAlignment:
              MainAxisAlignment.center, // Memastikan teks di atas
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Promo',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold))
          ],
        ),
        actions: [
          Container(
            width: screenWidthcart,
            // color: Colors.amber,
            child: Align(
              alignment: Alignment.topCenter, // Posisikan ikon ke atas
              child: IconButton(
                padding: EdgeInsets.only(bottom: 10),
                icon: Icon(
                  Icons.refresh,
                  size: screenWidthIcon,
                ),
                onPressed: () async {
                  setState(() {
                    _banners = fetchBanner();
                  });
                },
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Banner>>(
        future: _banners,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildShimmer();
          } else if (snapshot.hasError) {
            return nodata(); // Tampilkan gambar No Internet jika Hive kosong
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return nointernte(); // Sama, jika tidak ada data
          } else {
            List<Banner> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPromo(
                          id: posts[index].id,
                          judul: posts[index].judul,
                          deskripsi: posts[index].deskripsi,
                          mulai: posts[index].mulai,
                          akhir: posts[index].akhir,
                          gambar_promo: posts[index].gambar_promo,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(seconds: 1),
                        imageUrl: posts[index].gambar_promo,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.grey,
                          ),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.grey.shade300,
                          ),
                          child: Center(
                            child: Icon(Icons.broken_image,
                                size: 50, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget nointernte() {
    double fontSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidthcart = MediaQuery.of(context).size.width * 0.09;
    double screenWidthIcon = MediaQuery.of(context).size.width * 0.07;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assets/No_internet.png',
              width: screenWidth * 0.6,
              height: screenheight * 0.3,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Please check your internet connection and try again.',
              style: TextStyle(
                fontSize: fontSize * 1.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenWidthcart,
              // color: Colors.amber,
              child: Align(
                alignment: Alignment.topCenter, // Posisikan ikon ke atas
                child: IconButton(
                  padding: EdgeInsets.only(bottom: 10),
                  icon: Icon(
                    Icons.refresh,
                    size: screenWidthIcon,
                  ),
                  onPressed: () async {
                    setState(() {
                      _banners = fetchBanner();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget nodata() {
    double fontSize = MediaQuery.of(context).size.width * 0.04;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/assets/warning.png',
            width: screenWidth * 0.6,
            height: screenheight * 0.3,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            'Failed to load data. Please check your internet connection.',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildShimmer() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Container(
              height: screenheight * 0.3,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
