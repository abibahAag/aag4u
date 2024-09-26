// import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/template/navbar.dart';
// // import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';
// // import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';

// class ChatPage extends StatelessWidget {
//   const ChatPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Navbar(),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(0),
//                   child: Container(
//                       child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "CHAT",
//                             style: TextStyle(
//                               fontSize: 25,
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 child: Text(
//                                   "COMING SOON",
//                                   style: TextStyle(
//                                     fontSize: 35,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       )
//                     ],
//                   )),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//       // bottomNavigationBar: HomeBottomNavBar(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Chatpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil email dari Hive
    String userName = "John Doe"; // Nama pengguna (hardcoded, bisa dari API)

    return
    Scaffold(
      backgroundColor: Colors.grey[200], // Warna latar belakang halaman
      body: Stack(
        children: [
          // Background untuk bagian atas halaman (seperti header)
          Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Bagian body dari profile page
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                // Spacer untuk memberi jarak ke atas
                SizedBox(height: 80),

                // Avatar pengguna
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://www.w3schools.com/howto/img_avatar.png', // Gambar avatar
                  ),
                  backgroundColor: Colors.white,
                ),

                // Nama Pengguna
                SizedBox(height: 10),
                Text(
                  userName, // Nama pengguna
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                // Email Pengguna
                Text(
                  "sdsd@sjhdsd.cojs", // Email pengguna dari Hive
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),

                SizedBox(height: 20),

                // Kartu Informasi Profil
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.phone, color: Colors.blue),
                          title: Text("Phone Number"),
                          subtitle: Text("+123 456 7890"),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.location_on, color: Colors.blue),
                          title: Text("Address"),
                          subtitle: Text("123 Street, City, Country"),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.date_range, color: Colors.blue),
                          title: Text("Member Since"),
                          subtitle: Text("January 1, 2020"),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Tombol logout di bagian bawah halaman
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Logout dengan menghapus email dari Hive
          // box.delete('email');

          // Kembali ke halaman login
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => LoginPage()),
          // );
        },
        icon: Icon(Icons.logout),
        label: Text("Logout"),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
