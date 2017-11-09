library utils;
import 'package:flutter/services.dart';
import 'dart:async';
	
abstract class Bluetooth {
  scanBt() => local("scan");
  closeBt() => local("close");
  connect() => local("connect");
  toggle() => local("toggle");

  //Connect using flutter_blue, not currently being used
  void flutterConnect() {
    DeviceIdentifier id = new DeviceIdentifier("B8:27:EB:9B:89:4E");
    var device = new BluetoothDevice(id: id);

    print("About to scan");
    scanSubscription = flutterBlue.scan().listen((scanResult) {
      print(scanResult.device.id.toString());
    });
  }
}
