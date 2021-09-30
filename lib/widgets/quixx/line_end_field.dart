import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/line_provider.dart';
import 'package:flutter_playground/widgets/quixx/line_field_base.dart';

class LineEndField extends StatelessWidget {
  final LineProvider line;

  String get _fieldText{
    switch (line.lineFinished) {
      case LineClosedState.open:
        return "";
      case LineClosedState.closedNoBonus:
        return "-";
      case LineClosedState.closedWithBonus:
        return "X";
    }
  }
  
  void _toggleField() {
    line.toggleLineClosed();
  }

  const LineEndField({Key? key, required this.line} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineFieldBase(
        fieldText: _fieldText,
        fieldEnabled: true,
        onToggle: _toggleField,
        lineColor: Colors.black26,
    );
  }
}
