import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quick_sign_in_demo_app/src/models/post_model.dart';
import 'package:quick_sign_in_demo_app/src/utils/network_utils.dart';
import 'package:quick_sign_in_demo_app/src/utils/utils.dart';

class PostWrapper {
  PostWrapper._();
  static final PostWrapper instance = PostWrapper._();

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('${NetworkUtils.baseUrl}posts'),
      headers: Utils.instance.setRequestHeader(true,''),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Post> posts = data.map((json) => Post.fromJson(json)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}