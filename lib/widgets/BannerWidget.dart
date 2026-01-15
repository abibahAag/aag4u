// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;

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

//  factory Banner.fromMap(Map<String, dynamic> map) {
//     return Banner(
//       gambar_banner: map['gambar_banner'] ?? '', // Set as empty string if null
//     );
//   }
// }

// class BannerWidget extends StatefulWidget {
//   @override
//   _BannerWidgetState createState() => _BannerWidgetState();
// }

// class _BannerWidgetState extends State<BannerWidget> {
// //   late Future<List<Banner>> _banners;
// //   late Future<List<Map<String, dynamic>>> _hiveData;
// //   // Future<List<Testi>>? futureTesti;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _banners = fetchTesti();
// //     fetchTesti();
// //     // futureTesti = fetchTesti();
// //   }

// // // Fungsi untuk mengambil gambar sebagai base64
// //   Future<String?> fetchImageAsBase64(String imageUrl) async {
// //     final response = await http.get(Uri.parse(imageUrl));
// //     if (response.statusCode == 200) {
// //       // Mengonversi byte dari response body ke base64
// //       return base64Encode(response.bodyBytes);
// //     }
// //     return null;
// //   }

// //   Future<List<Banner>> _fetchHiveData() async {
// //     var box = await Hive.openBox('bannerBox');
// //     List<Banner> banners = [];

// //     for (var key in box.keys) {
// //       // Get the base64 image stored in Hive
// //       String? base64Image = box.get(key);

// //       if (base64Image != null) {
// //         // Create Banner object with the base64 image
// //         banners.add(Banner(
// //           gambar_banner: base64Image, // Storing the base64 image string
// //           // Add any other fields necessary for the Banner object here
// //         ));
// //       }
// //     }

// //     // Return the list of Banner objects
// //     return banners.reversed.toList();
// //   }

// //   Future<List<Banner>> fetchTesti() async {
// //     var box = await Hive.openBox('bannerBox');

// //     // Show current data from Hive immediately
// //     List<Banner> hiveData = await _fetchHiveData();

// //     // Start updating Hive box in the background (if connected)
// //     _updateHiveDataInBackground(box);

// //     // Return data from Hive immediately, no loading state
// //     return hiveData;
// //   }

// //   Future<void> _updateHiveDataInBackground(Box box) async {
// //     bool connected = await InternetConnectionChecker().hasConnection;

// //     if (connected) {
// //       String apiUrl = 'https://app.aag4u.co.id/api/getBanner'; // API URL
// //       var response = await http.get(Uri.parse(apiUrl));

// //       if (response.statusCode == 200) {
// //         List jsonResponse = json.decode(response.body);
// //         List<Banner> banners =
// //             jsonResponse.map((data) => Banner.fromJson(data)).toList();

// //         int bannerCount = banners.length;
// //         int hiveBannerCount = box.length;

// //         // If count differs, update the Hive box with new data
// //         if (hiveBannerCount != bannerCount) {
// //           await box.clear();

// //           for (var banner in banners) {
// //             String imageName = banner.gambar_banner.split('/').last;
// //             String? base64Image =
// //                 await fetchImageAsBase64(banner.gambar_banner);

// //             if (base64Image != null) {
// //               await box.put(imageName, base64Image);
// //             }
// //           }
// //           print('Hive data updated in background banner');
// //         }
// //       }
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;

// //     return SingleChildScrollView(
// //       scrollDirection: Axis.horizontal,
// //       child: Padding(
// //         padding: const EdgeInsets.only(left: 0, right: 0),
// //         child: FutureBuilder<List<Banner>>(
// //           future: _banners,
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return Center(child: CircularProgressIndicator());
// //             } else if (snapshot.hasError) {
// //               return Center(child: Text("${snapshot.error}"));
// //             } else if (snapshot.hasData) {
// //               List<Banner> posts = snapshot.data!;
// //               return Row(
// //                 children: posts.map((testi) {
// //                   return Container(
// //                     width: screenWidth,
// //                     child: Column(
// //                       children: [
// //                         ClipRRect(
// //                           child: testi.gambar_banner != null
// //                               ? Image.memory(
// //                                   base64Decode(testi.gambar_banner),
// //                                   width: screenWidth,
// //                                   fit: BoxFit.cover,
// //                                 )
// //                               : Container(
// //                                   width: screenWidth,
// //                                   height: 100,
// //                                   color: Colors.grey,
// //                                   child: Center(child: Text("Image not found")),
// //                                 ),
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 }).toList(),
// //               );
// //             } else {
// //               return Center(child: Text("No data available"));
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
//   List<Map<String, dynamic>> _imageUrls = [];
//   @override
//   void initState() {
//     super.initState();
//     _loadData(); // Memulai proses mengambil data dari Hive dan API
//   }

//   Future<List<Banner>> _fetchImageDataFromApi() async {
//     try {
//       final response =
//           await http.get(Uri.parse('https://app.aag4u.co.id/api/getPostLimit'));
//       if (response.statusCode == 200) {
//         List jsonData = json.decode(response.body);
//         // Asumsikan API mengembalikan list objek JSON
//         return jsonData.map((item) => Banner.fromMap(item)).toList();
//       } else {
//         throw Exception('Failed to load image data from API');
//       }
//     } catch (error) {
//       throw Exception('Error fetching data from API: $error');
//     }
//   }

//   Future<void> _loadData() async {
//     var hiveBox = await Hive.openBox('bannerBox');

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
//       List<Banner> apiImageData = await _fetchImageDataFromApi();

