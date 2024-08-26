import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_sign_in_demo_app/strings/strings.dart';
import 'package:quick_sign_in_demo_app/src/screens/home_screen.dart';
import 'package:quick_sign_in_demo_app/src/providers/user_provider.dart';
import 'package:quick_sign_in_demo_app/src/screens/settings_screen.dart';
import 'package:quick_sign_in_demo_app/src/components/bottom_navigation_item.dart';


class MainTabBar extends StatefulWidget {
  const MainTabBar({super.key});

  @override
  MainTabBarState createState() => MainTabBarState();
}

class MainTabBarState extends State<MainTabBar> {

  bool isLoading = false;
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Consumer<UserProvider> (
            builder:((context, userProvider, child) =>
            _screens[_currentIndex]
            )
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          elevation: 10.0, // Add elevation for a shadow
          notchMargin: 5.0, // Adjust the margin of the notch
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: BottomNavItem(
                  icon: Icons.home,
                  label: AppStrings.home,
                  index: 0,
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: BottomNavItem(
                  icon: Icons.settings,
                  label: AppStrings.settings,
                  index: 1,
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}