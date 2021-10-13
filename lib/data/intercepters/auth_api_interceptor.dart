import 'dart:async';
import 'dart:convert';
import 'package:app_anit_flutter/data/api/auth_base_model.dart';
import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';


class AuthApiInterceptor implements RequestInterceptor {

  final AuthBaseModel? _authBaseModel;

  AuthApiInterceptor(this._authBaseModel);

  @override
  FutureOr<Request> onRequest(Request request) async {
    final _auth = 'Basic ' + base64Encode(utf8.encode('${_authBaseModel!.user}:${_authBaseModel!.password}'));

    return request.copyWith(
      headers: {
        ...request.headers,
        'authorization': _auth,
      },
    );
  }
}
