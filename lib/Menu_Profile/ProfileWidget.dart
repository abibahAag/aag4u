import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  GoogleSignInAccount? user;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        user = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  void _handleSignOut() async {
    await _googleSignIn.signOut();
    setState(() {
      user = null; // Update state after sign out
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => homePage(isRegistered: false, isLoggedIn: false)), // Navigate to LoginPage
    );
  }

  @override
  Widget build(BuildContext context) {
    double inWidth = MediaQuery.of(context).size.width * 0.9;
    double screenWidth = MediaQuery.of(context).size.width * 1;
    double screenfullWidth = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        // appBar: Navbar(),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // color: Colors.amber,
              width: 100,
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
                                child: Text(
                              "Profile",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            )),
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
      ),
      body: SafeArea(
        child: user != null
            ? Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Container(
                                // color: Colors.amber,
                                width: 350,
                                height: 500,
                                child: Column(
                                  children: [
                                    Row(
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
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Name",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
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
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
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
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      " ${user!.displayName}",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
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
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Row(
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
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Email",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
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
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
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
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "${user!.email}",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
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
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
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
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    ElevatedButton(
                                                                      style: ButtonStyle(
                                                                          backgroundColor:
                                                                              WidgetStatePropertyAll(Colors.amber)),
                                                                      onPressed:
                                                                          _handleSignOut,
                                                                      child: Text(
                                                                          'Logout'),
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
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(34),
                            bottomLeft: Radius.circular(34)),
                      
                            ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // color: Colors.amber,
                              width: 300,
                              // height: 200,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                  radius: 80,
                                                  backgroundImage: NetworkImage(
                                                    user!.photoUrl ?? '',
                                                  )),
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
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
