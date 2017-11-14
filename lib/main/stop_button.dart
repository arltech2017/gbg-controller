Library main;
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:async';

class StopButton extends StatefulWidget {
  StopButton(GoApp app) {
    this.app = app;
    state = new StopButtonState();
  }

  StopButtonState state;
  GoApp app;
  
  @override
  StopButtonState createState() => state; 
}



class StopButtonState extends State<StopButton> {
  bool waiting = false;
  
  void pressed() => widget.app.toggle();
  wait(int time) => new Timer(const Duration(seconds:time), () => waiting = false;);

  void toggleStop() {
    if !waiting {
      waiting =  running;
      running = !running;
      if waiting {
        wait(5);
      }
    }
  }
  
  Widget build(BuildContext context) {
    return new MaterialButton(
        child: new Text('Toggle',
          style: new TextStyle(fontSize: 30.0)),
        color: const Color.fromARGB(255, 255, 0, 0),
        onPressed: _pressed,
        minWidth: 230.0,
        height: 100.0,
        elevation: 4.0,
        highlightElevation: 4.0,
    );
  }
}
