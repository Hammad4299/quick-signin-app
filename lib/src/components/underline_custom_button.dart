import 'package:flutter/material.dart';

class UnderlineCustomButton extends StatelessWidget {
  String buttonTitle;
  Color textColor;
  final VoidCallback buttonTapped;
  UnderlineCustomButton({super.key, required this.buttonTitle, required this.textColor, required this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Text(
        buttonTitle,
        style: TextStyle(
          fontSize: 13,
          color: textColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

}