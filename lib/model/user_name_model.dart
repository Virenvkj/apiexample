class UserNameModel {
  final String firstname;
  final String lastname;

  UserNameModel({
    required this.firstname,
    required this.lastname,
  });

  factory UserNameModel.fromJson(Map<String, dynamic> json) => UserNameModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
      };
}
