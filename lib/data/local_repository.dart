import 'dart:async';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepo {
  final SharedPreferences sharedPreferences;

  LocalRepo({@required this.sharedPreferences});

  static const FIRST_LAUNCH = 'first_launch';

  Future<void> setFirstLaunch({bool isFirst}) {
    return sharedPreferences.setBool(FIRST_LAUNCH, isFirst);
  }

  bool getFirstLaunch() {
    return sharedPreferences.getBool(FIRST_LAUNCH) ?? true;
  }

  static const DEFAULT_ADDRESS = 'default_address';

  Future<void> setDefaultAddress({int id}) {
    return sharedPreferences.setInt(DEFAULT_ADDRESS, id);
  }

  int getDefaultAddress() {
    return sharedPreferences.getInt(DEFAULT_ADDRESS);
  }
}
