import 'package:app_anit_flutter/app/app.dart';
import 'package:app_anit_flutter/domain/services/auth_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:app_anit_flutter/presenter/navigation/router.gr.dart';

class AuthViewModel extends BaseViewModel {
  final AuthService _authService;

  AuthViewModel(@factoryParam this._authService);

  Future<void> signIn(String login, String pass) async {
    clearErrors();
    setBusy(true);
    try {
      final isLogin = await _authService.signIn(login, pass);
      if (isLogin) MyApp.router.replace(const TestRouterView());
    } catch (e) {
      setError(e.toString());
    } finally {
      notifyListeners();
      setBusy(false);
    }

  }
}
