import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfigMenuItem extends StatefulWidget {
  final String rounded;
  final String text;
  final dynamic groupValue;
  final Function(dynamic?) onChanged;
  final dynamic value;

  const ConfigMenuItem({
    Key? key,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.rounded = "none",
  }) : super(key: key);

  @override
  State<ConfigMenuItem> createState() => _ConfigMenuItemState();
}

class _ConfigMenuItemState extends State<ConfigMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.rounded == "top" ? 8 : 0),
          topRight: Radius.circular(widget.rounded == "top" ? 8 : 0),
          bottomLeft: Radius.circular(widget.rounded == "bottom" ? 8 : 0),
          bottomRight: Radius.circular(widget.rounded == "bottom" ? 8 : 0),
        ),
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.text.tr(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Radio(
            value: widget.value.toString(),
            groupValue: widget.groupValue.toString(),
            onChanged: widget.onChanged,
            activeColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
