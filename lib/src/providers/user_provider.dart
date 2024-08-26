import 'package:flutter/material.dart';
import 'package:quick_sign_in_demo_app/src/models/post_model.dart';
import 'package:quick_sign_in_demo_app/src/models/user_model.dart';
import 'package:quick_sign_in_demo_app/src/services/api_wrapper/post_wrapper.dart';

class UserProvider extends ChangeNotifier {

  UserModel user = UserModel(userId: 1, fullName: "Barry Allen", email: "barryallen@hotmail.com");
  List<Post> userPosts = [];
  bool isLoading = false;

  void fetchUserInfo(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    // Login Server Api Use Here
    Future.delayed(const Duration(milliseconds: 1000), () {
      isLoading = false;
      notifyListeners();
    });
  }

  void fetchUserPosts() {
    isLoading = true;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 2000), () {
      PostWrapper.instance.fetchPosts().then((response) {
        userPosts = response;
        isLoading = false;
        notifyListeners();
      });
    });
  }

}