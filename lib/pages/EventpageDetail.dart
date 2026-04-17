import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/EventPage.dart';
import 'package:flutter_aag4u/pages/EventPageForm.dart';
import 'package:flutter_aag4u/pages/LoginPage.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class EventpageDetail extends StatefulWidget {
  final int id;
  final String judul;
  final String gambar;

  final String tgl;
  final String mulai;
  final String akhir;
  final String category;
  final String tempat;

  const EventpageDetail({
    Key? key,
    required this.id,
    required this.judul,
    required this.gambar,
    required this.tgl,
    required this.mulai,
    required this.akhir,
    required this.category,
    required this.tempat,
  }) : super(key: key);

  @override
  State<EventpageDetail> createState() => _EventpageDetailState();
}

class _EventpageDetailState extends State<EventpageDetail> {
  bool isLoading = false;
  bool? isRegistered;
  String? email;
  bool _isLoadingdata = true;

  String formatDate(String dateStr) {
    List<String> parts = dateStr
        .split('-'); // Memisahkan "2024-09-30" menjadi ["2024", "09", "30"]

    String tahun = parts[0];
    String bulan = getBulan(parts[1]); // Konversi angka bulan ke nama bulan
    String tanggal = parts[2];

    return "$tanggal $bulan $tahun"; // Hasil: "30 September 2024"
  }

  String getBulan(String bulan) {
    Map<String, String> bulanMap = {
      "01": "Januari",
      "02": "Februari",
      "03": "Maret",
      "04": "April",
      "05": "Mei",
      "06": "Juni",
      "07": "Juli",
      "08": "Agustus",
      "09": "September",
      "10": "Oktober",
      "11": "November",
      "12": "Desember"
    };

    return bulanMap[bulan] ??
        bulan; // Mengembalikan nama bulan atau tetap angka jika tidak ditemukan
  }

  String formatTime(String time) {
    try {
      final parsedTime = DateFormat('HH:mm:ss').parse(time);
      return DateFormat('HH:mm').format(parsedTime);
    } catch (e) {
      return 'Invalid time format';
    }
  }

  void initState() {
    super.initState();
    _checkRegister();
  }

  Future<void> _checkRegister() async {
    // Open Hive box
    final box = await Hive.openBox('loginBox');
    final mail = box.get('email');
    setState(() {
      // isLoading = true;
      _isLoadingdata = true;
    });

    if (mail != null) {
      // Send email to API for verification
      final response = await http.get(
        Uri.parse(
            'https://app.aag4u.co.id/api/cekEventRegis/$mail/${widget.id}'),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        setState(() {
          isRegistered = result == 1; // Assuming API returns 1 for registered
          email = box.get('email') as String?;
          print(email);
          _isLoadingdata = false;
        });
      }
    } else {
      // No email found in Hive box
      setState(() {
        isRegistered = null;
      });
    }
  }
  // setState(() {
  //   isLoading = false;
  // });

  // Future<void> _loadingData() async {
  //   // Simulasi delay untuk menunjukkan loading
  //   await Future.delayed(Duration(seconds: 3));
  //   setState(() {
  //     _isLoadingdata = true; // Selesai memuat data
  //   });
  // }

  Future<void> _saveUrlToHive(String url) async {
    final loginBox = Hive.box('loginBox');
    await loginBox.put('url', url); // Simpan URL ke Hive box
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // Gambar di bagian atas
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: widget.gambar,

                //  == "gaga.webp"
                //     ? widget.gambar
                //     : widget.gambar,
                // widget.gambar,
                fit: BoxFit.cover,
                width: screenWidth * 1.0,
                height: screenHeight * 0.4,
              ),
              Expanded(
                child: Container(color: Colors.transparent),
              ),
            ],
          ),

          // Konten latar putih di bawah gambar
          Positioned.fill(
            top: screenHeight * 0.3, // Dimulai tepat di bawah gambar
            // left: 20,
            // right: 20,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(213, 255, 255, 255),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(29), // Sudut atas melengkung
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      16, 16, 16, 70), // Memberikan ruang untuk tombol "Join"
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Judul
                        Text(
                          widget.judul,
                          style: TextStyle(
                              fontSize: fontSize * 0.03,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Opens Sans'),
                        ),
                        const SizedBox(height: 30),

                        // Teks informasi tengah (Tanggal, Jam Mulai, Jam Akhir, Tips & Tricks)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.category,
                                style: TextStyle(
                                  fontSize: fontSize * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.blue,
                                  size: fontSize * 0.03,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  formatDate(widget.tgl),
                                  style: TextStyle(
                                      fontSize: fontSize * 0.03,
                                      color: Colors.grey[700]),
                                ),
                              ]),

                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.blue,
                                    size: fontSize * 0.03,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      '${formatTime(widget.mulai)} - ${formatTime(widget.akhir)} WIB',
                                      style: TextStyle(
                                        fontSize: fontSize * 0.03,
                                        color: Colors.grey[700],
                                      )),
                                ],
                              ),

                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.pin_drop_outlined,
                                    color: Colors.blue,
                                    size: fontSize * 0.03,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.tempat,
                                      style: TextStyle(
                                        fontSize: fontSize * 0.03,
                                        color: Colors.grey[700],
                                      ),
                                      softWrap:
                                          true, // Tambahkan agar teks yang terlalu panjang dipotong
                                      overflow: TextOverflow
                                          .visible, // Membatasi teks menjadi satu baris
                                    ),
                                  ),
                                ],
                              )
                              // Text(
                              //   category,
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(fontSize: 16),
                              // ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Tombol "Join" tetap di bagian bawah
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color.fromARGB(0, 255, 255,
                  255), // Latar belakang tombol untuk memisahkan dari teks
              padding: const EdgeInsets.all(16.0),

              child: ElevatedButton(
                onPressed: isRegistered == null
                    ? () async {
                        // Simpan URL ke Hive box
                        await _saveUrlToHive('EventPageForm');

                        // Navigasi ke halaman LoginPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(
                              isRegistered: false,
                              login: false,
                              id: widget.id.toString(),
                              url: 'EventPageForm',
                              judul: widget.judul,
                              category: widget.category,
                              gambar: widget.gambar,
                              tgl: widget.tgl,
                              mulai: widget.mulai,
                              akhir: widget.akhir,
                              tempat: widget.tempat,
                            ),
                          ),
                        );
                      }
                    : isRegistered!
                        ? null // Disable button if registered
                        : () async {
                            // Simpan URL ke Hive box
                            await _saveUrlToHive('EventPageForm');

                            // Navigasi ke halaman EventPageForm
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventPageForm(
                                  id: widget.id,
                                  url: 'EventPageForm',
                                  judul: widget.judul,
                                  category: widget.category,
                                  email: email!,
                                ),
                              ),
                            );
                          },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (states) {
                      if (isRegistered == null) {
                        return Colors.blue;
                      }
                      if (isRegistered!) {
                        return Colors.grey; // Disabled color for registered
                      }
                      return Colors.blue; // Active color for join now
                    },
                  ),
                ),
                child: Text(
                  isRegistered == null
                      ? 'Join Now'
                      : isRegistered!
                          ? 'Sudah Bergabung'
                          : 'Join Now',
                  style:
                      TextStyle(fontSize: fontSize * 0.04, color: Colors.white),
                ),
              ),
            ),
          ),

          // AppBar Custom di atas gambar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  EventPage(
                                      // isRegistered: false,
                                      // login: false,
                                      // isLoggedIn: false,
                                      ),
                        ),
                        (route) => false, // Menghapus semua rute sebelumnya
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: iconSize * 0.05,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
