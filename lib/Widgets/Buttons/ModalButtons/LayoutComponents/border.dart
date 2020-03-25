import 'package:flutter/material.dart';

class BuildBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.03,
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      decoration: BoxDecoration(
        border:
            Border.all(color: Color(0xff9DA1A6).withOpacity(0.40), width: 0.5),
      ),
    );
  }
}
