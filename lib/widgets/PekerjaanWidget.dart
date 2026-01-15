import 'package:flutter/material.dart';

class Pekerjaanwidget extends StatelessWidget {
  final String email;
  final String name; // Data tambahan misalnya nama pengguna
  final String phoneNumber; // Data tambahan misalnya nomor telepon

  Pekerjaanwidget(
      {required this.email, required this.name, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Email: $email', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Name: $name', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Phone Number: $phoneNumber', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
