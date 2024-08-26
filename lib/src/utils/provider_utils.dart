import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quick_sign_in_demo_app/src/providers/user_provider.dart';
import 'package:quick_sign_in_demo_app/src/providers/authentication_provider.dart';

class ProviderUtils {
  ProviderUtils._();

  static final ProviderUtils instance = ProviderUtils._();

  AuthenticationProvider getAuthProviderObject(BuildContext context) {
    return Provider.of<AuthenticationProvider>(context, listen: false);
  }

  UserProvider getUserProviderObject(BuildContext context) {
    return Provider.of<UserProvider>(context, listen: false);
  }

}