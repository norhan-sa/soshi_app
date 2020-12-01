import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int currentIndex = 0;

  void setCurrentIndex({int index}) {
    currentIndex = index;
    notifyListeners();
  }
}
