import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_sign_in_demo_app/src/providers/authentication_provider.dart';
import 'package:quick_sign_in_demo_app/src/screens/main_tab_bar.dart';
import 'package:quick_sign_in_demo_app/src/screens/signup_screen.dart';
import 'package:quick_sign_in_demo_app/src/utils/navigation_utils.dart';
import 'package:quick_sign_in_demo_app/strings/strings.dart';
import 'package:quick_sign_in_demo_app/src/utils/app_colors.dart';
import 'package:quick_sign_in_demo_app/src/utils/app_images.dart';
import 'package:quick_sign_in_demo_app/src/components/custom_image.dart';
import 'package:quick_sign_in_demo_app/src/components/custom_button.dart';
import 'package:quick_sign_in_demo_app/src/components/loading_overlay.dart';
import 'package:quick_sign_in_demo_app/src/components/credential_textfield.dart';
import 'package:quick_sign_in_demo_app/src/components/underline_custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTFController = TextEditingController();
  TextEditingController passwordTFController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider> (
        builder:((context, authenticationProvider, child) =>
            Scaffold(
              body: LoadingOverlay(
                isLoading: authenticationProvider.isLoading,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      appIcon(),
                      CredentialTextField(
                        textFieldTitle: AppStrings.emailAddress,
                        isPasswordTextField: false,
                        showPasswordTapped: (){},
                        textFieldController: emailTFController,
                      ),
                      CredentialTextField(
                        textFieldTitle: AppStrings.password,
                        isPasswordTextField: true,
                        showPasswordTapped: (){},
                        textFieldController: passwordTFController,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(top: 20, right: 20),
                        child: UnderlineCustomButton(
                          buttonTitle: AppStrings.forgotPassword,
                          textColor: AppColors.instance.grey,
                          buttonTapped: () {
                            openForgotPasswordScreen(context);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        height: 50,
                        child: CustomButton(
                            buttonTitle: AppStrings.login,
                            fontSize: 16,
                            bgColor: AppColors.instance.buttonColor,
                            customButtonTapped: () {
                              loginButtonTapped(authenticationProvider);
                            }
                        ),
                      ),
                      signUpButton(),
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }

  Widget signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppStrings.doNotHaveAccount),
        const SizedBox(width: 10,),
        GestureDetector(
          onTap: openSignupScreen,
          child: Text(
            AppStrings.signup,
            style: TextStyle(
              color: AppColors.instance.buttonColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget appIcon() {
    return Container(
      margin: const EdgeInsets.only(top: 60, bottom: 70),
      child: CustomImage(imageAsset: AppImages.instance.appLogo, width: 150, height: 150),
    );
  }
  
  void back(BuildContext context) {
    Navigator.pop(context);
  }

  void loginButtonTapped(AuthenticationProvider authenticationProvider) {
    // authenticationProvider.loginAccount(context);
    NavigationUtils.push(context, const MainTabBar());
  }

  void openSignupScreen() {
    NavigationUtils.push(context, const SignupScreen());
  }

  void openForgotPasswordScreen(BuildContext context) {
  }

}