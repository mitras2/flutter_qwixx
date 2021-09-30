import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/line_provider.dart';
import 'package:flutter_playground/data_models/points_provider.dart';

class GameProvider extends ChangeNotifier {

  List<LineProvider> _lines = [];
  late PointsProvider _points;
  bool _gameOver = false;


  List<LineProvider> get lines {
    return _lines;
  }

  PointsProvider get points {
    return _points;
  }

  bool get gameOver {
    return _gameOver;
  }

  GameProvider() {
    _reset();
  }

  void notifyLineChanged() {
    _points.calculatePoints();

    if(_lines.where((line) => line.lineFinished != LineClosedState.open).length >= 2) {
      endGame();
    }
  }

  void resetGame()
  {
    _reset();
    notifyListeners();
  }

  void endGame() {
    //TODO: End the Game and show the points
    _gameOver = true;
    notifyListeners();
  }

  void _reset() {
    var lineRed = LineProvider(this, const Color.fromRGBO(255, 0, 0, 1));
    var lineYellow = LineProvider(this, const Color.fromRGBO(255, 200, 0, 1.0));
    var lineGreen = LineProvider(this, const Color.fromRGBO(35, 184, 49, 1.0));
    var lineBlue = LineProvider(this, const Color.fromRGBO(0, 0, 255, 1));
    _lines = [lineRed, lineYellow, lineGreen, lineBlue];
    _points = PointsProvider(this);
    _gameOver = false;
    notifyListeners();
  }
}