import 'package:apiexample/model/user_name_model.dart';

class UserProfileModel {
  final int id;
  final String email;
  final String username;
  final String password;
  final UserNameModel name;
  final String phone;

  UserProfileModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: UserNameModel.fromJson(json["name"]),
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "name": name.toJson(),
        "phone": phone,
      };
}
