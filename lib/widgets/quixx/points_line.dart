import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/game_provider.dart';
import 'package:flutter_playground/data_models/points_provider.dart';
import 'package:flutter_playground/widgets/quixx/points_fails.dart';
import 'package:flutter_playground/widgets/quixx/points_field.dart';
import 'package:provider/provider.dart';


class PointsLine extends StatelessWidget {

  final GameProvider game;

  const PointsLine({Key? key, required this.game} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
        horizontal: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Consumer<PointsProvider>(
        builder: (context, points, child) {
          return SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                      child: const Text("Punkte"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PointsField(
                            pointsText: game.lines[0].linePoints.toString(),
                            pointsColor: game.lines[0].lineColor
                        ),
                        PointsField(
                            pointsText: game.lines[1].linePoints.toString(),
                            pointsColor: game.lines[1].lineColor
                        ),
                        PointsField(
                            pointsText: game.lines[2].linePoints.toString(),
                            pointsColor: game.lines[2].lineColor
                        ),
                        PointsField(
                            pointsText: game.lines[3].linePoints.toString(),
                            pointsColor: game.lines[3].lineColor
                        ),
                        Container(
                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.height * 0.02),
                          child: const Text("-", ),
                        ),
                        PointsField(pointsText: points.pointsFromFails.toString()),
                        Container(
                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.height * 0.02),
                          child: const Text("="),
                        ),
                        PointsField(pointsText: points.points.toString())
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                      child: const Text("Fehlwürfe"),
                    ),
                    PointsFails(points: points)
                  ],
                )
              ],
            )
          );
        },
      ),
    );
  }
}
