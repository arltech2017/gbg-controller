Library main
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';

void main() {
  runApp(new GoApp(title: 'GoBabyGo'));
}

class GoApp extends StatelessWidget {
  GoApp({this.title}) {
    pageSelect = new PageSelect(title: 'GBG', mainapp: this);
    init();
  }

  static const platform = const MethodChannel('gbg.bluetooth');

  PageSelect pageSelect;

  final String title;

  //Variables for executing the delay before the user can restart the car.
  Timer timer;
  Timer bluetoothTimer;
  FlutterBlue flutterBlue;
  var connection;
  var scanSubscription;
  bool running = false;
  int countdown = 0;

  /*Called when the toggle button is pressed. If the car is running, disable it. If the car is not running and the countdown has ended, restart the car. */
  void toggleStop()
  {
    if(running) {
      running = false;
      countdown = 5;
      pageSelect.controlPage.updateState();
      _startTimer();
    }
    else if(countdown == 0) {
      running = true;
      pageSelect.controlPage.updateState();
    }
  }
  
  void _startTimer() {
    timer = new Timer(const Duration(seconds:1), _timerFinish);
  }

  void _timerFinish() {
    countdown--;
    if(countdown > 0) {
      _startTimer();
    }
    pageSelect.controlPage.updateState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "GoBabyGo",
      home: pageSelect, 
      routes: <String, WidgetBuilder> {
        '/bluetooth': (BuildContext context) => pageSelect.bluetoothPage,
        '/control': (BuildContext context) => pageSelect.controlPage,
      },
    );
  }
}
