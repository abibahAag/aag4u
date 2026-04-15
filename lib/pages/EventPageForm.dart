import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/EventResult.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Provinsi {
  final int id;
  final String name;

  Provinsi({required this.id, required this.name});

  factory Provinsi.fromJson(Map<String, dynamic> json) {
    return Provinsi(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      name: json['name'],
    );
  }
}

class Kota {
  final int id;
  final String name;

  Kota({required this.id, required this.name});

  factory Kota.fromJson(Map<String, dynamic> json) {
    return Kota(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      name: json['name'],
    );
  }
}

class dataprofile {
  final int? id;
  final String nama;
  final String gender;
  final String telp;
  final String provinsi;
  final String kota;
  final String created_at;

  dataprofile(
      {this.id,
      required this.nama,
      required this.gender,
      required this.telp,
      required this.provinsi,
      required this.created_at,
      required this.kota});

  factory dataprofile.fromJson(Map<String, dynamic> json) {
    // if (json['id'] == null || json['id'] is! int) {
    //   throw Exception("Invalid 'id' value: ${json['id']}");
    // }
    return dataprofile(
      id: json['id'],
      nama: json['nama'] ?? '',
      gender: json['gender'] ?? '',
      telp: json['telp'] ?? '',
      provinsi: json['provinsi'] ?? '',
      kota: json['kota'] ?? '',
      created_at: json['created_at'] ?? '',
    );
  }
}

class EventPageForm extends StatefulWidget {
  // const FormPage({Key? key}) : super(key: key);
  final int id;
  final String url;
  final String judul;
  final String category;
  final String email;

  const EventPageForm({
    Key? key,
    required this.id,
    required this.url,
    required this.judul,
    required this.category,
    required this.email,
  }) : super(key: key);

  @override
  State<EventPageForm> createState() => _FormPageState();
}

class _FormPageState extends State<EventPageForm> {
  dynamic apiData;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _telpController = TextEditingController();

  Map<String, dynamic>? profileData;

  Future<List<Provinsi>>? futureProvinsi;
  Future<List<Kota>>? futureKota;
  String? _selectedGender;
  bool isConnected = true;
  bool _isFormVisible = false;
  Provinsi? selectedProvinsi;
  Kota? selectedKota;
  bool _isLoadingdata = true;

