import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfigMenuTitle extends StatefulWidget {
  final String text;
  const ConfigMenuTitle({Key? key, required this.text}) : super(key: key);

  @override
  State<ConfigMenuTitle> createState() => _ConfigMenuTitleState();
}

class _ConfigMenuTitleState extends State<ConfigMenuTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ).tr(),
    );
  }
}
