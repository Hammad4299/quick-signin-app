import '../../strings/strings.dart';

class Utils {
  Utils._();
  static final Utils instance = Utils._();

  String getCredentialsHint(String title) {
    switch (title) {
      case AppStrings.emailAddress:
        return AppStrings.emailHint;
      case AppStrings.password:
        return AppStrings.passwordHint;
      case AppStrings.fullName:
        return AppStrings.fullName;
      default:
        return '';
    }
  }

  Map<String, String> setRequestHeader(bool tokenRequired, String? token){
    Map<String, String> headers = {};
    if (tokenRequired) {
      headers = {
        'accept': 'application/json',
        'Authorization': 'Bearer ${token ?? ''}',
        'content-type': 'application/json'
      };
    } else {
      headers = {
      };
    }
    return headers;
  }

}