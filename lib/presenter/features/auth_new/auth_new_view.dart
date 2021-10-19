import 'package:app_anit_flutter/app/locator.dart';
import 'package:app_anit_flutter/presenter/features/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'auth_new_viewmodel.dart';

class AuthNewView extends StatelessWidget {
  const AuthNewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _loginController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return ViewModelBuilder<AuthNewViewModel>.reactive(
      builder: (context, model, child) =>
          Scaffold(
            body: Center(
                child: _returnBody()
            ),
          ),
      viewModelBuilder: () => locator<AuthNewViewModel>(),
    );
  }



