import 'package:dev_quiz/views/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomRadioListTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final SelectedTheme value;
  final SelectedTheme groupValue;
  final Function(SelectedTheme?)? onChanged;

  CustomRadioListTile({
    required this.title,
    this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  _CustomRadioListTileState createState() => _CustomRadioListTileState();
}

class _CustomRadioListTileState extends State<CustomRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile<SelectedTheme>(
        title: Text(
          widget.title,
        ),
        subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
        value: widget.value,
        groupValue: widget.groupValue,
        onChanged: widget.onChanged);
  }
}
