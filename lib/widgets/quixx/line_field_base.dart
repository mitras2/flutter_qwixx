import 'package:flutter/material.dart';

class LineFieldBase extends StatelessWidget {

  final String fieldText;
  final bool fieldEnabled;
  final Function onToggle;

  const LineFieldBase({Key? key, required this.fieldText, required this.fieldEnabled, required this.onToggle} ) : super(key: key);

  Color get overlayColor {
    if (!fieldEnabled) {
      return Colors.redAccent;
    }

    return Colors.black12;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: TextButton(
          onPressed: () => onToggle(),
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith((_) => overlayColor)
          ),
          child: Text(fieldText)
      ),
    );
  }
}
