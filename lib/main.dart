import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(PetApp());
}

class PetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Petz',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      home: LoginPage(), // Aqui começa pelo Login
    );
  }
}
