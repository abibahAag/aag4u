import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Blog/MenuBlogWidget.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true, actions: <Widget>[
        Container(
          // color: Colors.amber,
          width: screenWidth,
          height: 300,

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
                              "images/icons/aagu.png",
                              height: 50,
                              width: 100,
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
