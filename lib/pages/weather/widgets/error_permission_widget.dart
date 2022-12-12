import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorPermissionWidget extends StatefulWidget {
  final String routeName;
  const ErrorPermissionWidget({Key? key, required this.routeName})
      : super(key: key);

  @override
  State<ErrorPermissionWidget> createState() => _ErrorPermissionWidgetState();
}

class _ErrorPermissionWidgetState extends State<ErrorPermissionWidget> {
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
          const Text(
            "Error",
            style: TextStyle(color: Colors.red),
          ).tr(),
          SizedBox(height: 8),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(widget.routeName);
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
