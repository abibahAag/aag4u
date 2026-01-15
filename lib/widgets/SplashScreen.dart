import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:flutter_mytelkomsel/main.dart';
import 'package:http/http.dart' as http;

// class Screen {
//   // final String id;

//   final String gambar_splash;

//   Screen({required this.gambar_splash});

//   factory Screen.fromJson(Map<String, dynamic> json) {
//     String id = json['id'].toString();
//     String imageName = json['gambar_splash'].toString();
//     String imageUrl = 'https://app.aag4u.co.id/public/image/splash/$imageName';
//     return Screen(
//       // id: json['id'],
//       gambar_splash: imageUrl.toString(),
//     );
//   }
// }

class Screen {
  final String gambar_splash;

  Screen({
    required this.gambar_splash,
  });

  // Method to convert the object to a Map for Hive storage
  Map<String, dynamic> toMap() {
    return {
      'gambar_splash': gambar_splash,
    };
  }

  factory Screen.fromMap(Map<String, dynamic> map) {
    return Screen(
      gambar_splash: map['gambar_splash'] ?? '', // Set as empty string if null
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
  List<Map<String, dynamic>> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    // futureScreen = fetchScreen();
    // fetchScreen();
    _loadData(); // Start loading data from Hive and API
  }

// // Fungsi untuk mengambil gambar sebagai base64
//   Future<String?> fetchImageAsBase64(String imageUrl) async {
//     final response = await http.get(Uri.parse(imageUrl));
//     if (response.statusCode == 200) {
//       // Mengonversi byte dari response body ke base64
//       return base64Encode(response.bodyBytes);
//     }
//     return null;
//   }

  // Future<List<Screen>> _fetchHiveData() async {
  //   var box = await Hive.openBox('screenBox');
  //   List<Screen> screens = [];

  //   for (var key in box.keys) {
  //     // Get the base64 image stored in Hive
  //     String? base64Image = box.get(key);

  //     if (base64Image != null) {
  //       // Create Banner object with the base64 image
  //       screens.add(Screen(
  //         gambar_splash: base64Image, // Storing the base64 image string
  //         // Add any other fields necessary for the Banner object here
  //       ));
  //     }
  //   }

  //   // Return the list of Banner objects
  //   return screens;
  // }

  // Future<List<Screen>> fetchScreen() async {
  //   var box = await Hive.openBox('screenBox');

  //   // Show current data from Hive immediately
  //   List<Screen> hiveData = await _fetchHiveData();

  //   // Start updating Hive box in the background (if connected)
  //   _updateHiveDataInBackground(box);

  //   // Return data from Hive immediately, no loading state
  //   return hiveData;
  // }

  // Future<void> _updateHiveDataInBackground(Box box) async {
  //   bool connected = await InternetConnectionChecker().hasConnection;

  //   if (connected) {
  //     String apiUrl = 'https://app.aag4u.co.id/api/getSplash'; // API URL
  //     var response = await http.get(Uri.parse(apiUrl));

  //     if (response.statusCode == 200) {
  //       List jsonResponse = json.decode(response.body);
  //       List<Screen> screens =
  //           jsonResponse.map((data) => Screen.fromJson(data)).toList();

  //       int screenCount = screens.length;
  //       int hiveScreenCount = box.length;

  //       // If count differs, update the Hive box with new data
  //       if (hiveScreenCount != screenCount) {
  //         await box.clear();

  //         for (var screen in screens) {
  //           String imageName = screen.gambar_splash.split('/').last;
  //           String? base64Image =
  //               await fetchImageAsBase64(screen.gambar_splash);

  //           if (base64Image != null) {
  //             await box.put(imageName, base64Image);
  //           }
  //         }
  //         print('Hive data updated in background screen');
  //       }
  //     }
  //   }
  // }

  Future<List<Screen>> _fetchImageDataFromApi() async {
    try {
      final response =
          await http.get(Uri.parse('https://app.aag4u.co.id/api/getSplash'));
      if (response.statusCode == 200) {
        List jsonData = json.decode(response.body);
        // Assuming the API returns a list of JSON objects
        return jsonData.map((item) => Screen.fromMap(item)).toList();
      } else {
        throw Exception('Failed to load image data from API');
      }
    } catch (error) {
      throw Exception('Error fetching data from API: $error');
    }
  }

  Future<void> _loadData() async {
    var hiveBox = await Hive.openBox('screenBox');

    // Retrieve data from Hive first
    List<Map<String, dynamic>> loadedData = [];
    for (int i = 0; i < hiveBox.length; i++) {
      var item = hiveBox.getAt(i);

      // Ensure the item is a Map before proceeding
      if (item is Map) {
        Map<String, dynamic> mapItem = Map<String, dynamic>.from(item);
        loadedData.add(mapItem);
      } else {
        print('Error: Expected Map, but got ${item.runtimeType}');
      }
    }

    // Display data from Hive first
    setState(() {
      _imageUrls = loadedData;
    });

    // Try to fetch data from API and update Hive if there's a difference
    try {
      List<Screen> apiImageData = await _fetchImageDataFromApi();

      if (!listEquals(apiImageData, loadedData)) {
        // If data from API is different from data in Hive, update Hive and UI
        await hiveBox.clear(); // Clear all data in Hive before updating
        for (var imageData in apiImageData) {
          String imageUrl =
              imageData.gambar_splash; // Adjust according to your structure
          var response = await http.get(Uri.parse(imageUrl));

          Uint8List imageBytes = response.bodyBytes; // Convert to byte array
          String base64Image = base64Encode(imageBytes); // Convert to Base64

          Map<String, dynamic> dataToStore = {
            'imageBase64': base64Image, // Store image as Base64 string
          };
          await hiveBox.add(dataToStore);
        }

        // Refresh loadedData from Hive
        loadedData = [];
        for (int i = 0; i < hiveBox.length; i++) {
          var item = hiveBox.getAt(i);

          // Ensure the item is a Map before proceeding
          if (item is Map) {
            Map<String, dynamic> mapItem = Map<String, dynamic>.from(item);
            loadedData.add(mapItem);
          } else {
            print('Error: Expected Map, but got ${item.runtimeType}');
          }
        }

        setState(() {
          _imageUrls = loadedData; // Update UI with new data
        });
      }
    } catch (error) {
      print('Error fetching data from API: $error');
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
          child: Row(
            children: _imageUrls.map((Screen) {
              String? base64Image = Screen['imageBase64'];
              Uint8List? decodedBytes;
              if (base64Image != null) {
                decodedBytes = base64Decode(base64Image);
              }

              return Container(
                  width: screenWidth,
                  color: Color.fromARGB(255, 38, 57, 77),
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(24.0),
                    child: Center(
                      child: decodedBytes != null
                          ? Image.memory(
                              decodedBytes,
                              width: screenWidth,
                              fit: BoxFit.contain,
                            )
                          : Container(
                              width: screenWidth,
                              height: 100,
                              color: Colors.grey,
                              child: Center(child: Text("Image not found")),
                            ),
                    ),
                  ));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
