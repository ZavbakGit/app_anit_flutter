import 'dart:async';
import 'dart:convert';

import 'package:app_anit_flutter/data/api/api_data_source.dart';
import 'package:app_anit_flutter/data/api/auth_base_model.dart';
import 'package:app_anit_flutter/data/local/pref_data_source.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_api_anit/swagger_generated_code/swagger.models.swagger.dart';


class AuthService{

  final PrefDataSource _prefDataSource;

  AuthService(this._prefDataSource);

  Future<bool> signIn(String login,String pass) async{
    AuthBaseModel _authModel = AuthBaseModel(login: login, password: pass);
    ApiDataSource _apiDataSource = ApiDataSource(_authModel.strAuth);
    Response response = await _apiDataSource.api.authGet();

    if (response.statusCode != 200) throw Exception('Error status code response');

    User user = response.body!.copyWith(baseAuthString: _authModel.strAuth);
    await _prefDataSource.save('user', jsonEncode(user.toJson()));

    return true;
  }

}