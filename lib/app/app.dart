import 'package:app_anit_flutter/presenter/navigation/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Test stacked',
      debugShowCheckedModeBanner: false,

      //navigation
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),


      //internalization
      //locale: context.watch<LocaleProvider>().locale,
      //supportedLocales: S.delegate.supportedLocales
    );
  }
}
