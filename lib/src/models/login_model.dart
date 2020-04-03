import 'package:flutter/material.dart';

class LoginModel with ChangeNotifier {
  String _matricula = '';
  String _password = '';

  String get matricula => this._matricula;

  set matricula(String matricula) {
    this._matricula = matricula;
    notifyListeners();
  }

  String get password => this._password;

  set password(String password) {
    this._password = password;
    notifyListeners();
  }
}