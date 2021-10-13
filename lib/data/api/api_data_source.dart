import 'package:app_anit_flutter/data/intercepters/auth_api_interceptor.dart';
import 'package:app_anit_flutter/data/intercepters/logger_interceptor.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_api_anit/swagger_generated_code/client_mapping.dart';
import 'package:chopper_api_anit/swagger_generated_code/swagger.swagger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import 'auth_base_model.dart';
import 'converter.dart';

@injectable
class ApiDataSource {
  final AuthBaseModel? _authBaseModel;


  ApiDataSource(@factoryParam this._authBaseModel) {
    _init();
  }

  late final Swagger api;

  void _init() {
    final client = ChopperClient(
      baseUrl: dotenv.env['API_URL']!,
      converter: CommonJsonSerializableConverter(),
      interceptors: [
        LoggerInterceptor(),
        AuthApiInterceptor(_authBaseModel),
      ],
    );
    api = Swagger.create(client);
  }


  static final commonJsonDecoder = CommonJsonDecoder(generatedMapping);
}