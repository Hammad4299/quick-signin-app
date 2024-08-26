import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_sign_in_demo_app/src/utils/app_colors.dart';
import 'package:quick_sign_in_demo_app/src/models/post_model.dart';
import 'package:quick_sign_in_demo_app/src/utils/provider_utils.dart';
import 'package:quick_sign_in_demo_app/src/providers/user_provider.dart';
import 'package:quick_sign_in_demo_app/src/components/loading_overlay.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    var userProvider = ProviderUtils.instance.getUserProviderObject(context);
    if (userProvider.userPosts.isEmpty) {
      Future.delayed(const Duration(milliseconds: 100), () {
        userProvider.fetchUserPosts();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
        builder: (context, userProvider, child) => Scaffold(
          body: LoadingOverlay(
            isLoading: userProvider.isLoading,
            child: postList(userProvider),
          ),
        ));
  }

  Widget postList(UserProvider userProvider) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 0.0),
          itemCount: userProvider.userPosts.length,
          itemBuilder: (BuildContext context, int index) {
            var postItem = userProvider.userPosts[index];
            return postCellWidget(postItem);
          },
        ),
      ),
    );
  }

  Widget postCellWidget(Post postData) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.instance.homeTile,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: AppColors.instance.blackColor,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(postData.title, style: const TextStyle(fontWeight: FontWeight.bold),),
          Expanded(
            child: Text(
              postData.body,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pullRefresh() async {
    var userProvider = ProviderUtils.instance.getUserProviderObject(context);
    userProvider.fetchUserPosts();
  }
}
