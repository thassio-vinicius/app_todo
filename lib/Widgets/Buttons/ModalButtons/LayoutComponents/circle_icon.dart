import 'package:flutter/material.dart';

class CircleIcon extends StatefulWidget {
  final double width;
  final double height;
  final bool isCompleted;
  final bool isModalIcon;

  CircleIcon({
    @required this.width,
    @required this.height,
    @required this.isModalIcon,
    this.isCompleted = false,
  });

  @override
  _CircleIconState createState() => _CircleIconState();
}

class _CircleIconState extends State<CircleIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.isModalIcon
            ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.035)
            : null,
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.isCompleted ? Colors.black : Colors.transparent,
          border: Border.all(
            color: Color(0xff9DA1A6),
          ),
        ),
        child: widget.isCompleted
            ? Icon(
                Icons.check,
                color: Colors.white,
              )
            : null);
  }
}
