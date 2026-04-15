// import 'dart:ffi';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Blog/ArtikelPage.dart';
import 'package:flutter_aag4u/Menu_Promo/DetailPromo.dart';
import 'package:flutter_aag4u/Menu_Promo/promoPage.dart' as promo;
import 'package:flutter_aag4u/controller/pushnotificationController.dart';
import 'package:flutter_aag4u/pages/ActivityPage.dart';
import 'package:flutter_aag4u/pages/berandaPage.dart';
import 'package:flutter_aag4u/pages/profilePage.dart';
import 'package:flutter_aag4u/pages/surveyPage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Blog {
  final int id;
  final String title;
  final String photo;
  final String body;

  Blog({
    required this.id,
    required this.title,
    required this.photo,
    required this.body,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    String imageName = json['photo'];
    String imageUrl = 'https://app.aag4u.co.id/public/image/blog/$imageName';
    return Blog(
      id: json['id'],
      title: json['title'],
      photo: imageUrl,
      body: json['body'] ?? '',
    );
  }
}

class homePage extends StatefulWidget {
  // const homePage({super.key});
  final bool isRegistered; // Tambahkan flag untuk status registrasi
  final bool isLoggedIn; // Status apakah sudah login

  /// Index tab awal untuk mengarahkan BottomNavigationBar.
  final int initialTabIndex;

  homePage({
    required this.isRegistered,
    required this.isLoggedIn,
    required this.initialTabIndex,
  });

  @override
  State<homePage> createState() => _homePage();
}

class _homePage extends State<homePage> {
  int _selectedTabIndex = 0;
  // String notificationMsg = "waiting for notifications";
  bool isRefreshing = false;
  Future<List<Blog>>? futureBlog;
  bool isConnected = true;

