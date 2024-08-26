import 'package:flutter/material.dart';
import 'package:quick_sign_in_demo_app/src/utils/app_colors.dart';
import 'package:quick_sign_in_demo_app/src/utils/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final Color bgColor;
  final double fontSize;
  final VoidCallback customButtonTapped;
  const CustomButton({super.key, required this.buttonTitle, required this.fontSize, required this.bgColor, required this.customButtonTapped});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: customButtonTapped,
      style: FilledButton.styleFrom(
        elevation: bgColor == AppColors.instance.whiteColor ? 5 : 0,
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        buttonTitle,
        style: TextStyle(
          color: bgColor == AppColors.instance.whiteColor ? AppColors.instance.blackColor : AppColors.instance.whiteColor,
          fontSize: fontSize,
          fontFamily: AppFonts.instance.sanFrancisco,
        ),
      ),
    );
  }

}