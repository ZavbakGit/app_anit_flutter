import 'package:app_anit_flutter/data/api/api_data_source.dart';
import 'package:app_anit_flutter/data/api/auth_base_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {

  //@injectable
  @lazySingleton
  ApiDataSource getApiDataSource(@factoryParam AuthBaseModel? authBaseModel) =>
      ApiDataSource(authBaseModel);

  @lazySingleton
  AuthBaseModel getAuthBaseModel() => AuthBaseModel(
        password: dotenv.env['TEST_PASS'] ?? '',
        user: dotenv.env['TEST_USER'] ?? '',
      );
}
