import 'package:flutter/material.dart';

class DaftarProfilePage extends StatefulWidget {
  const DaftarProfilePage({super.key});

  @override
  State<DaftarProfilePage> createState() => _DaftarProfilePageState();
}

class _DaftarProfilePageState extends State<DaftarProfilePage> {
  @override
  Widget build(BuildContext context) {
    double inWidth = MediaQuery.of(context).size.width * 0.8;
    double screenWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: AppBar(
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
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 15.0),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFF233d63),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login AAG4U",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
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
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: <Widget>[
                                              Container(
                                                // color: Colors.blue,
                                                // width:,
                                                height: 30,
                                                child: Text(
                                                  "Nama Lengkap",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: inWidth,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: TextFormField(
                                              // controller: _waController,
                                              keyboardType: TextInputType.phone,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Nama Lengkap',
                                              ),
                                              validator: (String? value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return ' Maukkan Nama Lengkap';
                                                }
                                                return null;
                                              },
                                            ),
                                          )
                                        ],
                                      )
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
                      height: 30,
                    ),
                    Row(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: <Widget>[
                                              Container(
                                                // color: Colors.blue,
                                                // width:,

                                                height: 30,
                                                child: Text(
                                                  "Email",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: inWidth,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: TextFormField(
                                              // controller: _waController,
                                              keyboardType: TextInputType.phone,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Email',
                                              ),
                                              validator: (String? value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return ' Maukkan Email';
                                                }
                                                return null;
                                              },
                                            ),
                                          )
                                        ],
                                      )
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
                      height: 30,
                    ),
                    Row(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: <Widget>[
                                              Container(
                                                // color: Colors.blue,
                                                // width:,

                                                height: 30,
                                                child: Text(
                                                  "Password",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: inWidth,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: TextFormField(
                                              // controller: _waController,
                                              keyboardType: TextInputType.phone,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Password',
                                              ),
                                              validator: (String? value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return ' Maukkan Password';
                                                }
                                                return null;
                                              },
                                            ),
                                          )
                                        ],
                                      )
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
                      height: 30,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  // width: 100,
                                  // height: 50,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              fixedSize: WidgetStatePropertyAll(
                                                  Size(screenWidth, 30)),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Color(0xFF233d63)),
                                            ),
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Submit',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.white),
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
                      height: 15,
                    ),
                    Row(
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
                      height: 15,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  // width: 100,
                                  // height: 50,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              fixedSize: WidgetStatePropertyAll(
                                                  Size(screenWidth, 30)),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Color(0xFF233d63)),
                                            ),
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "images/google.png",
                                                  width: 35,
                                                  height: 35,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Login with Google',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.white),
                                                ),
                                                // Icon(Icons.Google)
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
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
