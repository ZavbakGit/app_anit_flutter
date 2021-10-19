import 'dart:async';
import 'package:chopper/chopper.dart';


class AuthApiInterceptor implements RequestInterceptor {

  final String authString;

  AuthApiInterceptor(this.authString);

  @override
  FutureOr<Request> onRequest(Request request) async {
    //final _auth = 'Basic ' + base64Encode(utf8.encode('${_authBaseModel!.user}:${_authBaseModel!.password}'));
    //final _auth = 'Basic ' + authString;

    return request.copyWith(
      headers: {
        ...request.headers,
        'authorization': authString,
      },
    );
  }
}
