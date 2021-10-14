import 'package:app_anit_flutter/presenter/features/catalog/catalog_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/app.dart';
import 'app/locator.dart';
import 'data/api/api_data_source.dart';
import 'data/api/auth_base_model.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  //Пока с ошибкой разбираюсь буду инжектить с параметрами в сингельтон сдесь
  locator.registerSingleton<ApiDataSource>(ApiDataSource(
    locator<AuthBaseModel>(),
  ));
  locator.registerFactory<CatalogViewModel>(() => CatalogViewModel(
        locator<ApiDataSource>(),
      ));

  runApp(const MyApp());
}
