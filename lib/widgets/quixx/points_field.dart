import 'package:flutter/material.dart';


class PointsField extends StatelessWidget {

  final Color pointsColor;
  final String pointsText;

  const PointsField({Key? key, required this.pointsText, this.pointsColor = Colors.black87} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.height * 0.02),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: pointsColor,
          width: MediaQuery.of(context).size.height * 0.008,
        )
      ),
      child: Center(
        child: Text(
          pointsText,
          style: TextStyle(
            color: pointsColor,
          ),
        ),
      )
    );
  }
}
