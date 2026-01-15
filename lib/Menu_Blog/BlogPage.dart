import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Blog/MenuBlogWidget.dart';
import 'package:flutter_aag4u/pages/homepage.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    double screenWidthicon = MediaQuery.of(context).size.width * 0.2;
    double screenheighticon = MediaQuery.of(context).size.width * 0.1;
    double screenWidtAppBar = MediaQuery.of(context).size.width;
    double iconSize = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: screenWidtAppBar * 0.10,
          // backgroundColor: Colors.amber,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: iconSize * 0.02,
              color: Colors.black,
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
          actions: <Widget>[
            Container(
              // color: Colors.amber,
              width: screenWidth,
              // height: 100,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  "images/icons/aag.png",
                                  height: screenheighticon,
                                  width: screenWidthicon,
                                ),
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
          ]),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [MenuBlogWidget()],
        ),
      )),
      // bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
