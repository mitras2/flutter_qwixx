import 'package:flutter/material.dart';


class PointsField extends StatelessWidget {

  final Color pointsColor;
  final String pointsText;
  final bool extraWide;

  const PointsField({Key? key, required this.pointsText, this.pointsColor = Colors.black87, this.extraWide = false} ) : super(key: key);

  double get _widthMultiplier {
    if(extraWide) {
      return 0.18;
    }

    return 0.1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.height * _widthMultiplier,
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.height * 0.02),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: pointsColor,
          width: MediaQuery.of(context).size.height * 0.008,
        )
      ),
      child: Center(
        child:Text(
          pointsText,
          style: TextStyle(
              color: pointsColor,
              fontSize: MediaQuery.of(context).size.height * 0.04,
              fontWeight: FontWeight.bold
          ),
        ),
      )
    );
  }
}
