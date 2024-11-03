import 'package:bilaw_waye/models/user.dart';
import 'package:flutter/material.dart';

class Userprovider extends ChangeNotifier {
  User _user =
      User(id: '', name: '', email: '', address: '', phone: 0, token: '',isAdmin: false);

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
