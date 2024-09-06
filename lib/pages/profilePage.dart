import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Profile/login_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_signin/pages/home_page.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => loginpage(),
          ),
        );
      }
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    double inWidth = MediaQuery.of(context).size.width * 0.9;
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    double screenfullWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 15.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                          width: 300,
                                          height: 250,
                                          child: Image.asset(
                                            "images/login2.png",
                                          )),
                                    )
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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // decoration: BoxDecoration(
                        //     // color: const Color.fromARGB(41, 105, 196, 241),
                        //     borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(24),
                        //   topRight: Radius.circular(24),
                        //   bottomLeft: Radius.circular(24),
                        //   bottomRight: Radius.circular(24),
                        // )),
                        // width: screenfullWidth,
                        // height: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Container(
                                        // color: Colors.amber,
                                        // width: inWidth,
                                        // height: 300,
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
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Column(
                                                                    children: <Widget>[
                                                                      Container(
                                                                        // color: Colors.blue,
                                                                        // width:,

                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Text(
                                                                          "Email",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            //   fontWeight:
                                                                            //       FontWeight.bold,
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
                                                                    width:
                                                                        inWidth,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            1,
                                                                        style: BorderStyle
                                                                            .solid,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 10,
                                                                    ),
                                                                    child:
                                                                        TextFormField(
                                                                      // controller: _waController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .phone,
                                                                      decoration:
                                                                          const InputDecoration(
                                                                        border:
                                                                            InputBorder.none,
                                                                        hintText:
                                                                            'Email',
                                                                      ),
                                                                      validator:
                                                                          (String?
                                                                              value) {
                                                                        if (value ==
                                                                                null ||
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
                                              height: 20,
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
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Column(
                                                                    children: <Widget>[
                                                                      Container(
                                                                        // color: Colors.blue,
                                                                        // width:,

                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Text(
                                                                          "Password",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            // fontWeight:
                                                                            //     FontWeight.bold,
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
                                                                    width:
                                                                        inWidth,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            1,
                                                                        style: BorderStyle
                                                                            .solid,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 10,
                                                                    ),
                                                                    child:
                                                                        TextFormField(
                                                                      // controller: _waController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .phone,
                                                                      decoration:
                                                                          const InputDecoration(
                                                                        border:
                                                                            InputBorder.none,
                                                                        hintText:
                                                                            'Password',
                                                                      ),
                                                                      validator:
                                                                          (String?
                                                                              value) {
                                                                        if (value ==
                                                                                null ||
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
                                              height: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      // width: 100,
                                                      // height: 50,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              ElevatedButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  fixedSize:
                                                                      WidgetStatePropertyAll(Size(
                                                                          200,
                                                                          30)),
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all<
                                                                              Color>(
                                                                          Color(
                                                                              0xFF233d63)),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Login',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Colors.white),
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
                                            SizedBox(height: 5),
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
                                                                  child: Text(
                                                                      "Or"),
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
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Center(
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                    ),
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFF233d63), // Button color
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(8),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <Widget>[
                                                                      FaIcon(
                                                                        FontAwesomeIcons
                                                                            .google,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              10),
                                                                      Text(
                                                                        'Sign in with Google',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              15,
                                                                          // fontWeight:
                                                                          //     FontWeight.w800,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    _handleSignIn();
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
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // SizedBox(
          //   height: 50,
          // ),
        ],
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
