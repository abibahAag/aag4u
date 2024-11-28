import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:flutter_mytelkomsel/main.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Screen {
  // final String id;

  final String gambar_splash;

  Screen({required this.gambar_splash});

  factory Screen.fromJson(Map<String, dynamic> json) {
    String id = json['id'].toString();
    String imageName = json['gambar_splash'].toString();
    String imageUrl = 'https://app.aag4u.co.id/public/image/splash/$imageName';
    return Screen(
      // id: json['id'],
      gambar_splash: imageUrl.toString(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<List<Map<String, dynamic>>> _hiveData;
  Future<List<Screen>>? futureScreen;

  @override
  void initState() {
    super.initState();
    futureScreen = fetchScreen();
    fetchScreen();
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

  Future<List<Screen>> _fetchHiveData() async {
    var box = await Hive.openBox('screenBox');
    List<Screen> screens = [];

    for (var key in box.keys) {
      // Get the base64 image stored in Hive
      String? base64Image = box.get(key);

      if (base64Image != null) {
        // Create Banner object with the base64 image
        screens.add(Screen(
          gambar_splash: base64Image, // Storing the base64 image string
          // Add any other fields necessary for the Banner object here
        ));
      }
    }

    // Return the list of Banner objects
    return screens;
  }

  Future<List<Screen>> fetchScreen() async {
    var box = await Hive.openBox('screenBox');

    // Show current data from Hive immediately
    List<Screen> hiveData = await _fetchHiveData();

    // Start updating Hive box in the background (if connected)
    _updateHiveDataInBackground(box);

    // Return data from Hive immediately, no loading state
    return hiveData;
  }

  Future<void> _updateHiveDataInBackground(Box box) async {
    bool connected = await InternetConnectionChecker().hasConnection;

    if (connected) {
      String apiUrl = 'https://app.aag4u.co.id/api/getSplash'; // API URL
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<Screen> screens =
            jsonResponse.map((data) => Screen.fromJson(data)).toList();

        int screenCount = screens.length;
        int hiveScreenCount = box.length;

        // If count differs, update the Hive box with new data
        if (hiveScreenCount != screenCount) {
          await box.clear();

          for (var screen in screens) {
            String imageName = screen.gambar_splash.split('/').last;
            String? base64Image =
                await fetchImageAsBase64(screen.gambar_splash);

            if (base64Image != null) {
              await box.put(imageName, base64Image);
            }
          }
          print('Hive data updated in background screen');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 1;
    double screen = MediaQuery.of(context).size.width * 1;
    return SingleChildScrollView(
      // body: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: FutureBuilder<List<Screen>>(
            future: futureScreen,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else if (snapshot.hasData) {
                List<Screen> posts = snapshot.data!;
                return Row(
                  children: posts.map((Screen) {
                    return Container(
                        width: screenWidth,
                        color: Color.fromARGB(255, 38, 57, 77),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                            child: Screen.gambar_splash != null
                                ? Image.memory(
                                    base64Decode(Screen.gambar_splash),
                                    width: screenWidth,
                                    fit: BoxFit.cover,
                                  )
                                // Image.network(
                                //     Screen.gambar_splash.toString(),
                                //     width: screen,
                                //     fit: BoxFit.cover,
                                //   )
                                : Container(
                                    width: screenWidth,
                                    height: 100,
                                    color: Colors.grey,
                                    child:
                                        Center(child: Text("Image not found")),
                                  ),
                          ),
                        ));
                  }).toList(),
                );
              } else {
                return Center(child: Text("No data available"));
              }
            },
          ),
        ),
      ),
    );
  }
}
