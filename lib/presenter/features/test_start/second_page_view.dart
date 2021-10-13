import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPageView extends StatelessWidget {
  SecondPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is test second view'),
      ),
    );
  }
}