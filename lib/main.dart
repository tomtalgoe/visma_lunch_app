import 'package:flutter/material.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  void _plussCounter() {
    setState(() {
      _counter++;
    });
  }

  void _minusCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lunch'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_counter',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _plussCounter,
                    child: Text('+'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _minusCounter,
                    child: Text(
                      '-',
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBaren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: DateTimeBar(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}

class DateTimeBar extends StatefulWidget {
  @override
  _DateTimeBarState createState() => _DateTimeBarState();
}

class _DateTimeBarState extends State<DateTimeBar> {
  String formattedDateTime = '';

  @override
  void initState() {
    super.initState();
    updateTime();
  }

  void updateTime() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    String formattedTime = DateFormat('HH:mm:ss').format(now);
    setState(() {
      formattedDateTime = '$formattedDate - $formattedTime';
    });
    Future.delayed(Duration(seconds: 1), updateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formattedDateTime,
      style: TextStyle(fontSize: 18),
    );
  }
}
