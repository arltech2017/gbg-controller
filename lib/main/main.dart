Library main;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';

void main() => runApp(new GoApp(title: 'GoBabyGo'));

class GoApp extends StatelessWidget {
  GoApp({this.title}) {
    pageSelect = new PageSelect(title: 'GBG', mainapp: this);
    init();
  }

  static const platform = const MethodChannel('gbg.bluetooth');
  PageSelect pageSelect;
  final String title;

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
