import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  // const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  // color: Colors.amber,
                  width: 340,
                  height: 200,
                  //  width: MediaQuery.of(context).size.width * 0.5,
                  // height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 27, 21, 210),
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFcddcff),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Info"),
                                                  content: Text("Coming soon"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.home,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // const SizedBox(height: 5,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Container(child: Text("dataa"))],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFcddcff),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Info"),
                                                  content: Text("Coming soon"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.home,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // const SizedBox(height: 5,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Container(child: Text("data"))],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFcddcff),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Info"),
                                                  content: Text("Coming soon"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.home,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // const SizedBox(height: 5,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Container(child: Text("data"))],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFcddcff),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Info"),
                                                  content: Text("Coming soon"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.home,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // const SizedBox(height: 5,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Container(child: Text("data"))],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFcddcff),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Info"),
                                                  content: Text("Coming soon"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.home,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // const SizedBox(height: 5,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Container(child: Text("data"))],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFcddcff),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Info"),
                                                  content: Text("Coming soon"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.home,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // const SizedBox(height: 5,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Container(child: Text("data"))],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFcddcff),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Info"),
                                                  content: Text("Coming soon"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.home,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // const SizedBox(height: 5,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Container(child: Text("data"))],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFcddcff),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Info"),
                                                  content: Text("Coming soon"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.home,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // const SizedBox(height: 5,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [Container(child: Text("data"))],
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}