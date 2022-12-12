import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDoubleBounce(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.grey[300],
        size: 50.0,
      ),
    );
  }
}
