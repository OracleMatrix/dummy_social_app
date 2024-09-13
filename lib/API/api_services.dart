import 'package:dio/dio.dart';
import 'package:dummy_social_app/Models/add_user_model.dart';
import 'package:dummy_social_app/Models/all_users_model.dart';
import 'package:dummy_social_app/Models/get_all_posts.dart';
import 'package:dummy_social_app/Models/get_user_post.dart';
import 'package:dummy_social_app/Models/login_user_model.dart';

class ApiServices {
  Future<LoginUserModel> loginUser(String username, String password) async {
    final response = await Dio().post(
      "https://dummyjson.com/auth/login",
      data: {"username": username, "password": password},
    );

    if (response.statusCode == 200) {
      return LoginUserModel.fromJson(response.data);
    } else {
      throw Exception("Failed to Login");
    }
  }

  Future<AddUserModel> adduser(String email, String password) async {
    final response = await Dio().post(
      "https://dummyjson.com/users/add",
      data: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 201) {
      return AddUserModel.fromJson(response.data);
    } else {
      throw Exception("Failed to add user");
    }
  }

  Future<GetAllPosts> getAllPosts() async {
    final response = await Dio().get("https://dummyjson.com/posts");

    if (response.statusCode == 200) {
      return GetAllPosts.fromJson(response.data);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<AllUsersModel> getAllUsers() async {
    final response = await Dio().get("https://dummyjson.com/users");

    if (response.statusCode == 200) {
      return AllUsersModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<GetUserPost> getUserPost(int? id) async {
    final response = await Dio().get("https://dummyjson.com/users/$id/posts");

    if (response.statusCode == 200) {
      return GetUserPost.fromJson(response.data);
    } else {
      throw Exception("Failed to load user's posts");
    }
  }
}
