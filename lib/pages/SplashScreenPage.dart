import 'package:flutter/material.dart';
import 'package:flutter_aag4u/pages/homepage.dart';
import 'package:flutter_aag4u/widgets/SplashScreen.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            return Scaffold(
              body: SafeArea(
                  child: homePage(isRegistered: false, isLoggedIn: false)),
            );
          }
        });
  }
}
