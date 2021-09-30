import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LineFieldBase extends StatelessWidget {

  final String fieldText;
  final bool fieldEnabled;
  final Function onToggle;
  final Color lineColor;

  const LineFieldBase({Key? key, required this.fieldText, required this.fieldEnabled, required this.onToggle, this.lineColor = Colors.black87} ) : super(key: key);

  Color get overlayColor {
    if (!fieldEnabled) {
      return Colors.redAccent;
    }

    return Colors.black12;
  }

  Color get _textColor {
    if(fieldText == "X") {
      return Colors.black87;
    }

    if(fieldEnabled) {
      return lineColor;
    }

    return Colors.black26;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.105,
      width: MediaQuery.of(context).size.height * 0.105,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: TextButton(
          onPressed: () => onToggle(),
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith((_) => overlayColor)
          ),
          child: Text(
            fieldText,
            style: TextStyle(
                color: _textColor,
                fontSize: MediaQuery.of(context).size.height * 0.044,
                fontWeight: FontWeight.bold
            ),
          ),
        //   child: FittedBox(
        //   fit: BoxFit.fill,
        //   alignment: Alignment.center,
        //   child: Text(
        //     fieldText,
        //     style: TextStyle(
        //         color: _textColor,
        //         fontSize: MediaQuery.of(context).size.height,
        //         fontWeight: FontWeight.bold
        //     ),
        //   ),
        // )
      ),
    );
  }
}
