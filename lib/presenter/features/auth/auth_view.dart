import 'package:app_anit_flutter/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'auth_viewmodel.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = locator<AuthViewModel>();

    final TextEditingController _loginController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    //final FocusNode _emailFocusNode = FocusNode();
    //final FocusNode _passwordFocusNode = FocusNode();

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

    void _auth() =>
        viewModel.signIn(_loginController.text, _passwordController.text);

    Widget _loginButton() {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: _auth,
        ),
      );
    }



    List<Widget> _buildChildren() {
      return [
        const Text('Авторизация'),
        const SizedBox(height: 64.0),
        _buildLoginTextField(),
        const SizedBox(height: 8.0),
        _buildPasswordTextField(),
        const SizedBox(height: 8.0),
        const SizedBox(height: 16.0),
        viewModel.isBusy ? const CircularProgressIndicator() : _loginButton(),
        const SizedBox(height: 8.0),
        if (!viewModel.isBusy && viewModel.hasError)
          Text(
            viewModel.error(viewModel),
            style: TextStyle(color: Colors.red),
          ),
      ];
    }

    return ViewModelBuilder<AuthViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: _buildChildren(),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => viewModel,
    );
  }
}
