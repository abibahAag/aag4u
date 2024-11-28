import 'package:flutter/material.dart';
import 'package:flutter_aag4u/template/navbar.dart';

class PushNotifications extends StatelessWidget {
  const PushNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: Navbar(),
      ),
    );
  }
}
