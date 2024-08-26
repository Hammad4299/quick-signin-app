import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_sign_in_demo_app/strings/strings.dart';
import 'package:quick_sign_in_demo_app/src/screens/login_screen.dart';
import 'package:quick_sign_in_demo_app/src/providers/user_provider.dart';
import 'package:quick_sign_in_demo_app/src/providers/authentication_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MaterialApp(
        title: AppStrings.appName,
        home: LoginScreen(),
        // home: getSettleUpSection(),
      ),
    );
  }

}
