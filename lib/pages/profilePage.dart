import 'package:flutter/material.dart';
// import 'package:flutter_aag4u/template/navbar.dart';
// import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';
// import 'package:flutter_aag4u/widgets/HomeBottomNavBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Navbar(),
      body: SafeArea(
          child: Column(
        children: [
          // Image.asset('images/blog/artikel.jpg')
          Text(" PROFILE")
        ],
      ),
      ),
      // bottomNavigationBar: HomeBottomNavBar(),
    );
  }
}
