import 'package:flutter/widgets.dart';

class AppModel extends ChangeNotifier {
  bool _hasConnection = false;
  bool _inProduction = true;
  String _unit = "";
  String _city = "";
  Map<String, dynamic> _deviceData = {};

  bool get hasConnection => _hasConnection;

  set hasConnection(bool hasConnection) {
    _hasConnection = hasConnection;
    notifyListeners();
  }

  bool get inProduction => _inProduction;

  set inProduction(bool inProduction) {
    _inProduction = inProduction;
    notifyListeners();
  }

  String get unit => _unit;

  set unit(String unit) {
    _unit = unit;
    notifyListeners();
  }

  String get city => _city;

  set city(String city) {
    _city = city;
    notifyListeners();
  }

  Map<String, dynamic> get deviceData => _deviceData;

  set deviceData(Map<String, dynamic> deviceData) {
    _deviceData = deviceData;
    notifyListeners();
  }

  @override
  String toString() => 'AppModel (\n'
      'hasConnection: $hasConnection, \n'
      'inProduction: $inProduction, \n'
      'unit: $unit, \n'
      'city: $city, \n'
      'deviceData: $deviceData, \n'
      ')';
}
