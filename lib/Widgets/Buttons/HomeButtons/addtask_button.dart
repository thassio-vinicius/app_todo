import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  final Color color;
  final Widget label;
  final Function onPressed;

  const AddTaskButton(
      {@required this.color, @required this.label, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      height: 64.0,
      width: 64.0,
      child: FloatingActionButton.extended(
          label: label,
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: onPressed),
    );
  }
}
