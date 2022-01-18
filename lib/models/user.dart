class User {
  String? username;
  String? password;
  List<String>? non_field_errors;
  String? token;

  User(
      {required this.username,
      required this.token,
      required this.password,
      required this.non_field_errors});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        username: responseData['username'],
        token: responseData['token'],
        password: responseData['password'],
        non_field_errors: responseData['non_field_errors']);
  }
}
