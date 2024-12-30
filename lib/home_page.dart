import 'package:flutter/material.dart';

import 'clock.dart';
import 'timestop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    Clock(),
    TimeStop(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPageIndex == 0 ? "Binary Clock" : _currentPageIndex == 1 ? "Binary Stopwatch" : ""),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index) => setState(() {
          _currentPageIndex = index;
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.watch_later), label: "Clock"),
          BottomNavigationBarItem(icon: Icon(Icons.watch_rounded), label: "Stopwatch"),
        ],
      ),
    );
  }
}