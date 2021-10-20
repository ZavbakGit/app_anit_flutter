import 'package:stacked/stacked.dart';

import 'auth_new_state.dart';

abstract class AuthNewViewModel extends BaseViewModel{
  AuthNewState get getState;
  Future<void> signIn(String login, String pass);
}