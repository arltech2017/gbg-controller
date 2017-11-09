Library main;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async'; 

class ControlPage extends StatefulWidget {
  ControlPage({Key key, GoApp mainapp}) : super(key: key) {
    app = mainapp;
    _state = new _ControlPageState(mainapp);
  } 

  ControlPageState state;
  GoApp app;
  
  updateState() => _state.updateState();

  setText(String s) => _state.setText(s);
  
  @override
  _ControlPageState createState() => _state;
}

class _ControlPageState extends State<ControlPage> {
  
  /*The variables that the page uses to display it's content.
    These are updated to match the ones in GoApp. These exist
    because when first initializing the widgets, this class
    cannot access GoApp, and so must have its own set of
    variables then are then updated to match GoApp's.
  */  
  StopButton stopButton;

  _ControlPageState(GoApp app) => stopButton = new StopButton(app);

  /*Returns the string the page should display that tells the
    user how long until the car can be restarted. When the
    countdown is not running, it returns an empty string so
    that the user will not see any text.
  */
  String getCountdownText() {
    if (widget.app.waiting) {
      return ("car locked for 5 seconds");
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          new Text(_running.toString(),
          style: Theme.of(context).textTheme.display1),
          new Padding(padding: new EdgeInsets.all(20.0),
            child: new RaisedButton(child: new Text("Scan"),
              onPressed: widget.app.scanBt),),
          new Padding(padding: new EdgeInsets.all(20.0),
            child: new RaisedButton(child: new Text("Connect"), 
              onPressed: widget.app.connect),),
          new Padding(padding: new EdgeInsets.all(20.0),
            child: stopButton),
          new Padding(padding: new EdgeInsets.only(bottom: 40.0),
              child: new Text(_countdownText.toString(),
                style: new TextStyle(
                  fontSize: 14.0))),
        ],
      ),
    );
  }
}
