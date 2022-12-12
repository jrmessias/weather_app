import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorNoConnectionWidget extends StatefulWidget {
  const ErrorNoConnectionWidget({Key? key}) : super(key: key);

  @override
  State<ErrorNoConnectionWidget> createState() =>
      _ErrorNoConnectionWidgetState();
}

class _ErrorNoConnectionWidgetState extends State<ErrorNoConnectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning,
            color: Colors.red,
            size: 24.0,
          ),
          Text(
            "No connection".tr(),
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(height: 8),
          FloatingActionButton.extended(
            onPressed: () async {
              // data = await getWeather();
              // setState(() {});
            },
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[800]
                : Colors.grey[300],
            icon: Icon(
              Icons.refresh,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              "Refresh",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ).tr(),
          ),
        ],
      ),
    );
  }
}
