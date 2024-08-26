import 'package:flutter/material.dart';
import 'package:quick_sign_in_demo_app/src/utils/utils.dart';
import 'package:quick_sign_in_demo_app/strings/strings.dart';
import 'package:quick_sign_in_demo_app/src/utils/app_colors.dart';

class CredentialTextField extends StatefulWidget {
  final String textFieldTitle;
  bool isPasswordTextField;
  final VoidCallback showPasswordTapped;
  final TextEditingController textFieldController;
  CredentialTextField({super.key, required this.textFieldTitle, required this.isPasswordTextField, required this.showPasswordTapped, required this.textFieldController});
  @override
  State<CredentialTextField> createState() => _CredentialTextFieldState();
}

class _CredentialTextFieldState extends State<CredentialTextField> {

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          credentialTitle(),
          credentialTextField(),
        ],
      ),
    );
  }

  Widget credentialTitle() {
    return Row(children: [
      Container(
        margin: const EdgeInsets.all(0),
        height: 20,
        child: Text(
          widget.textFieldTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      const Spacer(),
      Visibility(
        visible: widget.isPasswordTextField,
        child: GestureDetector(
          onTap: showPassword,
          child: Text(
            isPasswordVisible ? AppStrings.show : AppStrings.hide,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    ],);
  }

  Widget credentialTextField() {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: TextField(
        obscureText: widget.isPasswordTextField ? isPasswordVisible : false,
        controller: widget.textFieldController,
        style: const TextStyle(
          fontSize: 14,  // Set the desired font size here
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: -10),
          hintText: Utils.instance.getCredentialsHint(widget.textFieldTitle),
          hintStyle: TextStyle(color: AppColors.instance.lightGray, fontSize: 14,),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.instance.buttonColor,),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.instance.grey,),
          ),
        ),
      ),
    );
  }

  void showPassword() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

}