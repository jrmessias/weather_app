import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:weather/pages/weather/weather_screen.dart';

class AppBarCustom extends StatelessWidget implements PreferredSize {
  final Widget child;
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  const AppBarCustom({
    Key? key,
    required this.child,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
      title: Center(
        child: Text(
          DateFormat('EE, d MMMM y', context.locale.toString())
              .format(DateTime.now())
              .toLowerCase(),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          tooltip: "Refresh".tr(),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(WeatherScreen.routeName);
          },
        ),
      ],
    );
  }
}
