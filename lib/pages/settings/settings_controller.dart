import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/constants/prefs_constants.dart';
import 'package:weather/locator.dart';
import 'package:weather/models/app.dart';

mixin SettingsController<T extends StatefulWidget> on State<T> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String unit = "";
  AppModel app = locator<AppModel>();
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  getPreferences() async {
    await SharedPreferences.getInstance()
        .then((preferences) => prefs = preferences);
  }

  setUnit(String value) {
    unit = value;
    app.unit = value;
    prefs.setString(PrefsConstants.unit, value);
    setState(() {});
  }
}