  @override
  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
      futureBlog = fetchBlog();
      futureBlog = fetchBlog();
    });
    // super.initState();
    // FirebaseMessaging.onMessage.listen((event){

    // });
  }

  Future<List<Blog>> fetchBlog() async {
    isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      try {
        final response =
            await http.get(Uri.parse('http://www.app.aag4u.co.id/api/getPost'));

        if (response.statusCode == 200) {
          List jsonResponse = json.decode(response.body);
          List<Blog> blogs =
              jsonResponse.map((data) => Blog.fromJson(data)).toList();
          return blogs;
        } else {
          throw Exception('Failed to load blog posts');
        }
      } catch (e) {
        print('Error fetching data: $e');
        return [
          Blog(
            id: 0,
            title: '',
            photo: 'images/assets/No_internet.png',
            body: 'Please check your internet connection and try again.',
          ),
        ];
      }
    } else {
      return [
        Blog(
          id: 0,
          title: '',
          photo: 'images/assets/No_internet.png',
          body: 'Please check your internet connection and try again.',
        ),
      ];
    }
  }

  /// API untuk Menampilkan Notifikasi Detail Blog ///
  Future<Blog?> getBlogBy(String blogId) async {
    try {
      final response = await http.get(
        Uri.parse('https://app.aag4u.co.id/api/getPostBy/$blogId'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Blog.fromJson(data);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<promo.Banner?> getPromoBy(String promoId) async {
    try {
      final response =
          await http.get(Uri.parse('https://app.aag4u.co.id/api/getPromo'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<promo.Banner> promos =
            jsonResponse.map((data) => promo.Banner.fromJson(data)).toList();

        for (final item in promos) {
          if (item.id == promoId) {
            return item;
          }
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error promo: $e');
    }
    return null;
  }

  ///  Sampai Sini  API untuk Menampilkan Notifikasi Detail Blog //

  // //  to listen to any notification clicked or not
  // listenToNotifications() {
  //   print("Listening to notification");
  //   LocalNotifications.onClickNotification.stream.listen((event) {
  //     print(event);
  //     Navigator.pushNamed(context, '/surveyPage', arguments: event);
  //   });
  // }

  listenToNotifications() {
    print("Listening to notification");
    LocalNotifications.onClickNotification.stream.listen((event) async {
      print("Notification event: $event");

      // Check if the payload is a string
      String payload = event; // The payload is a string
      // String action = payload.substring(payload.indexOf('|') + 1);
      print("Received Payload: $payload");

      // Attempt to parse the payload as JSON
      try {
        var payloadData = jsonDecode(payload);

        // Extract the 'click_action' from the parsed payload (if it exists)
        String? clickAction = payloadData['click_action'];
        if (clickAction != null) {
          print("Click action: $payload");

          // Navigate based on the 'click_action'
          if (clickAction == "surveyPage") {
            Navigator.pushNamed(context, '/surveyPage', arguments: payload);
          } else if (clickAction == "profilePage") {
            Navigator.pushNamed(context, '/profilePage', arguments: payload);
          } else if (clickAction == "TreatmentPage") {
            Navigator.pushNamed(context, '/TreatmentPage', arguments: payload);
          } else if (clickAction == "EventPage") {
            Navigator.pushNamed(context, '/EventPage', arguments: payload);
          } else if (clickAction.startsWith("promoPage/")) {
            String? promoId;
            if (clickAction.startsWith("promoPage/")) {
              final parts = clickAction.split('/');
              if (parts.length > 1) {
                promoId = parts[1];
              }
            }
            promoId ??= payloadData['promoId']?.toString();
            promoId ??= payloadData['promo_id']?.toString();
            promoId ??= payloadData['id']?.toString();
            promoId ??= payloadData['topicId']?.toString();

            if (promoId != null && promoId.isNotEmpty) {
              final promoData = await getPromoBy(promoId);
              if (promoData != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPromo(
                      id: promoData.id,
                      judul: promoData.judul,
                      deskripsi: promoData.deskripsi,
                      mulai: promoData.mulai,
                      akhir: promoData.akhir,
                      gambar_promo: promoData.gambar_promo,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Promo tidak ditemukan')),
                );
              }
            } else {
              Navigator.pushNamed(context, '/PromoPage', arguments: payload);
            }
          } else if (clickAction.startsWith("artikelPage/")) {
            // Ekstrak ID dari clickAction
            final parts = clickAction.split('/');

            if (parts.length > 1) {
              final blogId = parts[1]; // Ambil ID dari bagian kedua

              // Ambil artikel berdasarkan blogId
              final blog = await getBlogBy(blogId);

              if (blog != null) {
                // Navigasikan ke halaman ArtikelPage dengan data artikel
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Artikelpage(
                      id: blog.id,
                      title: blog.title,
                      photo: blog.photo,
                      body: blog.body,
                      category: blog.toString(),
                    ),
                  ),
                );
              } else {
                // Tangani jika data blog tidak ditemukan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Artikel tidak ditemukan')),
                );
              }
            } else {
              // Jika hanya "artikelPage" tanpa parameter ID
              Navigator.pushNamed(context, '/BlogPage', arguments: payload);
            }
          } else {
            print("Unknown click action");
          }
        } else {
          print("No click_action found in payload");
        }
      } catch (e) {
        print("Error parsing payload: $payload");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = widget.initialTabIndex;
    listenToNotifications();

    // Cek kondisi apakah sudah register dan login
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isRegistered) {
        _showVerificationAlert();
      }
      if (widget.isLoggedIn) {
        _showLoginAlert();
      }
    });
  }

  void _showVerificationAlert() {
    double fontSize = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Verifikasi Email',
            style: TextStyle(fontSize: fontSize * 0.04),
          ),
          content: Text(
            'Cek email untuk melakukan verifikasi akun.',
            style: TextStyle(fontSize: fontSize * 0.04),
          ),
          actions: [
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(fontSize: fontSize * 0.04),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _showLoginAlert() {
    double fontSize = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Login success',
            style: TextStyle(fontSize: fontSize * 0.04),
          ),
          // content: Text('Anda telah berhasil login. Selamat datang!'),
          actions: [
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(fontSize: fontSize * 0.04),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double inWidth = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;

    final _listPage = <Widget>[
      // const Text("Beranda"),
      berandaPage(),
      // const Text("survey"),
      SurveyPage(
        isRegistered: false,
        login: false,
      ),
      // const Text("promo"),
      promo.PromoPage(),
      // const Text("chat"),
      ActivityPage(
        isRegistered: false,
        login: false,
      ),
      // const Text("profile"),
      ProfilePage(
        isRegistered: false,
        login: true,
      ),
    ];

    final _bottonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          label: "Home",
          icon: InkWell(
              child: Icon(
            Icons.home,
            // size: iconSize * 0.05,
          ))),
      BottomNavigationBarItem(
          label: "Survey",
          icon: InkWell(
            onTap: () async {
              // Memeriksa status login dari Hive, menunggu hasil dari fungsi async

              var loginBox = await Hive.openBox('loginBox');
              if (loginBox.isEmpty) {
                // Jika sudah login, arahkan ke halaman SimulasiHargaPage
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       title: Text('Info'),
                //       content: Text('Harap login terlebih dahulu'),
                //       actions: <Widget>[
                //         TextButton(
                //           child: Text('OK'),
                //           onPressed: () {
                //             Navigator.of(context).pop(); // Menutup dialog
                // Arahkan ke halaman login setelah menutup dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      isRegistered: false,
                      login: false,
                    ),
                  ),
                );
                //           },
                //         ),
                //       ],
                //     );
                //   },
                // );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurveyPage(
                      isRegistered: true,
                      login: false,
                    ),
                  ),
                );
                // Tampilkan alert jika belum login
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.assignment,
                    // size: iconSize * 0.05,
                  ),
                ),
              ],
            ),
          )
          //   child: Icon(
          // Icons.assignment, )
          ),
      BottomNavigationBarItem(
          label: "Promo",
          icon: InkWell(
              child: Icon(
            Icons.local_offer,
            // size: iconSize * 0.05,
          ))),
      BottomNavigationBarItem(
          label: "Activity",
          icon: InkWell(
              onTap: () async {
                // Memeriksa status login dari Hive, menunggu hasil dari fungsi async

                var loginBox = await Hive.openBox('loginBox');
                if (loginBox.isEmpty) {
                  // Jika sudah login, arahkan ke halaman SimulasiHargaPage
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       title: Text('Info'),
                  //       content: Text('Harap login terlebih dahulu'),
                  //       actions: <Widget>[
                  //         TextButton(
                  //           child: Text('OK'),
                  //           onPressed: () {
                  // Navigator.of(context).pop(); // Menutup dialog
                  // Arahkan ke halaman login setelah menutup dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        isRegistered: false,
                        login: false,
                      ),
                    ),
                  );
                  //           },
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActivityPage(
                        isRegistered: false,
                        login: false,
                      ),
                    ),
                  );
                  // Tampilkan alert jika belum login
                }
              },
              child: Icon(
                Icons.timer,
                // size: iconSize * 0.05,
              ))),

      ///BOTTOM PROFILE
      BottomNavigationBarItem(
          label: "Profile",
          icon: InkWell(
              // onTap: () {
              //   setState(() {
              //     index_color = 4;
              //    _navigateWithoutTransition(ProfilePage());
              //   });
              // },
              child: Icon(
            Icons.person,
            // size: iconSize * 0.05,
            // color: index_color == 4 ? Colors.red : Colors.white,
          ))),
    ];
    final _bottomNavBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      items: _bottonNavBarItems,
      currentIndex: _selectedTabIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: const Color(0xFF233d63),
      selectedFontSize: fontSize * 0.04,
      unselectedFontSize: fontSize * 0.03,
      onTap: _onNavBarTapped,
      iconSize: iconSize * 0.05,
    );

    return Scaffold(
      // appBar: Navbar(),
      body: Center(
        child: _listPage[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
