import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather/helpers/locale_helper.dart';
import 'package:weather/pages/settings/settings_controller.dart';
import 'package:weather/pages/settings/widgets/config_menu_item.dart';
import 'package:weather/pages/settings/widgets/config_menu_title.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = "/settings";

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SettingsController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text("Settings").tr(),
      ),
      body: SafeArea(
        child: Material(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: ListView(
              children: <Widget>[
                const ConfigMenuTitle(text: "Theme"),
                ConfigMenuItem(
                  text: "dark",
                  rounded: "top",
                  value: Brightness.dark,
                  groupValue: Theme.of(context).brightness,
                  onChanged: (value) {
                    EasyDynamicTheme.of(context).changeTheme();
                  },
                ),
                ConfigMenuItem(
                  text: "light",
                  rounded: "bottom",
                  value: Brightness.light,
                  groupValue: Theme.of(context).brightness,
                  onChanged: (value) {
                    EasyDynamicTheme.of(context).changeTheme();
                  },
                ),
                const ConfigMenuTitle(text: "Language"),
                ConfigMenuItem(
                  text: "en",
                  rounded: "top",
                  value: "en",
                  groupValue: context.locale.toString().replaceAll("_", "-"),
                  onChanged: (value) {
                    context.setLocale(LocaleFromLangCode("en"));
                  },
                ),
                ConfigMenuItem(
                  text: "pt-BR",
                  rounded: "bottom",
                  value: "pt-BR",
                  groupValue: context.locale.toString().replaceAll("_", "-"),
                  onChanged: (value) {
                    context.setLocale(LocaleFromLangCode("pt-BR"));
                  },
                ),
                const ConfigMenuTitle(text: "Unit"),
                ConfigMenuItem(
                  text: "celsius",
                  rounded: "top",
                  value: "celsius",
                  groupValue: app.unit,
                  onChanged: (value) {
                    setUnit(value);
                  },
                ),
                ConfigMenuItem(
                  text: "farenheit",
                  value: "farenheit",
                  groupValue: app.unit,
                  onChanged: (value) {
                    setUnit(value);
                  },
                ),
                ConfigMenuItem(
                  text: "kelvin",
                  rounded: "bottom",
                  value: "kelvin",
                  groupValue: app.unit,
                  onChanged: (value) {
                    setUnit(value);
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
