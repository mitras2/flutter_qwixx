
import 'package:flutter_playground/data_models/line_provider.dart';

final List<int> _pointsTable = [0,1,3,6,10,15,21,28,36,45,55,66,78];

int calcPoints(LineProvider line) {
  var checkedFields = line.fields.where((element) => element).length;
  if(line.lineFinished == LineClosedState.closedWithBonus) {
    checkedFields++;
  }
  return _pointsTable[checkedFields];
}