  @override
  void initState() {
    super.initState();
    futureProvinsi = fetchProvinsi();
    // fetchProfile();
    _fetchApiData();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _isFormVisible =
              false; // Atur state secara aman setelah frame pertama
        });
      }
    });
  }

  Future<void> _fetchApiData() async {
    // Simulasi pengambilan data dari API
    await Future.delayed(Duration(seconds: 2)); // Simulasi loading
    // Ganti dengan logika API Anda
    final fetchedData = await fetchProfile();

    setState(() {
      apiData = fetchedData; // Set loading selesai
    });
  }

  Future<Map<String, dynamic>> fetchProfile() async {
    setState(() {
      _isLoadingdata = true;
    });
    final uri =
        Uri.parse('https://app.aag4u.co.id/api/getProfile/${widget.email}');
    // try {
    final respons = await http.get(uri);
    if (respons.statusCode == 200) {
      setState(() {
        _isLoadingdata = false;
      });
      return json.decode(respons.body) as Map<String, dynamic>;

      // setState(() {
      //   profileData = {
      //     'Nama': datos['nama'] ?? 'Tidak ditemukan',
      //     'Jenis Kelamin':
      //         datos['gender'] ?? 'Tidak ditemukan', // Contoh data tambahan
      //     'Telepon': datos['telp'] ?? 'Tidak ditemukan',
      //     'Provinsi':
      //         datos['provinsi'] ?? 'Tidak ditemukan', // Contoh data tambahan
      //     'Kota': datos['kota'] ?? 'Tidak ditemukan',
      //   };
      // });
    } else {
      throw Exception('Gagal memuat data profil');
    }
    // } catch (e) {}
    // ;
  }

  Future<List<Provinsi>> fetchProvinsi() async {
    isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      try {
        final response = await http.get(Uri.parse(
            'https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json'));

        if (response.statusCode == 200) {
          List jsonResponse = json.decode(response.body);
          List<Provinsi> provinsi =
              jsonResponse.map((data) => Provinsi.fromJson(data)).toList();
          return provinsi;
        } else {
          throw Exception('Failed to load blog posts');
        }
      } catch (e) {
        print('Error fetching data: $e');
        return _getPlaceholderprovinsi();
      }
    } else {
      return _getPlaceholderprovinsi();
    }
  }

  List<Provinsi> _getPlaceholderprovinsi() {
    return [
      Provinsi(
        id: 0,
        name: '',
      ),
    ];
  }

  Future<List<Kota>> fetchKota(int provinsiId) async {
    isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      try {
        final response = await http.get(Uri.parse(
            'https://www.emsifa.com/api-wilayah-indonesia/api/regencies/$provinsiId.json'));

        if (response.statusCode == 200) {
          List jsonResponse = json.decode(response.body);
          List<Kota> kota =
              jsonResponse.map((data) => Kota.fromJson(data)).toList();
          return kota;
        } else {
          throw Exception('Failed to load blog posts');
        }
      } catch (e) {
        print('Error fetching data: $e');
        return _getPlaceholderkota();
      }
    } else {
      return _getPlaceholderkota();
    }
  }

  List<Kota> _getPlaceholderkota() {
    return [
      Kota(
        id: 0,
        name: '',
      ),
    ];
  }

  Future<void> _refreshData() async {
    setState(() {
      futureProvinsi = fetchProvinsi();
      selectedProvinsi = null;
      selectedKota = null;
      futureKota = null;
    });
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();

      // Membuka Hive box
      final profileBox = await Hive.openBox('profileBox');
      final isiBox = await Hive.openBox('loginBox');

      // Data yang akan dikirim ke API
      final data = {
        'nama': _namaController.text,
        'gender': _selectedGender,
        'telp': _telpController.text,
        'provinsi': selectedProvinsi?.name,
        'kota': selectedKota?.name,
        'event_id': widget.id, // Ini bisa kosong
        'email': isiBox.get('email'), // Menambahkan dari hive box login
      };

      try {
        // Mengirim data ke API
        final response = await http.post(
          Uri.parse('https://app.aag4u.co.id/api/addInfo'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(data),
        );

        if (response.statusCode == 200) {
          // Parsing data dari respons
          final responseData =
              json.decode(response.body) as Map<String, dynamic>;
          final dated = responseData['dated'];

          // Menyimpan data ke dalam Hive box
          await profileBox.put('profile', {
            'nama': _namaController.text,
            'gender': _selectedGender ?? '',
            'telp': _telpController.text,
            'provinsi': selectedProvinsi?.name ?? '',
            'kota': selectedKota?.name ?? '',
            'dated': dated ?? '',
            'event_id': widget.id,
            'email': isiBox.get('email'),
          });
          print('ini data profileBox $profileBox');

// Memeriksa dan mencetak data dari Hive box
          final savedData = profileBox.get('profile');
          print('Data tersimpan di Hive: $savedData');

          // Navigasi ke EventResult
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventResult(
                EventId: widget.id,
                dated: dated,
              ),
            ),
          );
        } else {
          print('Failed to submit data: ${response.statusCode}');
        }
      } catch (e) {
        print('Error submitting form: $e');
      }
    }
  }

  void _submitProfile() async {
    final isiBox = await Hive.openBox('loginBox');
    final profileBox = await Hive.openBox('profileBox');

    final data = {
      'event_id': widget.id, // Ini bisa kosong
      'email': isiBox.get('email'), // Menambahkan dari hive box login
    };

    // print('Request data: $data');

    final response = await http.post(
      Uri.parse('https://app.aag4u.co.id/api/addInfo'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    // print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      final dated = responseData['dated'];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EventResult(
            EventId: widget.id,
            dated: dated,
          ),
        ),
      );
    } else {
      print('Failed to submit data: ${response.statusCode}');
    }
  }

  Future<void> _loadingData() async {
    // Simulasi delay untuk menunjukkan loading
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      _isLoadingdata = true; // Selesai memuat data
    });
  }

  @override
  Widget build(BuildContext context) {
    double inWidth = MediaQuery.of(context).size.width * 0.9;
    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isDataEmpty = apiData == null || apiData!.isEmpty;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.05,
        automaticallyImplyLeading: true,
        // backgroundColor: Colors.amber,
        leading: IconButton(
          padding: EdgeInsets.only(bottom: 20),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: iconSize * 0.04,
          ),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: Text(
          'Join Event',
          style: TextStyle(fontSize: fontSize * 0.04),
        ),
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child:
                // _isLoadingdata
                //     ? Center(
                //         child: LoadingAnimationWidget.inkDrop(
                //             color: const Color.fromARGB(255, 34, 20, 227),
                //             size: 50))
                //     :
                SingleChildScrollView(
              child: isDataEmpty ? _formNew() : _oldData(apiData),
              // _formNew(),
            ),
          )),
      bottomNavigationBar: Container(
        // color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: isDataEmpty ? _submitForm : _submitProfile,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: Text('Submit',
              style: TextStyle(color: Colors.white, fontSize: fontSize * 0.03)),
        ),
      ),
    );
  }

  Widget _oldData(dynamic profData) {
    // return SingleChildScrollView(
    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return _isLoadingdata
        ? Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: const Color.fromARGB(255, 34, 20, 227), size: 50)),
          )
        : Column(
            children: [
              // FutureBuilder<Map<String, dynamic>>(
              //   future: fetchProfile(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     } else if (snapshot.hasError) {
              //       return Center(
              //         child: Text('Error: ${snapshot.error}'),
              //       );
              //     } else if (snapshot.hasData && snapshot != '') {
              //       final profileData = snapshot.data!;
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16),
                    // Widget Avatar atau Foto Profil
                    CircleAvatar(
                      radius: iconSize * 0.05,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        Icons.person,
                        size: iconSize * 0.05,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    // Menampilkan data profil
                    _profileItem('Nama', profData['nama']),
                    _profileItem('Jenis Kelamin', profData['gender']),
                    _profileItem('Telepon', profData['telp']),
                    _profileItem('Provinsi', profData['provinsi']),
                    _profileItem('Kota', profData['kota']),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          );
    //         } else {
    //           return Center(
    //             child: Text('No data found'),
    //           );
    //         }
    //       },
    //     ),
    //   ],
    // );
  }
  // );

  Widget _profileItem(String title, String value) {
    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize * 0.03,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: fontSize * 0.03,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _formNew() {
    double inWidth = MediaQuery.of(context).size.width * 0.9;
    double fontSize = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return _isLoadingdata
        ? Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.2),
            child: Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: const Color.fromARGB(255, 34, 20, 227), size: 50)),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.02,
                // left: screenHeight * 0.01,
                // right: screenHeight * 0.01
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.category,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: fontSize * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    widget.judul,
                    style: TextStyle(
                      fontSize: fontSize * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.07,
                    child: TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(
                          labelText: 'Nama',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          labelStyle: TextStyle(fontSize: fontSize * 0.04)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: fontSize * 0.04),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          // labelText: 'Jenis Kelamin',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          labelStyle: TextStyle(fontSize: fontSize * 0.04)),
                      style: TextStyle(fontSize: fontSize * 0.04),
                      hint: Text(
                        'Jenis Kelamin',
                        style: TextStyle(fontSize: fontSize * 0.04),
                      ),
                      value: _selectedGender,
                      items: [
                        DropdownMenuItem(
                            value: 'Laki-laki',
                            child: Text(
                              'Laki-laki',
                              style: TextStyle(
                                  fontSize: fontSize * 0.04,
                                  color: Colors.black),
                            )),
                        DropdownMenuItem(
                            value: 'Perempuan',
                            child: Text(
                              'Perempuan',
                              style: TextStyle(
                                  fontSize: fontSize * 0.04,
                                  color: Colors.black),
                            )),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pilih jenis kelamin';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.07,
                    child: TextFormField(
                      style: TextStyle(fontSize: fontSize * 0.04),
                      controller: _telpController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: 'Telepon',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          labelStyle: TextStyle(fontSize: fontSize * 0.04)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor telepon tidak boleh kosong';
                        }
                        // if (!RegExp(r'^\d{10,15}\$').hasMatch(value)) {
                        //   return 'Masukkan nomor telepon yang valid';
                        // }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Text(
                  //   'PROVINSI',
                  //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  // ),
                  // SizedBox(height: 8),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(.0),
                        child: Column(
                          children: [
                            RefreshIndicator(
                              onRefresh: _refreshData,
                              child: FutureBuilder<List<Provinsi>>(
                                future: futureProvinsi,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text(
                                      'Error: ${snapshot.error}',
                                      style:
                                          TextStyle(fontSize: fontSize * 0.03),
                                    );
                                  } else if (snapshot.hasData) {
                                    return Container(
                                      width: screenWidth * 0.9,
                                      height: screenHeight * 0.07,

                                      // decoration: BoxDecoration(
                                      //   borderRadius:
                                      //       BorderRadius.circular(8.0),
                                      //   border: Border.all(color: Colors.grey),
                                      // ),
                                      //  width: MediaQuery.of(context).size.width *
                                      //     0.9, // Lebar menyesuaikan layar
                                      // height: MediaQuery.of(context).size.width *
                                      //     0.10, // Lebar menyesuaikan layar
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal: 10, vertical: 0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: DropdownButtonFormField<Provinsi>(
                                        hint: Text(
                                          'Pilih Provinsi',
                                          style: TextStyle(
                                            fontSize: fontSize * 0.04,
                                            // overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        style: TextStyle(
                                            fontSize: fontSize * 0.04),
                                        value: selectedProvinsi,
                                        decoration: InputDecoration(
                                          // labelText: 'Pilih Provinsi',
                                          border: InputBorder.none,
                                          labelStyle: TextStyle(
                                              fontSize: fontSize * 0.04),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                        ),
                                        onChanged: (Provinsi? newValue) {
                                          setState(() {
                                            selectedProvinsi = newValue;
                                            selectedKota =
                                                null; // Reset pilihan Kota
                                            if (newValue != null) {
                                              futureKota = fetchKota(newValue
                                                  .id); // Mengambil data Kota baru
                                            }
                                          });
                                        },
                                        items: snapshot.data!
                                            .map((Provinsi provinsi) {
                                          return DropdownMenuItem<Provinsi>(
                                            value: provinsi,
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                  maxWidth: screenWidth * 0.8,
                                                  maxHeight: screenHeight *
                                                      0.9), // Sesuaikan lebar maksimum sesuai kebutuhan
                                              child: Text(
                                                provinsi.name,
                                                style: TextStyle(
                                                    fontSize: fontSize * 0.04,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                                maxLines: 3,
                                                overflow: TextOverflow.visible,
                                                // softWrap: true,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Provinsi';
                                          }
                                          return null;
                                        },
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      'No data',
                                      style:
                                          TextStyle(fontSize: fontSize * 0.03),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  FutureBuilder<List<Kota>>(
                    future: futureKota,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(fontSize: fontSize * 0.03),
                        );
                      } else if (snapshot.hasData) {
                        // return DropdownButtonFormField<Kota>(
                        //   // hint: Text('Kota'),

                        //   value: selectedKota,
                        //   decoration: const InputDecoration(
                        //     labelText: 'Kota',
                        //     border: OutlineInputBorder(),
                        //     // border: InputBorder.none,
                        //   ),
                        //   onChanged: (Kota? newValue) {
                        //     setState(() {
                        //       selectedKota = newValue;
                        //     });
                        //   },
                        //   items: snapshot.data!.map((Kota kota) {
                        //     return DropdownMenuItem<Kota>(
                        //       value: kota,
                        //       child: Text(kota.name),
                        //     );
                        //   }).toList(),
                        //   validator: (value) {
                        //     if (value == null) {
                        //       return 'Kota harus di pilih';
                        //     }
                        //     return null;
                        //   },
                        // );
                        return Container(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.09,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<Kota>(
                            hint: Text(
                              'Kota',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(fontSize: fontSize * 0.04),
                            ),
                            style: TextStyle(fontSize: fontSize * 0.04),
                            value: selectedKota,
                            onChanged: (Kota? newValue) {
                              setState(() {
                                selectedKota = newValue;
                              });
                            },
                            items: snapshot.data!.map((Kota kota) {
                              return DropdownMenuItem<Kota>(
                                value: kota,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      // maxHeight: screenHeight * 1.9,
                                      maxWidth: screenWidth *
                                          0.7), // Sesuaikan lebar maksimum sesuai kebutuhan
                                  child: Text(
                                    kota.name,
                                    style: TextStyle(
                                        fontSize: fontSize * 0.04,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    maxLines: 4,
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      } else {
                        return Text(
                          'Silakan pilih provinsi terlebih dahulu',
                          style: TextStyle(fontSize: fontSize * 0.04),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
