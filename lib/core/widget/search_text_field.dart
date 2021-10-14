import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uuid/uuid.dart';

typedef SearchFunctionCall = void Function(String text);

class SearchTextField extends StatefulWidget {
  SearchTextField({
    Key? key,
    required this.searchFunctionCall,
    this.debounce = Duration.zero,
  }) : super(key: key);

  final Duration debounce;
  final SearchFunctionCall searchFunctionCall;
  final String tagDebounce = const Uuid().toString();

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  var textController = useTextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onChanged: (text) {
        EasyDebounce.debounce(
          widget.tagDebounce,
          //'my-debouncer', // <-- An ID for this particular debouncer
          widget.debounce, // <-- The debounce duration
          () => {widget.searchFunctionCall(text)}, // <-- The target method
        );
      },
    );
  }
}
