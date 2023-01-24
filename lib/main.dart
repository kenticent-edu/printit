import 'package:flutter/material.dart';
import 'package:printit/screens/login_page.dart';

void main() {
  runApp(const PrintItApp());
}

class PrintItApp extends StatelessWidget {
  const PrintItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrintIt',
      theme: ThemeData.dark(),
      home: const LoginPage(),
    );
  }
}
