import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/locator.dart';
import 'package:weather/models/app.dart';

mixin DrawerCustomController<T extends StatefulWidget> on State<T> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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

  closeDrawer() {
    Navigator.of(context).pop();
  }
}
