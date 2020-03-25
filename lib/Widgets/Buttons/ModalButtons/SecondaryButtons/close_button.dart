import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.close,
          color: Color(0xff737880),
          size: 25,
        ),
      ),
    );
  }
}
