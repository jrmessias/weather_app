import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickalert/quickalert.dart';
import 'package:weather/constants/icon_weather.dart';
import 'package:weather/constants/prefs_constants.dart';
import 'package:weather/extensions/string_extension.dart';
import 'package:weather/helpers/convert_helper.dart';
import 'package:weather/main.dart';
import 'package:weather/pages/drawer/drawer_custom_screen.dart';
import 'package:weather/pages/weather/weather_controller.dart';
import 'package:weather/pages/weather/widgets/app_bar_custom.dart';
import 'package:weather/pages/weather/widgets/error_no_connection_widget.dart';
import 'package:weather/pages/weather/widgets/error_permission_widget.dart';
import 'package:weather/pages/weather/widgets/loader_widget.dart';

enum OptionsMenu { changeCity, settings, about, exit }

class WeatherScreen extends StatefulWidget {
  static const String routeName = "/";

  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> with WeatherController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(child: widget),
      drawer: const DrawerCustomScreen(),
      body: SafeArea(
        child: Material(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            constraints: const BoxConstraints.expand(),
            width: double.infinity,
            child: Builder(
              builder: (BuildContext context) {
                if (!app.hasConnection) {
                  return const ErrorNoConnectionWidget();
                }

                if (data == null) {
                  return const LoaderWidget();
                }

                if (!permission) {
                  return const ErrorPermissionWidget(routeName: "/");
                }

                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: GestureDetector(
                            onTap: () => {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.custom,
                                barrierDismissible: true,
                                confirmBtnText: "Search".tr(),
                                confirmBtnColor: Colors.green,
                                backgroundColor:
                                    Theme.of(context).backgroundColor,
                                // title: "Weather".tr(),
                                text: "Search by city".tr(),
                                titleColor: Theme.of(context).primaryColor,
                                textColor: Theme.of(context).primaryColor,
                                widget: TextField(
                                  style: const TextStyle(color: Colors.grey),
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    hintText: "Type a city name".tr(),
                                    hintStyle: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) => city = value,
                                ),
                                onConfirmBtnTap: () async {
                                  if (city == null) {
                                    await QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.error,
                                      title: "Error".tr(),
                                      text: "Please, type a city name".tr(),
                                      confirmBtnText: 'Ok',
                                      titleColor:
                                          Theme.of(context).primaryColor,
                                      textColor: Theme.of(context).primaryColor,
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                    );
                                    return;
                                  }
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.loading,
                                    title: "Loading".tr(),
                                    text: "Searching weather data".tr(),
                                    titleColor: Theme.of(context).primaryColor,
                                    textColor: Theme.of(context).primaryColor,
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                  );
                                  app.city = city!;
                                  prefs.setString(PrefsConstants.city, city!);
                                  await getWeather(city: city!).then((res) {
                                    data = res;
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    setState(() {});
                                  });
                                },
                              )
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${data.name.toUpperCase()} (${data.sys.country.toString().toUpperCase()})",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.change_circle,
                                  color: Theme.of(context).secondaryHeaderColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            data.weather[0].description
                                .toString()
                                .toCapitalized(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: SvgPicture.asset(
                            data.weather[0].getIcon(),
                            color: Theme.of(context).primaryColor,
                            width: 128,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            convertTemperature(
                              data.main.temp.toInt(),
                              app.unit,
                            ),
                            style: const TextStyle(
                              fontSize: 64,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: IntrinsicHeight(
                            child: SizedBox(
                              width: double.infinity / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      const Text("max").tr(),
                                      Text(
                                        convertTemperature(
                                          data.main.tempMax.toInt(),
                                          app.unit,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(),
                                  Column(
                                    children: [
                                      const Text("min").tr(),
                                      Text(
                                        convertTemperature(
                                          data.main.tempMin.toInt(),
                                          app.unit,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(),
                                  Column(
                                    children: [
                                      const Text("feel").tr(),
                                      Text(
                                        convertTemperature(
                                          data.main.feelsLike.toInt(),
                                          app.unit,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: IntrinsicHeight(
                            child: SizedBox(
                              width: double.infinity / 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                        IconWeather.sunrise,
                                        color: Theme.of(context).primaryColor,
                                        width: 24,
                                      ),
                                      Text(getTime(data.sys.sunrise)),
                                    ],
                                  ),
                                  const VerticalDivider(),
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                        IconWeather.sunset,
                                        color: Theme.of(context).primaryColor,
                                        width: 24,
                                      ),
                                      Text(getTime(data.sys.sunset)),
                                    ],
                                  ),
                                  const VerticalDivider(),
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                        data.wind.getIcon(),
                                        color: Theme.of(context).primaryColor,
                                        width: 24,
                                      ),
                                      Text("${data.wind.speed.toString()} m/s"),
                                    ],
                                  ),
                                  const VerticalDivider(),
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                        IconWeather.humidity,
                                        color: Theme.of(context).primaryColor,
                                        width: 24,
                                      ),
                                      Text(
                                        data.main.humidity.toInt().toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      // floatingActionButton: const FloatingActionButtonWidget(),
    );
  }
}
