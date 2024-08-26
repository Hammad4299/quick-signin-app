import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_sign_in_demo_app/src/utils/app_colors.dart';
import 'package:quick_sign_in_demo_app/src/utils/app_images.dart';
import 'package:quick_sign_in_demo_app/src/utils/navigation_utils.dart';
import 'package:quick_sign_in_demo_app/src/components/custom_image.dart';
import 'package:quick_sign_in_demo_app/src/providers/user_provider.dart';
import 'package:quick_sign_in_demo_app/src/components/loading_overlay.dart';
import 'package:quick_sign_in_demo_app/strings/strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  var accountOptions = [
    AppStrings.notification,
    AppStrings.contactUs,
    AppStrings.reportAnIssue,
    AppStrings.privacyPolicy,
    AppStrings.logout,
  ];
  var accountOptionsIcons = [
    AppImages.instance.notification,
    AppImages.instance.contactUs,
    AppImages.instance.reportAnIssue,
    AppImages.instance.privacyPolicy,
    AppImages.instance.logout,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider> (
      builder: (context, userProvider, child) =>
          Scaffold(
            body: LoadingOverlay(
              isLoading: userProvider.isLoading,
              child: ListView.builder(
                itemCount: accountOptions.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return profileSection(userProvider);
                  } else {
                    var cellIndex = index - 1;
                    return settingsCell(accountOptions[cellIndex], cellIndex);
                  }
                },
              ),
            ),
          ),
    );
  }

  Widget profileSection(UserProvider userProvider) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: AppColors.instance.blackColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          CustomImage(imageAsset: AppImages.instance.profilePlaceholder, width: 80, height: 80),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userProvider.user.fullName, style: const TextStyle(fontSize: 18),),
                const SizedBox(height: 5,),
                Text(userProvider.user.email, style: TextStyle(color: AppColors.instance.lightGray),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget settingsCell(String title, int index) {
    return GestureDetector(
      onTap: () {
        settingsOptionTapped(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            CustomImage(imageAsset: accountOptionsIcons[index], width: 22, height: 22),
            const SizedBox(width: 10,),
            Text(title, style: const TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }

  void settingsOptionTapped(int index) {
    switch (index) {
      case 0:
        // Notification Index Tapped
        break;
      case 1:
        // Contact Us Index Tapped
        break;
      case 2:
        // Report an issue Index Tapped
        break;
      case 3:
        // Privacy Policy Index Tapped
        break;
      case 4:
        // Logout Index Tapped
        NavigationUtils.pop(context);
        break;
    }
  }
}
