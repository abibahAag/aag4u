import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_mytelkomsel/main.dart';
import 'package:http/http.dart' as http;




class Testi {
  // final String id;

  final String gambar_splash;

  Testi({required this.gambar_splash});

  factory Testi.fromJson(Map<String, dynamic> json) {
    String id = json['id'].toString();
    String imageName = json['gambar_splash'].toString();
    String imageUrl = 'https://app.aag4u.co.id/public/image/splash/$imageName';
    return Testi(
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

Future<List<Testi>>? futureTesti;

  @override
  void initState() {
    super.initState();
    futureTesti = fetchTesti();
  }

  Future<List<Testi>> fetchTesti() async {
    final response =
        await http.get(Uri.parse('https://app.aag4u.co.id/api/getSplash'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      // print('aaaaaa ${jsonResponse}  ');
      return jsonResponse.map((data) => Testi.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Banner posts');
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: Center(
  //       child: Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Color.fromARGB(255, 89, 115, 155), width: 7,style: BorderStyle.solid),
  //           borderRadius: BorderRadius.all(Radius.circular(150))
  //         ),
  //         child: Image.asset(
  //           "images/aag-load.gif",
  //           height: 250,
  //           width: 250,
  //         ),
  //       ),
  //     ),
  //     // Image.asset('lib/images/logo.png'),
  //   );
  // }

  
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
          child: FutureBuilder<List<Testi>>(
            future: futureTesti,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else if (snapshot.hasData) {
                List<Testi> posts = snapshot.data!;
                return Row(
                  children: posts.map((Testi) {
                    return Container(
                        width: screenWidth,
                        color: Color.fromARGB(255, 38, 57, 77),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                            child: 
                            Image.network(
                              Testi.gambar_splash.toString(),
                              width: screen,
                              fit: BoxFit.cover,
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
