import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(InstagramApp());
}

class InstagramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: LoginScreen(),
    );
  }
}
