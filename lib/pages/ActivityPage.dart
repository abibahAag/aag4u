import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/profilePage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage(
      {super.key, required bool isRegistered, required bool login});
  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<dynamic> events = [];
  Box loginBox = Hive.box('loginBox');
  bool _isLoadingdata = true;

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final box = await Hive.openBox('loginBox');
    final mail = box.get('email');
    setState(() {
      _isLoadingdata = true;
    });

    // if (mail == "" || mail == null) {
    //   // Jika sudah login, arahkan ke halaman ProfilePage

    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => ProfilePage(
    //         isRegistered: false,
    //         login: false,
    //       ),
    //     ),
    //   );
    //   // Tampilkan alert jika belum login
    // }

    final uri = 'https://app.aag4u.co.id/api/getMyEvent/$mail';
    try {
      final res = await http.get(Uri.parse(uri));
      if (res.statusCode == 200) {
        setState(() {
          events = json.decode(res.body);
          _isLoadingdata = false;
        });
      } else {
        print('Failed to load API: ${res.statusCode}');
      }
    } catch (e) {
      print('Error fetching events: $e');
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Tidak dapat membuka URL: $url';
    }
  }

  Future<void> _loadingData() async {
    // Simulasi delay untuk menunjukkan loading
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      _isLoadingdata = true; // Selesai memuat data
    });
  }

  Future<void> showEventDetails(String lokasi, url) async {
    // final uri = 'https://app.aag4u.co.id/api/getEventDetails/$eventId';
    // try {
    //   final res = await http.get(Uri.parse(uri));
    //   if (res.statusCode == 200) {
    // final eventDetails = json.decode(res.body);
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lokasi,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            // Text('Link:'),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                onPressed: () => _launchURL(url),
                child: const Text('Klik di sini'),
              ),
            ),
          ],
        ),
      ),
    );

    //   } else {
    //     print('Failed to load event details: ${res.statusCode}');
    //   }
    // } catch (e) {
    //   print('Error fetching event details: $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double inWidth = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
      valueListenable:
          loginBox.listenable(), // Listen for changes in the Hive box
      builder: (context, Box box, _) {
        String? _email = box.get('email');

        if (_email == null) {
          // If email is null, show the sign-in page
          return ProfilePage(
            isRegistered: false,
            login: false,
          );
        } else {
          // If email is not null, show the profile page
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: screenheight * 0.05,
              // backgroundColor: Colors.white,
              // foregroundColor: Colors.amber,
              elevation: 0,
              title: Text(
                'Activity',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: fontSize * 0.04,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: FutureBuilder(
              future: InternetConnectionChecker().hasConnection,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data == false) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('images/assets/No_internet.png',
                            width: screenWidth * 0.5),
                        SizedBox(height: 20),
                        Text(
                          'No Internet Connection',
                          style: TextStyle(
                              fontSize: fontSize * 0.04, color: Colors.black54),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ChoiceChip(
                            //   label: Text('Economy'),
                            //   selected: true,
                            //   onSelected: (selected) {
                            //     print('Economy selected');
                            //   },
                            // ),
                            ChoiceChip(
                              label: Text(
                                'Event',
                                style: TextStyle(fontSize: fontSize * 0.04),
                              ),
                              selected: false,
                              onSelected: (selected) {
                                print('Business selected');
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: _isLoadingdata
                            ? Center(
                                child: LoadingAnimationWidget.inkDrop(
                                  color: const Color.fromARGB(255, 34, 20, 227),
                                  size: 50,
                                ),
                              )
                            : events.isNotEmpty
                                ? ListView.builder(
                                    // padding:
                                    //     EdgeInsets.symmetric(horizontal: 0),
                                    itemCount: events.length,
                                    itemBuilder: (context, index) {
                                      final event = events[index];
                                      return GestureDetector(
                                        onTap: () => showEventDetails(
                                            event['lokasi'], event['url']),
                                        child: _ticketCard(
                                          title:
                                              event['judul'] ?? 'Unknown Title',
                                          time: event['tgl'] ?? 'Unknown Date',
                                          mulai: event['mulai'] ?? 'Start Time',
                                          akhir: event['akhir'] ?? 'End Time',
                                          category: event['event_group']?[0]
                                                  ['event_category']?['name'] ??
                                              'Unknown Category',
                                        ),
                                      );
                                    },
                                  )
                                : Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                              child:
                                                                  Image.asset(
                                                            "images/icons/survey.png",
                                                            width: screenWidth *
                                                                0.3,
                                                            height:
                                                                screenheight *
                                                                    0.3,
                                                          )),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Belum Ada Event Yang Di Ikuti",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize:
                                                            fontSize * 0.04,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  )
                                                  // const SizedBox(height: 5,),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                      ),
                    ],
                  );
                }
              },
            ),

            //  Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(16.0),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           // ChoiceChip(
            //           //   label: Text('Economy'),
            //           //   selected: true,
            //           //   onSelected: (selected) {
            //           //     print('Economy selected');
            //           //   },
            //           // ),
            //           ChoiceChip(
            //             label: Text('Event'),
            //             selected: false,
            //             onSelected: (selected) {
            //               print('Business selected');
            //             },
            //           ),
            //         ],
            //       ),
            //     ),
            //     Expanded(
            //       child: _isLoadingdata
            //           ? Center(
            //               child: LoadingAnimationWidget.inkDrop(
            //                 color: const Color.fromARGB(255, 34, 20, 227),
            //                 size: 50,
            //               ),
            //             )
            //           : events.isNotEmpty
            //               ? ListView.builder(
            //                   padding: EdgeInsets.symmetric(horizontal: 16),
            //                   itemCount: events.length,
            //                   itemBuilder: (context, index) {
            //                     final event = events[index];
            //                     return GestureDetector(
            //                       onTap: () => showEventDetails(
            //                           event['lokasi'], event['url']),
            //                       child: _ticketCard(
            //                         title: event['judul'] ?? 'Unknown Title',
            //                         time: event['tgl'] ?? 'Unknown Date',
            //                         mulai: event['mulai'] ?? 'Start Time',
            //                         akhir: event['akhir'] ?? 'End Time',
            //                         category: event['event_group']?[0]
            //                                 ['event_category']?['name'] ??
            //                             'Unknown Category',
            //                       ),
            //                     );
            //                   },
            //                 )
            //               : Center(
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(top: 100),
            //                     child: Column(
            //                       // mainAxisAlignment: MainAxisAlignment.start,
            //                       children: [
            //                         Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Column(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.center,
            //                               children: [
            //                                 Row(
            //                                   children: [
            //                                     Column(
            //                                       children: [
            //                                         Container(
            //                                             child: Image.asset(
            //                                           "images/icons/survey.png",
            //                                           width: 100,
            //                                           height: 100,
            //                                         )),
            //                                       ],
            //                                     ),
            //                                   ],
            //                                 ),
            //                                 SizedBox(
            //                                   height: 10,
            //                                 ),
            //                                 Text(
            //                                   "Belum Ada Event Yang Di Ikuti",
            //                                   style: TextStyle(
            //                                       color: Colors.grey,
            //                                       fontSize: 20,
            //                                       fontWeight: FontWeight.w600,
            //                                       fontStyle:
            //                                           FontStyle.italic),
            //                                 )
            //                                 // const SizedBox(height: 5,),
            //                               ],
            //                             ),
            //                           ],
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //     ),
            //   ],
            // )
          );
        }
      },
    );
  }

  Widget _ticketCard({
    required String title,
    required String time,
    required String mulai,
    required String akhir,
    required String category,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double inWidth = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double fontSize = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.transparent,
      elevation: 0,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // margin: EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/ticket-moc.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            width: screenWidth * 1.0,
            height: screenheight * 0.20, // Adjust the height as needed
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mulai,
                      style: TextStyle(
                          fontSize: fontSize * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: iconSize * 0.07,
                    ),
                    Text(
                      akhir,
                      style: TextStyle(
                          fontSize: fontSize * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: screenheight * 0.01),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.04, right: screenWidth * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(category,
                          style: TextStyle(
                              color: Colors.white, fontSize: fontSize * 0.04)),
                      Text('2H 0M',
                          style: TextStyle(
                              color: Colors.white, fontSize: fontSize * 0.04)),
                    ],
                  ),
                ),
                SizedBox(height: screenheight * 0.01),
                Divider(color: Colors.white),
                SizedBox(height: screenheight * 0.01),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize * 0.04,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
