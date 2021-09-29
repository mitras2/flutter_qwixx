import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/line_provider.dart';
import 'package:flutter_playground/widgets/quixx/line_end_field.dart';
import 'package:flutter_playground/widgets/quixx/line_field.dart';
import 'package:provider/provider.dart';

class QwixxLine extends StatelessWidget {

  final bool reverse;

  const QwixxLine({Key? key, this.reverse = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LineProvider>(
        builder: (context, line, child) {
          return Container(
              color: line.lineColor,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04,
                horizontal: MediaQuery.of(context).size.height * 0.04,
              ),
              child: SafeArea(
                  top: false,
                  bottom: false,
                  child: Container (
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LineField(line: line, index: 0, lineFieldsTextReverse: reverse),
                        LineField(line: line, index: 1, lineFieldsTextReverse: reverse),
                        LineField(line: line, index: 2, lineFieldsTextReverse: reverse),
                        LineField(line: line, index: 3, lineFieldsTextReverse: reverse),
                        LineField(line: line, index: 4, lineFieldsTextReverse: reverse),
                        LineField(line: line, index: 5, lineFieldsTextReverse: reverse),
                        LineField(line: line, index: 6, lineFieldsTextReverse: reverse),
                        LineField(line: line, index: 7, lineFieldsTextReverse: reverse),
                        LineField(line: line, index: 8, lineFieldsTextReverse: reverse),
                        LineField(line: line, index: 9, lineFieldsTextReverse: reverse),
                        LineField(line: line, index: 10, lineFieldsTextReverse: reverse),
                        LineEndField(line: line),
                      ],
                    ),
                  )
              )
          );
        },
    );
  }
}
