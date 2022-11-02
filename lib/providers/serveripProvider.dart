import 'package:flutter/material.dart';

import "package:flutter/material.dart";

class ServerIp with ChangeNotifier {
  String _server_address = "192.168.1.1";
  String get server_address => _server_address;
  void setAddress(String newAdress) {
    _server_address = newAdress;
    notifyListeners();
  }
}
