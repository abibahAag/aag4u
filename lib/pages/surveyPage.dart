import 'package:flutter/material.dart';
import 'package:flutter_aag4u/template/navbar.dart';
// import 'package:flutter_aag4u/template/navbar.dart';
// import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';
// import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "SURVEY",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Text(
                                  "COMING SOON",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),
                ),
              ],
            )
          ],
        ),
      ),
      // bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
