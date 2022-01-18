import 'package:fine_wine/models/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  User _user =
      User(password: '', token: '', non_field_errors: [], username: '');

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
