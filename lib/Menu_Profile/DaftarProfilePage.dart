import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Profile/ProfileWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class DaftarProfilePage extends StatefulWidget {
  const DaftarProfilePage({super.key});

  @override
  State<DaftarProfilePage> createState() => _DaftarProfilePageState();
}

class _DaftarProfilePageState extends State<DaftarProfilePage> {
  bool _isObscured = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Memeriksa apakah ada data yang kosong
      if (_nameController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _passwordController.text.isEmpty) {
        // Menampilkan dialog peringatan jika ada input yang kosong
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Warning!!!',
                style: TextStyle(color: Colors.red),
              ),
              content: Text(
                'Semua data harus diisi.',
                style: TextStyle(fontSize: 15),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return; // Keluar dari fungsi jika ada data yang kosong
      }

      // Data yang akan dikirimkan ke API
      final data = {
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      };

      print('Request data: $data');

      // Melakukan request ke API
      final response = await http.post(
        Uri.parse('https://app.aag4u.co.id/api/addUser'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );

      print('Response body: ${response.body}');

      // Cek response API
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        final surveyId = responseData['idi'];
        print(' bvb b vvgcgcgcg: ${response.statusCode}');

        // Navigasi ke halaman lain setelah berhasil submit
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileWidget(),
          ),
        );
      } else {
        print('Failed to submit data: ${response.statusCode}');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account != null) {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => _buildProfilePage(),
        //   ),
        // );
      }
    });
    _googleSignIn.signInSilently();
  }

  String? _errorMessagenama; // Untuk menyimpan pesan kesalahan
  String? _errorMessageemail; // Untuk menyimpan pesan kesalahan
  String? _errorMessagepassword; // Untuk menyimpan pesan kesalahan

  // Fungsi untuk memvalidasi password
  void _validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorMessagepassword = 'Password tidak boleh kosong';
      } else if (value.length < 6) {
        _errorMessagepassword = 'Password harus minimal 6 karakter';
      } else {
        _errorMessagepassword = null; // Hapus pesan kesalahan jika valid
      }
    });
  }

  // Fungsi untuk memvalidasi password
  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorMessageemail = 'Email tidak boleh kosong';
        // }
        // else if (value.length < 6) {
        //   _errorMessage = 'Password harus minimal 6 karakter';
      } else {
        _errorMessageemail = null; // Hapus pesan kesalahan jika valid
      }
    });
  }

  // Fungsi untuk memvalidasi password
  void _validateNama(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorMessagenama = 'Nama tidak boleh kosong';
        // }
        // else if (value.length < 6) {
        //   _errorMessage = 'Password harus minimal 6 karakter';
      } else {
        _errorMessagenama = null; // Hapus pesan kesalahan jika valid
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double inWidth = MediaQuery.of(context).size.width * 0.8;
    double screenWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        // appBar: Navbar(),

        title: Container(
          // color: Colors.amber,
          width: 250,
          // height: 300,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Image.asset(
                            "images/icons/aagu.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        // Text(
                        //   "data",
                        //   style: TextStyle(color: Colors.black, fontSize: 5),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 100,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF233d63)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [Text("Hello! let's join with us")],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      // color: Colors.blue,
                      width: screenWidth,
                      // height: 400,
                      child: Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: inWidth,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          // color: Colors.amber,
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1,
                                                            style: BorderStyle
                                                                .solid,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(24),
                                                        ),
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 5,
                                                        ),
                                                        child: TextFormField(
                                                          controller:
                                                              _nameController,
                                                          textAlignVertical:
                                                              TextAlignVertical
                                                                  .center,
                                                          // autofocus: true,
                                                          enableInteractiveSelection:
                                                              true,
                                                          maxLines: 3,
                                                          textAlign:
                                                              TextAlign.start,
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            prefixStyle:
                                                                TextStyle(
                                                              fontSize: 10,
                                                            ),
                                                            prefixIcon: Icon(
                                                              Icons.person,
                                                              size: 25,
                                                            ),
                                                            hintText: 'Nama',
                                                          ),
                                                          onChanged:
                                                              _validateNama,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  if (_errorMessagenama != null)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                _errorMessagenama!,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: inWidth,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1,
                                                            style: BorderStyle
                                                                .solid,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(24),
                                                        ),
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 5,
                                                        ),
                                                        child: TextFormField(
                                                          scrollPadding:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          controller:
                                                              _emailController,
                                                          textAlignVertical:
                                                              TextAlignVertical
                                                                  .center,
                                                          // autofocus: true,
                                                          enableInteractiveSelection:
                                                              true,
                                                          maxLines: 3,
                                                          textAlign:
                                                              TextAlign.start,
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            prefixStyle:
                                                                TextStyle(
                                                              fontSize: 10,
                                                            ),
                                                            prefixIcon: Icon(
                                                              Icons.email,
                                                              size: 25,
                                                            ),
                                                            hintText: 'Email',
                                                          ),
                                                          onChanged:
                                                              _validateEmail,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  if (_errorMessageemail !=
                                                      null)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child: Text(
                                                        _errorMessageemail!,
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.8, // Lebar container 80% dari layar
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          // color: Colors
                                                          // .amberAccent,
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1,
                                                            style: BorderStyle
                                                                .solid,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(24),
                                                        ),
                                                        padding: const EdgeInsets
                                                            .only(
                                                            left:
                                                                0), // Padding di atas dan kiri
                                                        child: TextFormField(
                                                          controller:
                                                              _passwordController,
                                                          obscureText:
                                                              _isObscured, // Kontrol visibilitas password
                                                          enableSuggestions:
                                                              true,
                                                          textAlignVertical:
                                                              TextAlignVertical
                                                                  .center,
                                                          enableInteractiveSelection:
                                                              true,
                                                          maxLines: 1,
                                                          textAlign:
                                                              TextAlign.start,
                                                          decoration:
                                                              InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            prefixIcon:
                                                                const Icon(
                                                              Icons.lock,
                                                              size: 25,
                                                            ),
                                                            hintText:
                                                                'Password',
                                                            suffixIcon:
                                                                IconButton(
                                                              icon: Icon(
                                                                _isObscured
                                                                    ? Icons
                                                                        .visibility
                                                                    : Icons
                                                                        .visibility_off,
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  _isObscured =
                                                                      !_isObscured;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          // Jalankan validasi saat pengguna mengetik password
                                                          onChanged:
                                                              _validatePassword,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      // Tampilkan pesan kesalahan jika ada
                                                    ],
                                                  ),
                                                  if (_errorMessagepassword !=
                                                      null)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child: Text(
                                                        _errorMessagepassword!,
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              // width: 100,
                                              // height: 50,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                          fixedSize:
                                                              WidgetStatePropertyAll(
                                                                  Size(inWidth,
                                                                      30)),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(Color(
                                                                      0xFF233d63)),
                                                        ),
                                                        onPressed: _submitForm,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Submit',
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      child: Text("Or"),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              // width: 100,
                                              // height: 50,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                          fixedSize:
                                                              WidgetStatePropertyAll(
                                                                  Size(inWidth,
                                                                      30)),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255)),
                                                        ),
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: <Widget>[
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .google,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                              SizedBox(
                                                                  width: 10),
                                                              // Icon(Icons.goo),
                                                              Text(
                                                                'Sign up with Google',
                                                                style:
                                                                    TextStyle(
                                                                  color: const Color(
                                                                      0xFF233d63),
                                                                  fontSize: 15,
                                                                  // fontWeight:
                                                                  //     FontWeight.w800,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          _handleSignIn();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print('Sign-in failed: $error');
    }
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 50.0);

    var secondControlPoint = Offset(3 * size.width / 4, size.height - 100);
    var secondEndPoint = Offset(size.width, size.height - 50.0);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
