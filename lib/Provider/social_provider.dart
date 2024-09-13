import 'package:dummy_social_app/API/api_services.dart';
import 'package:dummy_social_app/Models/add_user_model.dart';
import 'package:dummy_social_app/Models/all_users_model.dart';
import 'package:dummy_social_app/Models/get_all_posts.dart';
import 'package:dummy_social_app/Models/get_user_post.dart';
import 'package:dummy_social_app/Models/login_user_model.dart';
import 'package:flutter/material.dart';

class SocialProvider extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  LoginUserModel? _loginUserModel;

  LoginUserModel? get loginUserModel => _loginUserModel;
  AddUserModel? _addUserModel;

  AddUserModel? get addUserModel => _addUserModel;
  GetAllPosts? _getAllPosts;

  GetAllPosts? get getAllPosts => _getAllPosts;

  AllUsersModel? _allUsersModel;

  AllUsersModel? get allUsersModel => _allUsersModel;

  GetUserPost? _getUserPost;

  GetUserPost? get getUserPost => _getUserPost;

  bool isLoading = false;

  Future<void> loginUser(String username, String password) async {
    isLoading = true;
    notifyListeners();

    final login = await _apiServices.loginUser(username, password);
    _loginUserModel = login;

    isLoading = false;
    notifyListeners();
  }

  Future<void> addUser(
    String email,
    String password,
  ) async {
    isLoading = true;
    notifyListeners();

    final addUser = await _apiServices.adduser(email, password);
    _addUserModel = addUser;

    isLoading = false;
    notifyListeners();
  }

  Future<void> getPosts() async {
    isLoading = true;
    notifyListeners();

    final getPosts = await _apiServices.getAllPosts();
    _getAllPosts = getPosts;

    isLoading = false;
    notifyListeners();
  }

  Future<void> getUsers() async {
    isLoading = true;
    notifyListeners();

    final users = await _apiServices.getAllUsers();
    _allUsersModel = users;

    isLoading = false;
    notifyListeners();
  }

  Future<void> getUserPostById(int? id) async {
    isLoading = true;
    notifyListeners();

    final userPost = await _apiServices.getUserPost(id);
    _getUserPost = userPost;

    isLoading = false;
    notifyListeners();
  }
}
