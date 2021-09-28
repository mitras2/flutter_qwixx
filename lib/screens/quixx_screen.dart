import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/game_provider.dart';
import 'package:flutter_playground/data_models/line_provider.dart';
import 'package:flutter_playground/data_models/points_provider.dart';
import 'package:flutter_playground/widgets/quixx/game_end_dialog.dart';
import 'package:flutter_playground/widgets/quixx/points_line.dart';
import 'package:flutter_playground/widgets/quixx/quixx_line.dart';
import 'package:provider/provider.dart';

class QuixxScreen extends StatelessWidget {
  const QuixxScreen({Key? key}) : super(key: key);

  void showDialog(BuildContext context, GameProvider game) {
    if(game.gameOver) {
      showCupertinoDialog(context: context, builder: (_) => GameEndDialog(game: game));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Qwixx'),
      ),
      body: Consumer<GameProvider>(
        builder: (context, game, child) {
          Future.delayed(Duration.zero, () => showDialog(context, game));
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ChangeNotifierProvider<LineProvider>.value(
                value: game.lines[0], 
                child: const QwixxLine()
              ),
              ChangeNotifierProvider<LineProvider>.value(
                  value: game.lines[1],
                  child: const QwixxLine()
              ),
              ChangeNotifierProvider<LineProvider>.value(
                  value: game.lines[2],
                  child: const QwixxLine(reverse: true)
              ),
              ChangeNotifierProvider<LineProvider>.value(
                  value: game.lines[3],
                  child: const QwixxLine(reverse: true)
              ),
              ChangeNotifierProvider<PointsProvider>.value(
                  value: game.points,
                  child: PointsLine(game: game)
              ),
            ],
          );
        },
      )
    );
  }
}
