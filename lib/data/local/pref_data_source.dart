import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PrefDataSource {
  PrefDataSource() {
    init();
  }

  late SharedPreferences prefs;
  final Completer _inited = Completer();


  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    _inited.complete();
  }

  Future<void> clear() async {
    await prefs.clear();
  }


  Future<void> save(String key,String str) async {
    await clear();
    prefs.setString(key, str);
  }


  Future<String?> get(String key) async {
    if (!_inited.isCompleted) {
      await _inited.future;
    }
    return prefs.getString(key);
  }
}
