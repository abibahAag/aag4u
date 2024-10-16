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