//       if (!listEquals(apiImageData, loadedData)) {
//         // Jika data dari API berbeda dengan data di Hive, perbarui Hive dan UI
//         await hiveBox
//             .clear(); // Menghapus semua data di Hive sebelum memperbarui
//         for (var imageData in apiImageData) {
//           // await hiveBox.add(imageData.toMap()); // Simpan data sebagai Map
//           String imageUrl = imageData.gambar_banner; // Sesuaikan dengan struktur datamu
//           var response = await http.get(Uri.parse(imageUrl));

//           Uint8List imageBytes = response.bodyBytes; // Konversi ke byte array
//           String base64Image = base64Encode(imageBytes); // Konversi ke Base64

//           Map<String, dynamic> dataToStore = {
//             'imageBase64': base64Image, // Simpan gambar sebagai Base64 string
//           };
//           await hiveBox.add(dataToStore);

//           List<Map<String, dynamic>> loadedData = [];
//           for (int i = 0; i < hiveBox.length; i++) {
//             Map<String, dynamic> item =
//                 Map<String, dynamic>.from(hiveBox.getAt(i));
//             loadedData.add(item);
//           }

//           // var lol = imageData.toMap();
//           // print('ini wwwwwwwwwwwww $dataToStore');

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
//                     child: Container(

//                       items: _imageUrls.map((imageData) {
//                         // Check if 'imageBase64' is not null
//                         String? base64Image = imageData['imageBase64'];

//                         // If base64Image is null, return a placeholder widget or handle the error
//                         if (base64Image == null) {
//                           return Center(child: Text('Image not available'));
//                         }

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
//                                       photo:
//                                           decodedBytes, // Kirim Uint8List hasil decode
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

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;

// //     return _imageUrls.isEmpty
// //         ? Center(child: CircularProgressIndicator())
// //         : SingleChildScrollView(
// //             scrollDirection: Axis.horizontal,
// //             child: Row(
// //               children: _imageUrls.map((item) {
// //                 // Check if gambar_banner is null or empty
// //                 final String? base64String = item['gambar_banner'];
// //                 if (base64String == null || base64String.isEmpty) {
// //                   return Container(
// //                     width: screenWidth * 0.9,
// //                     margin: EdgeInsets.symmetric(horizontal: 10),
// //                     child: ClipRRect(
// //                         borderRadius: BorderRadius.circular(10),
// //                         child: Container(
// //                           color: Colors.grey,
// //                           height: 100,
// //                           width: 100,
// //                         )),
// //                   );
// //                 }

// //                 // Proceed with decoding and displaying the image
// //                 return Container(
// //                   width: screenWidth * 0.9,
// //                   margin: EdgeInsets.symmetric(horizontal: 10),
// //                   child: ClipRRect(
// //                     borderRadius: BorderRadius.circular(10),
// //                     child: Image.memory(
// //                       base64Decode(base64String), // Load base64 image
// //                       width: screenWidth * 0.9,
// //                       height: 200,
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 );
// //               }).toList(),
// //             ),
// //           );
// //   }
// // }
// }

import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class Banner {
  final String gambar_banner;

  Banner({
    required this.gambar_banner,
  });

  Map<String, dynamic> toMap() {
    return {
      'gambar_banner': gambar_banner,
    };
  }

  factory Banner.fromMap(Map<String, dynamic> map) {
    return Banner(
      gambar_banner: map['gambar_banner'] ?? '',
    );
  }
}

class BannerWidget extends StatefulWidget {
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  List<Map<String, dynamic>> _imageUrls = [];
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _loadData();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients && _imageUrls.isNotEmpty) {
        _currentPage = (_currentPage + 1) % _imageUrls.length;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Future<List<Banner>> _fetchImageDataFromApi() async {
    try {
      final response =
          await http.get(Uri.parse('https://app.aag4u.co.id/api/getBanner'));
      if (response.statusCode == 200) {
        List jsonData = json.decode(response.body);
        return jsonData.map((item) => Banner.fromMap(item)).toList();
      } else {
        throw Exception('Failed to load image data from API');
      }
    } catch (error) {
      throw Exception('Error fetching data from API: $error');
    }
  }

  Future<void> _loadData() async {
    var hiveBox = await Hive.openBox('bannerBox');
    List<Map<String, dynamic>> loadedData = [];
    for (int i = 0; i < hiveBox.length; i++) {
      var item = hiveBox.getAt(i);
      if (item is Map) {
        loadedData.add(Map<String, dynamic>.from(item));
      }
    }
    setState(() {
      _imageUrls = loadedData;
    });

    try {
      List<Banner> apiImageData = await _fetchImageDataFromApi();
      if (!listEquals(apiImageData, loadedData)) {
        await hiveBox.clear();
        for (var imageData in apiImageData) {
          await hiveBox.add({'gambar_banner': imageData.gambar_banner});
        }
        setState(() {
          _imageUrls = apiImageData
              .map((e) => {'gambar_banner': e.gambar_banner})
              .toList();
        });
      }
    } catch (error) {
      print('Error fetching data from API: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double bannerHeight = MediaQuery.of(context).size.width * 0.3;

    return SizedBox(
      height: bannerHeight,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _imageUrls.length,
        itemBuilder: (context, index) {
          String? imageUrl = _imageUrls[index]['gambar_banner'];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imageUrl != null
                  ? CachedNetworkImage(
                      fadeInDuration: Duration(seconds: 1),
                      imageUrl: imageUrl,
                      width: screenWidth,
                      height: bannerHeight,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: screenWidth,
                        height: bannerHeight,
                        color: Colors.grey,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    )
                  : Container(
                      width: screenWidth,
                      height: bannerHeight,
                      color: Colors.grey,
                      child: Center(child: Text("Image not found")),
                    ),
            ),
          );
        },
      ),
    );
  }
}
