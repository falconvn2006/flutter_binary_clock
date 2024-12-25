import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BinaryTimeStop {
  List<String> binaryIntegers = List.empty();

  int tick = 0;
  String hhmmss = "000000";

  BinaryTimeStop() {
    binaryIntegers = hhmmss.split('').map((str) => int.parse(str).toRadixString(2).padLeft(4, '0')).toList();
  }

  get hourTens => binaryIntegers[0];
  get hourOnes => binaryIntegers[1];
  get minuteTens => binaryIntegers[2];
  get minuteOnes => binaryIntegers[3];
  get secondTens => binaryIntegers[4];
  get secondOnes => binaryIntegers[5];

  void updateTick(){
    tick++;
    hhmmss = tick.toString().padLeft(6, '0');
    binaryIntegers = hhmmss.split('').map((str) => int.parse(str).toRadixString(2).padLeft(4, '0')).toList();
  }
}

class TimeStop extends StatefulWidget {
  const TimeStop({super.key});

  @override
  State<TimeStop> createState() => _TimeStopState();
}

class _TimeStopState extends State<TimeStop> {
  BinaryTimeStop _timeStop = BinaryTimeStop();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _timeStop.updateTick();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Columns for the clock
          ClockColumn(
            binaryInteger: _timeStop.hourTens,
            title: 'H',
            color: Colors.blue,
            rows: 2
          ),
          ClockColumn(
            binaryInteger: _timeStop.hourOnes,
            title: 'h',
            color: Colors.lightBlue,
          ),
          ClockColumn(
            binaryInteger: _timeStop.minuteTens,
            title: 'M',
            color: Colors.green,
            rows: 3
          ),
          ClockColumn(
            binaryInteger: _timeStop.minuteOnes,
            title: 'm',
            color: Colors.lightGreen,
          ),
          ClockColumn(
            binaryInteger: _timeStop.secondTens,
            title: 'S',
            color: Colors.pink,
            rows: 3
          ),
          ClockColumn(
            binaryInteger: _timeStop.secondOnes,
            title: 's',
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}

class ClockColumn extends StatelessWidget {
  String binaryInteger;
  String title;
  Color color;
  int rows;
  List bits = List.empty();

  ClockColumn({this.binaryInteger = '', this.title = '', this.color = Colors.black, this.rows = 4}) {
    bits = binaryInteger.split('');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...[
          Container(
            child: Text(
              title,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          )
        ],
        ...bits.asMap().entries.map((entry) {
          var idx = entry.key;
          String bit = entry.value;

          bool isActive = bit == '1';
          var binaryCellValue = pow(2, 3 - idx);

          return AnimatedContainer(
            duration: Duration(milliseconds: 475),
              curve: Curves.ease,
              height: 40,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: isActive ? color : idx < 4 - rows ? Colors.white.withOpacity(0) : Colors.black38
              ),
              margin: EdgeInsets.all(4),
              child: Center(
                child: isActive
                  ? Text(
                    binaryCellValue.toString(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.2),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                    ),
                  )
                  : Container(),
              )
            );
        }),
        ...[
          Text(int.parse(binaryInteger, radix: 2).toString(), style: TextStyle(fontSize: 30, color: color)),
          Container(
            child: Text(
              binaryInteger,
              style: TextStyle(fontSize: 15, color: color),
            ),
          )
        ],
      ],
    );
  }
}