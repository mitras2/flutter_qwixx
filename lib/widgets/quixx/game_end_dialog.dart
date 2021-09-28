import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/game_provider.dart';

class GameEndDialog extends StatelessWidget {

  final GameProvider game;

  const GameEndDialog({Key? key, required this.game}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("Spiel vorbei"),
      content: Text("Du hast ${game.points.points} Punkte erreicht"),
      actions: [
        CupertinoDialogAction(onPressed: (){
          game.resetGame();
          Navigator.of(context).pop();
        }, child: const Text("Neu starten")),
      ],
    );
  }
}


