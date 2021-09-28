import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/game_provider.dart';
import 'package:flutter_playground/data_models/points_provider.dart';
import 'package:flutter_playground/widgets/quixx/points_field.dart';
import 'package:provider/provider.dart';


class PointsFailsField extends StatelessWidget {

  final PointsProvider points;
  final int failIndex;

  const PointsFailsField({Key? key, required this.points, required this.failIndex} ) : super(key: key);

  bool get isSelected {
    return points.numberFails >= failIndex;
  }

  String get fieldText {
    return isSelected? "X" : "";
  }

  void toggleSelect() {
    if(isSelected) {
      points.removeFail();
      return;
    }

    points.addFail();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.height * 0.1,
          margin: EdgeInsets.only(right: MediaQuery.of(context).size.height * 0.02),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: Colors.black87,
                width: MediaQuery.of(context).size.height * 0.008,
              )
          ),
          child: TextButton(
            onPressed: () => toggleSelect(),
            child: Text(
              fieldText
            ),
          )
      )
    );
  }
}
