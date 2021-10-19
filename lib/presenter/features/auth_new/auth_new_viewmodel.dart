import 'package:app_anit_flutter/app/app.dart';
import 'package:app_anit_flutter/domain/services/auth_service.dart';
import 'package:app_anit_flutter/presenter/navigation/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'auth_new_state.dart';

class AuthNewViewModel extends BaseViewModel {
  final AuthService _authService;

  AuthNewState state = FormAuthNewState();

  AuthNewViewModel(this._authService);

  void setState(AuthNewState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> signIn(String login, String pass) async {
    setState(LoadAuthNewState());
    try {
      await _authService.signIn(login, pass);
      MyApp.router.replace(const TestRouterView());
    } catch (e) {
      setState(FormAuthNewState(errorMessage: 'Error. Try again!'));
    }
  }
}
