class LoginUserModel {
  String? token;
  String? refreshToken;
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;

  LoginUserModel({
    this.token,
    this.refreshToken,
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      token: json['token'],
      refreshToken: json['refresh_token'],
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
