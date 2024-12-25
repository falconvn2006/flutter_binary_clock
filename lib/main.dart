import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;

import 'home_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Binary Clock",
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          displaySmall: TextStyle(color: Colors.grey, fontSize: 30),
        ),
        fontFamily: 'Alatsi',
      ),
      home: HomePage(),
    );
  }
}