import 'package:app_anit_flutter/presenter/features/auth/auth_viewmodel.dart';
import 'package:app_anit_flutter/presenter/features/auth_new/auth_new_viewmodel.dart';
import 'package:app_anit_flutter/presenter/features/auth_new/auth_new_viewmodel_impl.dart';
import 'package:app_anit_flutter/presenter/features/catalog_new/catalog_new_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/app.dart';
import 'app/locator.dart';
import 'data/local/pref_data_source.dart';
import 'domain/services/auth_service.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  //Пока с ошибкой разбираюсь буду инжектить с параметрами в сингельтон сдесь!
  // locator.registerSingleton<ApiDataSource>(ApiDataSource(
  //   locator<AuthBaseModel>(),
  // ));
  // locator.registerFactory<CatalogViewModel>(() => CatalogViewModel(
  //       locator<ApiDataSource>(),
  //     ));


  locator.registerSingleton<AuthService>(AuthService(
    locator<PrefDataSource>(),
  ));

  locator.registerFactory<AuthViewModel>(() => AuthViewModel(
    locator<AuthService>(),
  ));

  locator.registerFactory<AuthNewViewModel>(() => AuthNewViewModelImpl(
    locator<AuthService>(),
  ));

  //for test
  //locator.registerFactory<CatalogNewViewModel>(() => MockCatalogViewModel());

  runApp(const MyApp());
}
