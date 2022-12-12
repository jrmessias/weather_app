import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/api/device_info_api.dart';
import 'package:weather/constants/prefs_constants.dart';
import 'package:weather/locator.dart';
import 'package:weather/managers/update_app_manager.dart';
import 'package:weather/models/app.dart';
import 'package:weather/pages/about/about_screen.dart';
import 'package:weather/pages/settings/settings_screen.dart';
import 'package:weather/pages/weather/weather_screen.dart';
import 'package:weather/themes.dart';

const bool inProduction = bool.fromEnvironment('dart.vm.product');
AppModel app = locator<AppModel>();
late StreamSubscription<ConnectivityResult> _connectivitySubscription;
late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await dotenv.load(fileName: ".env");

  setupLocator();

  app.inProduction = inProduction;

  debugPrint("Production: $inProduction");
  if (inProduction) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  await SharedPreferences.getInstance()
      .then((preferences) => prefs = preferences);

  await DeviceInfoApi().get().then((deviceData) => app.deviceData = deviceData);

  if (prefs.getString(PrefsConstants.unit) != null) {
    app.unit = prefs.getString(PrefsConstants.unit)!;
  }
  if (prefs.getString(PrefsConstants.city) != null) {
    app.city = prefs.getString(PrefsConstants.city)!;
  }

  if (prefs.getString(PrefsConstants.unit) == null) {
    app.unit = "celsius";
    prefs.setString(PrefsConstants.unit, "celsius");
  }

  if (prefs.getString(PrefsConstants.city) == null) {
    app.city = "São Miguel do Oeste";
    prefs.setString(PrefsConstants.city, "São Miguel do Oeste");
  }

  InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 5),
    checkInterval: const Duration(seconds: 3),
  );

  // Initial Connection
  app.hasConnection = await InternetConnectionChecker().hasConnection;
  _connectivitySubscription = Connectivity()
      .onConnectivityChanged
      .listen((ConnectivityResult result) async {
    app.hasConnection = await InternetConnectionChecker().hasConnection;
  });

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppModel(),
      child: EasyLocalization(
        supportedLocales: const [
          Locale('pt', 'BR'),
          Locale('en'),
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('pt', 'BR'),
        saveLocale: true,
        child: EasyDynamicThemeWidget(
          child: const WeatherApp(),
        ),
      ),
    ),
  );
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  void initState() {
    super.initState();

    UpdateAppManager().init();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: EasyDynamicTheme.of(context).themeMode!,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const WeatherScreen(),
      initialRoute: '/',
      routes: {
        '/settings': (context) => const SettingsScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
