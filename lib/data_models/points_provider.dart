import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/game_provider.dart';

class PointsProvider extends ChangeNotifier {

  int _points = 0;
  int _fails = 0;
  final GameProvider _game;

  int get points {
    return _points;
  }

  int get pointsFromFails {
    return _fails * 5;
  }

  int get numberFails {
    return _fails;
  }

  PointsProvider(this._game);

  void calculatePoints() {
    //calculate Points from lines
    var linePoints = _game.lines.map((e) => e.linePoints).reduce((a, b) => a+b);
    _points = linePoints - (_fails *5);
    notifyListeners();
  }

  void addFail() {
    if(_fails < 4) {
      _fails++;
    }
    calculatePoints();
    if(_fails == 4) {
      _game.endGame();
    }
  }

  void removeFail() {
    if(_fails > 0) {
      _fails--;
    }
    calculatePoints();
  }

}