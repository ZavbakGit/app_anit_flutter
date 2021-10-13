import 'package:app_anit_flutter/app/app.dart';
import 'package:app_anit_flutter/presenter/navigation/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TestPageView extends StatelessWidget {
  const TestPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future _navigateSecondPageView() async {
      // SecondPageView1();
      //await MyApp.router.push(SecondRouterView());
      await MyApp.router.push(CatalogView());
    }

    return Scaffold(
      body: const Center(
        child: Text('This is test start view'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _navigateSecondPageView()),
    );
  }
}
