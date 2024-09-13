class AllUsersModel {
  List<User>? users;
  int? total;
  int? skip;
  int? limit;

  AllUsersModel({
    this.users,
    this.total,
    this.skip,
    this.limit,
  });

  factory AllUsersModel.fromJson(Map<String, dynamic> json) {
    return AllUsersModel(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      maidenName: json['maidenName'],
      age: json['age'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      password: json['password'],
      birthDate: json['birthDate'],
      image: json['image'],
    );
  }
}
