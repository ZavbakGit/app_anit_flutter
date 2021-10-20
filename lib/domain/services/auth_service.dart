import 'dart:async';
import 'dart:convert';

import 'package:app_anit_flutter/data/api/api_data_source.dart';
import 'package:app_anit_flutter/data/api/auth_base_model.dart';
import 'package:app_anit_flutter/data/local/pref_data_source.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_api_anit/swagger_generated_code/swagger.models.swagger.dart';

class AuthService {
  final PrefDataSource _prefDataSource;
  final keyUser = 'USER';

  AuthService(this._prefDataSource);

  Future<void> loadCach() async {
    //await Future.delayed(const Duration(seconds: 5));
    final userString = await _prefDataSource.get(keyUser);
    final user = User.fromJsonFactory(jsonDecode(userString!));

    if (user.baseAuthString!.isNotEmpty) {
      await _requestAndSave(user.baseAuthString!);
    }else{
      throw Exception('User is null');
    }
  }

  Future<void> signIn(String login, String pass) async {
    AuthBaseModel _authModel = AuthBaseModel(login: login, password: pass);
    await _requestAndSave(_authModel.strAuth);
  }


  Future<void> _requestAndSave(String strAuth) async {
    ApiDataSource _apiDataSource = ApiDataSource(strAuth);
    Response response = await _apiDataSource.api.authGet();

    if (response.statusCode != 200) {
      throw Exception('Error status code response');
    }

    final user = (response.body! as User).copyWith(baseAuthString: strAuth);
    await _prefDataSource.save(keyUser, jsonEncode(user.toJson()));
  }
}
