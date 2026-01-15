import 'package:flutter/material.dart';
import 'package:flutter_aag4u/widgets/ArtikelSemutWidget.dart';

class ArtikelSemutPage extends StatefulWidget {
  const ArtikelSemutPage({super.key});

  @override
  State<ArtikelSemutPage> createState() => _ArtikelSemutPageState();
}

class _ArtikelSemutPageState extends State<ArtikelSemutPage> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Container(
          // color: Colors.amber,
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
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ArtikelSemutwidget()],
        ),
      )),
      // bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}