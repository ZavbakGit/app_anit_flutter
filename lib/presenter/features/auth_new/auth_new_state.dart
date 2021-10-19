abstract class AuthNewState{}
class FormAuthNewState extends AuthNewState{
  final String? errorMessage;

  FormAuthNewState({this.errorMessage});
}
class LoadAuthNewState extends AuthNewState{}