import 'dart:convert';

class AuthBaseModel{
  final String login;
  final String password;

  AuthBaseModel({required this.login, required this.password});
  String get strAuth => 'Basic ' + base64Encode(utf8.encode('$login:$password'));
}