import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/constants/app_constants.dart';
import 'package:weather/constants/prefs_constants.dart';
import 'package:weather/locator.dart';
import 'package:weather/managers/update_app_manager.dart';
import 'package:weather/models/app.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/services/api_openweathermap_service.dart';

mixin WeatherController<T extends StatefulWidget> on State<T> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var data;
  Widget? error;
  String? city;
  bool permission = false;
  AppModel app = locator<AppModel>();
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    checkPermissions();
    getPreferences();

    UpdateAppManager().update();

    Future.delayed(Duration.zero, () {
      getInitial();
      setState(() {});
    });
  }

  getPreferences() async {
    await SharedPreferences.getInstance()
        .then((preferences) => prefs = preferences);
  }

  checkPermissions() async {
    permission = await Permission.location.request().isGranted;
    if (await Permission.location.request().isDenied) {
      openAppSettings();
    }
  }

  String getTime(int timestamp) {
    return DateFormat('HH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
  }

  getInitial() async {
    data = await getWeather();
    setState(() {});
  }

  Future<Weather?> getWeather({String? city}) async {
    var res;
    bool debug = false;
    if (!debug) {
      try {
        String? cityPrefs = await prefs.getString(PrefsConstants.city);
        if (city == null && cityPrefs == null) {
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low,
          );
          await prefs.setDouble(PrefsConstants.lat, position.latitude);
          await prefs.setDouble(PrefsConstants.long, position.longitude);
          await prefs.remove(PrefsConstants.city);
        } else {
          await prefs.setString(PrefsConstants.city, city ?? cityPrefs!);
          await prefs.remove(PrefsConstants.lat);
          await prefs.remove(PrefsConstants.long);
        }

        res = await APIOpenWeatherMapService().getWeather(
          "weather",
          lang: context.locale.toString(),
          units: AppConstants.unitMap[app.unit],
          query: await prefs.getString(PrefsConstants.city),
          latitude: await prefs.getDouble(PrefsConstants.lat),
          longitude: await prefs.getDouble(PrefsConstants.long),
        );

        if (res.statusCode != 200 || res == null) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: tr(res.data["message"]),
            confirmBtnText: 'Ok',
            confirmBtnColor: Colors.red,
            backgroundColor: Theme.of(context).backgroundColor,
            titleColor: Theme.of(context).primaryColor,
            textColor: Theme.of(context).primaryColor,
            onConfirmBtnTap: () async {},
          );
        }
      } catch (e) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: e.toString().tr(),
          confirmBtnText: 'Ok',
          confirmBtnColor: Colors.red,
          backgroundColor: Theme.of(context).backgroundColor,
          titleColor: Theme.of(context).primaryColor,
          textColor: Theme.of(context).primaryColor,
          onConfirmBtnTap: () async {
            Navigator.pop(context);
          },
        );
      }
      if (res == null) {
        return null;
      }
      return Weather.fromJson(res.data);
    } else {
      res =
          '{          "coord": {    "lon": -53.5209,    "lat": -26.7266    },    "weather": [    {    "id": 800,    "main": "Clear",    "description": "céu limpo",    "icon": "01d"    }    ],    "base": "stations",    "main": {    "temp": 21.9,    "feels_like": 21.5,    "temp_min": 19.58,    "temp_max": 21.9,    "pressure": 1023,    "humidity": 52,    "sea_level": 1023,    "grnd_level": 950    },    "visibility": 10000,    "wind": {    "speed": 2.37,    "deg": 137,    "gust": 3.02    },    "clouds": {    "all": 0    },    "dt": 1667494538,    "sys": {    "type": 2,    "id": 2019068,    "country": "BR",    "sunrise": 1667464950,    "sunset": 1667512362    },    "timezone": -10800,    "id": 3448454,    "name": "São Miguel do Oeste",    "cod": 200    }';
      return Weather.fromJson(jsonDecode(res));
    }
  }
}
