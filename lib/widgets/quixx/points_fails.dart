import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/game_provider.dart';
import 'package:flutter_playground/data_models/points_provider.dart';
import 'package:flutter_playground/widgets/quixx/points_fails_field.dart';
import 'package:flutter_playground/widgets/quixx/points_field.dart';
import 'package:provider/provider.dart';


class PointsFails extends StatelessWidget {

  final PointsProvider points;

  const PointsFails({Key? key, required this.points} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PointsFailsField(points: points, failIndex: 1),
        PointsFailsField(points: points, failIndex: 2),
        PointsFailsField(points: points, failIndex: 3),
        PointsFailsField(points: points, failIndex: 4),
      ],
    );
  }
}
