import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/EventPageDetail.dart';
import 'package:flutter_aag4u/pages/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<dynamic> articles = [];
  List<dynamic> categories = [];
  List<dynamic> filteredCategories = [];
  TextEditingController searchController = TextEditingController();
  int selectedCategory = 0;
  bool _isLoadingdata = true;
  bool _isLoading = true;
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
    searchController.addListener(() {
      filterCategories(searchController.text);
    });
    // Fetch articles for initial category
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchCategories() async {
    isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      final url = 'https://app.aag4u.co.id/api/getEventCategory';
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          setState(() {
            // Insert "All" category at the start of the list
            categories = [
              {'id': 0, 'name': 'All', 'slug': 'all'}
            ];
            categories.addAll(json.decode(response.body));
          });
          fetchArticles(0); // Load all articles initially
        } else {
          print('Failed to load categories');
        }
      } catch (e) {
        print('Error: $e');
      }
    } else {}
  }

  void filterCategories(String query) {
    final result = articles.where((item) {
      final name = item['judul'].toString().toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();
    if (mounted) {
      setState(() {
        filteredCategories = result;
      });
    }
  }

  Future<void> fetchArticles(int category) async {
    // final categ = category.replaceAll(' ', '_');
    if (mounted) {
      setState(() {
        _isLoadingdata = true;
      });
    }
    final url = category == 0
        ? 'https://app.aag4u.co.id/api/getEvent'
        : 'https://app.aag4u.co.id/api/getEventBy/$category'; // Adjust API endpoint as needed
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          articles = json.decode(response.body);
          filteredCategories = articles;
          _isLoadingdata = false;
        });
      } else {
        // Handle error
        print('Failed to load articles');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void onSegmentSelected(int category) {
    if (mounted) {
      setState(() {
        selectedCategory = category;
        fetchArticles(category);
      });
    }
  }

  Future<void> _loadingData() async {
    // Simulasi delay untuk menunjukkan loading
    await Future.delayed(Duration(seconds: 5));
    if (mounted) {
      setState(() {
        _isLoadingdata = true; // Selesai memuat data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenWidthIcon = MediaQuery.of(context).size.width * 0.05;
    double screenWidthcart = MediaQuery.of(context).size.width * 0.09;
    double screenWidtAppBar = MediaQuery.of(context).size.width;
    double screenHeightcart = MediaQuery.of(context).size.height * 0.01;
    double fontSize = MediaQuery.of(context).size.width * 0.04;
    double iconSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     Navigator.popAndPushNamed(context, '/homePage');
        //   },
        // ),

        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //     size: iconSize * 0.04,
        //   ),
        //   onPressed: () {
        //     Navigator.pushAndRemoveUntil(
        //       context,
        //       PageRouteBuilder(
        //         pageBuilder: (context, animation, secondaryAnimation) =>
        //             homePage(
        //           isRegistered: false,
        //           // login: false,
        //           isLoggedIn: false,
        //         ),
        //       ),
        //       (route) => false, // Menghapus semua rute sebelumnya
        //     );
        //   },
        // ),

        toolbarHeight: screenWidtAppBar * 0.09,
        // backgroundColor: Colors.amber,
        leading: IconButton(
          padding: EdgeInsets.only(bottom: 30),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: iconSize * 0.06,
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

        title: Text(
          'AAG Event',
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600]),
        ),

        actions: [
          Container(
            width: iconSize * 0.09,
            // color: Colors.blue,
            child: Align(
              alignment: Alignment.topCenter, // Posisikan ikon ke atas
              child: IconButton(
                padding: EdgeInsets.only(bottom: 10),
                icon: Icon(
                  Icons.refresh_rounded,
                  size: iconSize * 0.08,
                ),
                onPressed: () {
                  fetchArticles(selectedCategory); // Refresh articles
                },
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: InternetConnectionChecker().hasConnection,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Container();
          // } else
          if (snapshot.hasData && snapshot.data == false) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/assets/No_internet.png',
                    width: screenWidth * 0.5,
                    // height: screenHeightcart * 1.0,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No Internet Connection',
                    style: TextStyle(
                        fontSize: fontSize * 1.0, color: Colors.black54),
                  ),
                  // SizedBox(height: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {});
                  //   },
                  //   child: Text('Retry'),
                  // )
                ],
              ),
            );
          } else {
            return Column(
              children: [
                // Search bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(fontSize: fontSize),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(
                        Icons.search,
                        size: fontSize,
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.orange.withOpacity(0.2),
                        ),
                      ),
                      // prefixIcon: Icon(Icons.search, color: Colors.blueGrey),
                    ),
                  ),
                ),
                // Segmented Control
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((category) {
                        return Row(
                          children: [
                            _buildSegmentButton(
                              category['name'],
                              selectedCategory == category['id'],
                              category['id'],
                            ),
                            SizedBox(width: 7),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
                // Article List

                Expanded(
                    child: _isLoadingdata
                        ? buildShimmer()
                        : filteredCategories.isNotEmpty
                            ? ListView.builder(
                                padding: EdgeInsets.all(16.0),
                                itemCount: filteredCategories.length,
                                itemBuilder: (context, index) {
                                  final article = articles[index];
                                  final gamba = article['gambar'];
                                  final imgo = gamba == "gaga.webp"
                                      ? "https://app.aag4u.co.id/public/image/$gamba"
                                      : "https://app.aag4u.co.id/public/image/event/$gamba";

                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EventpageDetail(
                                            id: article['id'],
                                            judul: article['judul'],
                                            gambar: imgo,
                                            // 'https://app.aag4u.co.id/public/image/event/$gamba',
                                            tgl: article['tgl'],
                                            mulai: article['mulai'],
                                            akhir: article['akhir'],
                                            category: article['event_group'][0]
                                                ['event_category']['name'],
                                            tempat: article['lokasi'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: _buildArticleCard(
                                      title: article['judul'],
                                      time: article['tgl'],
                                      mulai: article['mulai'],
                                      akhir: article['akhir'],
                                      category: article['event_group'][0]
                                          ['event_category']['name'],

                                      imageUrl: imgo,
                                      // "https://www.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg",
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.travel_explore_sharp,
                                        size: iconSize * 0.1,
                                      ),
                                      SizedBox(height: 10),
                                      Text(' Data Tidak ditemukan',
                                          style: TextStyle(fontSize: fontSize)),
                                    ]),
                              )),
              ],
            );
          }
        },
      ),

      //  Column(
      //   children: [
      //     // Search bar
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //       child: TextField(
      //         controller: searchController,
      //         decoration: InputDecoration(
      //           hintText: 'Search...',
      //           prefixIcon: Icon(Icons.search),
      //           hintStyle: TextStyle(color: Colors.grey),
      //           filled: true,
      //           fillColor: Colors.white.withOpacity(0.2),
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(8.0),
      //             borderSide: BorderSide(
      //               color: Colors.orange.withOpacity(0.2),
      //             ),
      //           ),
      //           // prefixIcon: Icon(Icons.search, color: Colors.blueGrey),
      //         ),
      //       ),
      //     ),
      //     // Segmented Control
      //     Container(
      //       padding: EdgeInsets.all(5.0),
      //       child: SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,
      //         child: Row(
      //           children: categories.map((category) {
      //             return Row(
      //               children: [
      //                 _buildSegmentButton(
      //                   category['name'],
      //                   selectedCategory == category['id'],
      //                   category['id'],
      //                 ),
      //                 SizedBox(width: 7),
      //               ],
      //             );
      //           }).toList(),
      //         ),
      //       ),
      //     ),
      //     // Article List
      //     Expanded(
      //         child: _isLoadingdata
      //             ? buildShimmer()
      //             : filteredCategories.isNotEmpty
      //                 ? ListView.builder(
      //                     padding: EdgeInsets.all(16.0),
      //                     itemCount: filteredCategories.length,
      //                     itemBuilder: (context, index) {
      //                       final article = articles[index];
      //                       final gamba = article['gambar'];
      //                       final imgo = gamba == "gaga.webp"
      //                           ? "https://app.aag4u.co.id/public/image/$gamba"
      //                           : "https://app.aag4u.co.id/public/image/event/$gamba";
      //                       return InkWell(
      //                         onTap: () {
      //                           Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                               builder: (context) => EventpageDetail(
      //                                 id: article['id'],
      //                                 judul: article['judul'],
      //                                 gambar: imgo,
      //                                 // 'https://app.aag4u.co.id/public/image/event/$gamba',
      //                                 tgl: article['tgl'],
      //                                 mulai: article['mulai'],
      //                                 akhir: article['akhir'],
      //                                 category: article['event_group'][0]
      //                                     ['event_category']['name'],
      //                                 tempat: article['lokasi'],
      //                               ),
      //                             ),
      //                           );
      //                         },
      //                         child: _buildArticleCard(
      //                           title: article['judul'],
      //                           time: article['tgl'],
      //                           mulai: article['mulai'],
      //                           akhir: article['akhir'],
      //                           category: article['event_group'][0]
      //                               ['event_category']['name'],
      //                           imageUrl: imgo,
      //                           // "https://www.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg",
      //                         ),
      //                       );
      //                     },
      //                   )
      //                 : Center(
      //                     child: Row(
      //                         mainAxisSize: MainAxisSize.min,
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Icon(Icons.travel_explore_sharp),
      //                           SizedBox(width: 4),
      //                           Text('Tidak ditemukan'),
      //                         ]),
      //                   )),
      //   ],
      // ),
    );
  }

  Widget _buildSegmentButton(String title, bool isSelected, int category) {
    double fontSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // padding: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.orange.withOpacity(0.3)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () => onSegmentSelected(category),
            child: Text(
              title,
              style: TextStyle(
                fontSize: fontSize * 0.03,
                color: isSelected ? Colors.orange : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String formatDate(String date) {
    final parsedDate = DateTime.parse(date);
    return DateFormat('d MMM yyyy').format(parsedDate);
  }

  String formatTime(String time) {
    final parsedTime = DateFormat('HH:mm:ss').parse(time);
    return DateFormat('HH:mm').format(parsedTime);
  }

  Widget _buildArticleCard({
    required String title,
    required String time,
    required String mulai,
    required String akhir,
    required String category,
    required String imageUrl,
  }) {
    double fontSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      // color: Colors.blue,
      // margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image on the left
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                imageUrl,
                width: screenWidth * 0.3,
                height: screenHeight * 0.2,
                // fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(width: 25),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: fontSize * 0.03, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formatDate(time),
                    style: TextStyle(
                        fontSize: fontSize * 0.03, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text('${formatTime(mulai)} - ${formatTime(akhir)} WIB',
                      style: TextStyle(
                        fontSize: fontSize * 0.03,
                        color: Colors.grey,
                      )),
                  SizedBox(height: 4),
                  Text(
                    category,
                    style: TextStyle(
                        color: Colors.orange, fontSize: fontSize * 0.03),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Container(
              height: 100.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
