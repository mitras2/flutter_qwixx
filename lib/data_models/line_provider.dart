import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/game_provider.dart';
import 'package:flutter_playground/logic/points.dart';

enum LineClosedState {
  open,
  closedNoBonus,
  closedWithBonus
}

class LineProvider extends ChangeNotifier {

  final GameProvider _game;
  final List<bool> _fields = [false, false, false, false, false, false, false, false, false, false, false];
  final Color lineColor;
  LineClosedState _lineClosed  = LineClosedState.open;
  int _linePoints = 0;

  UnmodifiableListView<bool> get fields {
    return UnmodifiableListView(_fields);
  }

  LineClosedState get lineFinished {
    return _lineClosed;
  }

  int get linePoints {
    return _linePoints;
  }

  LineProvider(this._game, this.lineColor);

  void toggleField(int index)
  {
    //Check if the field can be toggled
    if(!isFieldToggleable(index)) {
      return;
    }


    //If the last field is toggled
    if(index == _fields.length-1) {
      switch (_lineClosed) {
        // If the Line has been closed with success it can be opened by clicking the last field
        case LineClosedState.closedWithBonus:
          _lineClosed = LineClosedState.open;
          break;
        case LineClosedState.open:
          //Check: The last field can only be checked if 5 other fields in this row have been checked
          if(_fields.where((element) => element).length < 5) {
            return;
          }
          //If the line can be closed with the last field, the bonus is also given
          _lineClosed = LineClosedState.closedWithBonus;
          break;
        case LineClosedState.closedNoBonus:
          return;
      }
    }

    //Set the field to the new state
    _fields[index] = !_fields[index];

    //Calculate the score
    _linePoints = calcPoints(this);
    
    //Notify the game about the change
    _game.notifyLineChanged();

    notifyListeners();
  }

  void toggleLineClosed() {
    switch (_lineClosed){
      case LineClosedState.open:
        _lineClosed = LineClosedState.closedNoBonus;
        break;
      case LineClosedState.closedNoBonus:
        _lineClosed = LineClosedState.open;
        break;
      case LineClosedState.closedWithBonus:
        _lineClosed = LineClosedState.open;
        _fields[_fields.length -1 ] = false;
        break;
    }
    _game.notifyLineChanged();
    notifyListeners();
  }

  bool isFieldToggleable(int index) {
    //Check if the line is closed
    if(_lineClosed == LineClosedState.closedNoBonus) {
      return false;
    }

    //Check if no field after the clicked field is already checked
    for(int i = _fields.length-1; i > index; i--) {
      if(_fields[i]) {
        return false;
      }
    }

    return true;
  }

}