import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_sign_in_demo_app/src/screens/main_tab_bar.dart';
import 'package:quick_sign_in_demo_app/src/utils/navigation_utils.dart';
import 'package:quick_sign_in_demo_app/strings/strings.dart';
import 'package:quick_sign_in_demo_app/src/utils/app_colors.dart';
import 'package:quick_sign_in_demo_app/src/utils/app_images.dart';
import 'package:quick_sign_in_demo_app/src/components/custom_image.dart';
import 'package:quick_sign_in_demo_app/src/components/custom_button.dart';
import 'package:quick_sign_in_demo_app/src/components/loading_overlay.dart';
import 'package:quick_sign_in_demo_app/src/components/credential_textfield.dart';
import 'package:quick_sign_in_demo_app/src/providers/authentication_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController nameTFController = TextEditingController();
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
                        textFieldTitle: AppStrings.fullName,
                        isPasswordTextField: false,
                        showPasswordTapped: (){},
                        textFieldController: nameTFController,
                      ),
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
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        height: 50,
                        child: CustomButton(
                            buttonTitle: AppStrings.signup,
                            fontSize: 16,
                            bgColor: AppColors.instance.buttonColor,
                            customButtonTapped: () {
                              signupButtonTapped(authenticationProvider);
                            }
                        ),
                      ),
                      loginButton(),
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }

  Widget loginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppStrings.alreadyHaveAccount),
        const SizedBox(width: 10,),
        GestureDetector(
          onTap: backToLogin,
          child: Text(
            AppStrings.login,
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

  void signupButtonTapped(AuthenticationProvider authenticationProvider) {
    // authenticationProvider.signupAccount(context);
    NavigationUtils.push(context, const MainTabBar());
  }

  void backToLogin() {
    NavigationUtils.pop(context);
  }

}