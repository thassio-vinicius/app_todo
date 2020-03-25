import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;

  StyledText({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22,
        color: Color(0xff9DA1A6),
      ),
    );
  }
}
