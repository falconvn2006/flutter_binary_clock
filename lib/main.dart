import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:flutter_application_test/timestop.dart';

import 'clock.dart';

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
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          displaySmall: TextStyle(color: Colors.grey, fontSize: 30),
        ),
        fontFamily: 'Alatsi',
      ),
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue,),
        body: TimeStop(),
      ),
    );
  }
}