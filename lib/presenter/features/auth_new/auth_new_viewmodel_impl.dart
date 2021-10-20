import 'package:app_anit_flutter/app/app.dart';
import 'package:app_anit_flutter/domain/services/auth_service.dart';
import 'package:app_anit_flutter/presenter/navigation/router.gr.dart';
import 'auth_new_state.dart';
import 'auth_new_viewmodel.dart';

class AuthNewViewModelImpl  extends  AuthNewViewModel{
  final AuthService _authService;

  AuthNewState _state = FormAuthNewState();

  AuthNewViewModelImpl(this._authService){
    _loadCach();
  }

  @override
  AuthNewState get getState => _state;

  @override
  Future<void> signIn(String login, String pass) async {
    _setState(LoadAuthNewState());
    try {
      await _authService.signIn(login, pass);
      MyApp.router.replace(const TestRouterView());
    } catch (e) {
      _setState(FormAuthNewState(errorMessage: 'Error. Try again!'));
    }
  }

  void _setState(AuthNewState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> _loadCach() async {
    _setState(LoadAuthNewState());
    try {
      await _authService.loadCach();
      MyApp.router.replace(const TestRouterView());
    } catch (e) {
      _setState(FormAuthNewState(errorMessage: ''));
    }
  }

}


