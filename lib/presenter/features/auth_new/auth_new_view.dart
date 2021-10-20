import 'package:app_anit_flutter/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'auth_new_state.dart';
import 'auth_new_viewmodel.dart';

class AuthNewView extends StatelessWidget {
  AuthNewView({Key? key}) : super(key: key);

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthNewViewModel>.reactive(
      builder: (context, model, child) =>
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: _buildChildren(model),
                ),
              ),
            ),
          ),
      viewModelBuilder: () => locator<AuthNewViewModel>(),
    );
  }

  TextField _buildPasswordTextField() {
    return TextField(
      key: const Key('password'),
      controller: _passwordController,
      //focusNode: _passwordFocusNode,
      decoration: const InputDecoration(
        labelText: 'Password',
        //enabled: _isLoading == false,
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      //onChanged: (password) => _updateState(),
      //onEditingComplete: _submit,
    );
  }

  TextField _buildLoginTextField() {
    return TextField(
      key: const Key('login'),
      controller: _loginController,
      //focusNode: _emailFocusNode,
      decoration: const InputDecoration(
        labelText: 'Login',
        //hintText: 'Login in program',
        //errorText: showErrorText ? widget.invalidEmailErrorText : null,
        //enabled: _isLoading == false,
      ),
      autocorrect: false,
      textInputAction: TextInputAction.next,
      onChanged: (email) => () {},
      onEditingComplete: () {},
    );
  }

  Widget _loginButton(VoidCallback? onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Text('Login'),
        onPressed:onPressed,
      ),
    );
  }

  List<Widget> _buildChildren(AuthNewViewModel model) {

    return [
      const Text('Авторизация (новая)'),
      const SizedBox(height: 64.0),

      if (model.getState is LoadAuthNewState)...[
        const CircularProgressIndicator()
      ],

      if (model.getState is FormAuthNewState)...[
        _buildLoginTextField(),
        const SizedBox(height: 8.0),
        _buildPasswordTextField(),
        const SizedBox(height: 32.0),

        _loginButton(()=>model.signIn(_loginController.text, _passwordController.text)),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 64.0,
          child: Text(
            (model.getState as FormAuthNewState).errorMessage??'',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    ];
  }

}



