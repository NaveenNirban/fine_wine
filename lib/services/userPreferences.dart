import 'dart:async';

import 'package:fine_wine/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//
//
//
//
//
//       Currently not under use;
//        Will use later.
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

final storage = new FlutterSecureStorage();

class UserPreferences {
  saveUser(User user) async {
    await storage.write(key: "token", value: user.token);
    await storage.write(key: "username", value: user.username);
  }

  Future<User> getUser() async {
    String? token = await storage.read(key: "token");
    String? username = await storage.read(key: "username");

    return User(
      username: username,
      token: token,
      non_field_errors: [],
      password: '',
    );
  }

  void removeUser() async {
    await storage.delete(key: "username");
    await storage.delete(key: "token");
  }

  Future<String?> getToken(args) async {
    String? token = await storage.read(key: "token");
    return token;
  }
}
