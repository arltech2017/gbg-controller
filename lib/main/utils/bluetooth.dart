library utils;
import 'package:flutter/services.dart';

abstract class Bluetooth {
  scanBt() => local("scan");
  closeBt() => local("close");
  connect() => local("connect");
  toggle() => local("toggle");
}
