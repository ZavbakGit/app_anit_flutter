import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'locator.config.dart';


final locator = GetIt.instance;


@injectableInit
void setupLocator() => $initGetIt(locator);

//flutter pub run build_runner --delete-conflicting-outputs
//flutter pub run build_runner build