import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:weather/constants/icon_weather.dart';
import 'package:weather/helpers/url_helper.dart';
import 'package:weather/managers/update_app_manager.dart';
import 'package:weather/pages/about/about_controller.dart';

class AboutScreen extends StatefulWidget {
  static const String routeName = "/about";

  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> with AboutController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text("About").tr(),
      ),
      body: SafeArea(
        child: Material(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("email@gmail.com\n99 99999 9999"),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [FaIcon(FontAwesomeIcons.dev)],
                  ),
                  isThreeLine: true,
                  onTap: () => launchWhatsapp("5599999999999", "Weather App"),
                ),
                ListTile(
                  title: Text(
                    packageInfo.appName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                      "${packageInfo.version} (b ${packageInfo.buildNumber})"),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.android,
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () async => UpdateAppManager().update(),
                    child: FaIcon(FontAwesomeIcons.googlePlay),
                  ),
                ),
                ListTile(
                  title: Text(
                    "OpenWeather",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "https://openweathermap.org/",
                    style: TextStyle(fontSize: 12),
                  ),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.sun,
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () async =>
                        launchUrlString("https://openweathermap.org/"),
                    child: FaIcon(FontAwesomeIcons.arrowUpRightFromSquare),
                  ),
                ),
                ListTile(
                  title: Text(
                    "WeatherIcons",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "https://erikflowers.github.io/weather-icons/",
                    style: TextStyle(fontSize: 12),
                  ),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconWeather.dayLightning,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () async => launchUrlString(
                        "https://erikflowers.github.io/weather-icons/"),
                    child: FaIcon(FontAwesomeIcons.arrowUpRightFromSquare),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Font Awesome",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "https://fontawesome.com/",
                    style: TextStyle(fontSize: 12),
                  ),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.fontAwesome),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () async =>
                        launchUrlString("https://fontawesome.com/"),
                    child: FaIcon(FontAwesomeIcons.arrowUpRightFromSquare),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
