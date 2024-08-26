import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {

  bool isLoading = false;

  void loginAccount(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    // Login Server Api Use Here
    Future.delayed(const Duration(milliseconds: 1000), () {
      isLoading = false;
      notifyListeners();
    });
  }

  void signupAccount(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    // Signup Server Api Use Here
    Future.delayed(const Duration(milliseconds: 1000), () {
      isLoading = false;
      notifyListeners();
    });
  }

}