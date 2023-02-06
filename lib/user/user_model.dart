class UserModel {
  static final UserModel _instance = UserModel._internal();

  factory UserModel() => _instance;

  UserModel._internal();

  int? id;
  String? name;
  String? email;
  String? address;
  String? password;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "password": password,
      };
}
