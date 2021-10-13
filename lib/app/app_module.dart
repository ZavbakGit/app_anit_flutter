import 'package:app_anit_flutter/data/api/auth_base_model.dart';
import 'package:app_anit_flutter/data/local/pref_data_source.dart';
import 'package:app_anit_flutter/presenter/features/catalog/catalog_viewmodel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  //@lazySingleton
  //NavigationService get navigationService;
  //@lazySingleton
  //DialogService get dialogService;

  @lazySingleton
  CatalogViewModel get  getCatalogViewModel;

  @lazySingleton
  AuthBaseModel getAuthBaseModel() => AuthBaseModel(password: dotenv.env['TEST_PASS']??'', user: dotenv.env['TEST_USER']??'');
}