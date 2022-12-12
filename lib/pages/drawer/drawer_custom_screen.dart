import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/constants/app_images.dart';
import 'package:weather/constants/app_strings.dart';
import 'package:weather/constants/prefs_constants.dart';
import 'package:weather/pages/about/about_screen.dart';
import 'package:weather/pages/drawer/drawer_custom_controller.dart';
import 'package:weather/pages/settings/settings_screen.dart';
import 'package:weather/pages/weather/weather_screen.dart';

class DrawerCustomScreen extends StatefulWidget {
  const DrawerCustomScreen({Key? key}) : super(key: key);

  @override
  State<DrawerCustomScreen> createState() => _DrawerCustomScreenState();
}

class _DrawerCustomScreenState extends State<DrawerCustomScreen>
    with DrawerCustomController {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      width: mediaQuery.size.width * 0.60,
      child: Drawer(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Tooltip(
                              message: AppStrings.title,
                              child: Image.asset(
                                AppImages.logo,
                                height: 28,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Tooltip(
                              message: "Close".tr(),
                              child: InkWell(
                                onTap: () => closeDrawer(),
                                child: const FaIcon(
                                  FontAwesomeIcons.xmark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  leading: const FaIcon(
                    FontAwesomeIcons.house,
                  ),
                  title: Text(
                    "Home".tr(),
                    textAlign: TextAlign.start,
                  ),
                  onTap: () {
                    closeDrawer();
                    Navigator.of(context).pushNamed(WeatherScreen.routeName);
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  leading: const FaIcon(
                    FontAwesomeIcons.gear,
                  ),
                  title: Text(
                    "Settings".tr(),
                    textAlign: TextAlign.start,
                  ),
                  onTap: () {
                    closeDrawer();
                    Navigator.of(context).pushNamed(SettingsScreen.routeName);
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  leading: const FaIcon(
                    FontAwesomeIcons.locationDot,
                  ),
                  title: Text(
                    "Use location".tr(),
                    textAlign: TextAlign.start,
                  ),
                  onTap: () {
                    closeDrawer();
                    prefs.remove(PrefsConstants.city);
                    Navigator.of(context).pushNamed(WeatherScreen.routeName);
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  leading: const FaIcon(
                    FontAwesomeIcons.circleInfo,
                  ),
                  title: Text(
                    "About".tr(),
                    textAlign: TextAlign.start,
                  ),
                  onTap: () {
                    closeDrawer();
                    Navigator.of(context).pushNamed(AboutScreen.routeName);
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  leading: const FaIcon(
                    FontAwesomeIcons.rightFromBracket,
                  ),
                  title: Text(
                    "Exit".tr(),
                    textAlign: TextAlign.start,
                  ),
                  onTap: () {
                    closeDrawer();
                    SystemChannels.platform
                        .invokeMethod('SystemNavigator.pop', true);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
