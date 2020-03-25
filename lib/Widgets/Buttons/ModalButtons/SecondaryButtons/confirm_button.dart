import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final onTap;
  final Color color;
  final String buttonAction;

  ConfirmButton(
      {@required this.onTap,
      @required this.color,
      @required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.07,
          child: Center(
            child: Text(
              buttonAction,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
