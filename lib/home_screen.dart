import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SkillUp'), // YE HI TUMHARA LOGO/HEADER HAI
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text('Welcome to Home Screen!'),
      ),
    );
  }
}
