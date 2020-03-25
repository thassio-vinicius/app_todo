import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/LayoutComponents/button_textstyle.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/LayoutComponents/modal_icon.dart';

class TaskButton extends StatelessWidget {
  final ModalIcon modalIcon;
  final String text;
  final String autoSizeText;
  final bool isNewTaskModal;
  final onTap;

  TaskButton({
    @required this.autoSizeText,
    @required this.isNewTaskModal,
    this.onTap,
    this.modalIcon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            modalIcon,
            StyledText(
              text: text,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.04),
                  child: Text(
                    autoSizeText,
                    style: TextStyle(
                      fontSize: 22,
                      color: isNewTaskModal
                          ? Color(0xff9DA1A6)
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: onTap);
  }
}
