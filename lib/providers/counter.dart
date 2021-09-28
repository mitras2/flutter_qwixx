import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  var _counter = 0;

  int get getCounter {
    return _counter;
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }
}