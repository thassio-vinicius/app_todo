import 'package:flutter/material.dart';

class ModalIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  ModalIcon({@required this.icon, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Icon(
        icon,
        color: color,
        size: 24,
      ),
    );
  }
}
