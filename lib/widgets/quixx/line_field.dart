import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/line_provider.dart';

import 'line_field_base.dart';

class LineField extends StatelessWidget {
  final LineProvider line;
  final int index;
  final bool lineFieldsTextReverse;
  
  bool get _field{
    return line.fields[index];
  }

  String get _fieldText{
    if(lineFieldsTextReverse) {
      return _field? 'X' : (12 - index).toString();
    } else {
      return _field? 'X' : (index + 2).toString();
    }
  }
  
  void _toggleField() {
    line.toggleField(index);
  }
  
  const LineField({Key? key, required this.line, required this.index, this.lineFieldsTextReverse = false} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineFieldBase(
      fieldEnabled: line.isFieldToggleable(index),
      fieldText: _fieldText,
      onToggle: _toggleField,
      lineColor: line.lineColor,
    );
  }
}
