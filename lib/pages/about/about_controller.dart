import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/constants/prefs_constants.dart';
import 'package:weather/locator.dart';
import 'package:weather/models/app.dart';

mixin AboutController<T extends StatefulWidget> on State<T> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String unit = "";
  AppModel app = locator<AppModel>();
  late SharedPreferences prefs;
  PackageInfo packageInfo = PackageInfo(
    appName: '-',
    packageName: '-',
    version: '-',
    buildNumber: '-',
  );

  @override
  void initState() {
    super.initState();
    getPackageInfo();
    getPreferences();
  }

  Future<void> getPreferences() async {
    await SharedPreferences.getInstance()
        .then((preferences) => prefs = preferences);
  }

  Future<void> getPackageInfo() async {
    final info = await PackageInfo.fromPlatform();

    setState(() {
      packageInfo = info;
    });
  }

  setUnit(String value) {
    unit = value;
    app.unit = value;
    prefs.setString(PrefsConstants.unit, value);
    setState(() {});
  }
}
