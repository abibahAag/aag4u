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

// Fungsi untuk mengambil gambar sebagai base64
  Future<String?> fetchImageAsBase64(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      // Mengonversi byte dari response body ke base64
      return base64Encode(response.bodyBytes);
    }
    return null;
  }

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

  Future<List<Banner>> fetchTesti() async {
    var box = await Hive.openBox('bannerBox');

    // Show current data from Hive immediately
    List<Banner> hiveData = await _fetchHiveData();

    // Start updating Hive box in the background (if connected)
    _updateHiveDataInBackground(box);

    // Return data from Hive immediately, no loading state
    return hiveData;
  }

  Future<void> _updateHiveDataInBackground(Box box) async {
    bool connected = await InternetConnectionChecker().hasConnection;

    if (connected) {
      String apiUrl = 'https://app.aag4u.co.id/api/getBanner'; // API URL
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Banner> banners =
            jsonResponse.map((data) => Banner.fromJson(data)).toList();

        int bannerCount = banners.length;
        int hiveBannerCount = box.length;

        // If count differs, update the Hive box with new data
        if (hiveBannerCount != bannerCount) {
          await box.clear();

          for (var banner in banners) {
            String imageName = banner.gambar_banner.split('/').last;
            String? base64Image =
                await fetchImageAsBase64(banner.gambar_banner);

            if (base64Image != null) {
              await box.put(imageName, base64Image);
            }
          }
          print('Hive data updated in background banner');
        }
      }
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
          future: _banners,
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
