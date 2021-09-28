import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/game_provider.dart';
import 'package:flutter_playground/data_models/line_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('In a line', () {
    test('single fields can be checked.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      //Act
      l.toggleField(1);
      l.toggleField(5);
      //Assert
      expect(l.fields[1] && l.fields[5], equals(true));
    });

    test('the last checked field can be unchecked.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      //Act
      l.toggleField(1);
      l.toggleField(5);
      l.toggleField(5);
      //Assert
      expect(l.fields[1], equals(true));
      expect(l.fields[5], equals(false));
    });

    test('no field in between two checked fields can be checked.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      //Act
      l.toggleField(1);
      l.toggleField(5);
      l.toggleField(3);
      //Assert
      expect(l.fields[3], equals(false));
      expect(l.fields.where((element) => element).length, equals(2));
    });

    test('no field in between two checked fields can be unchecked.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      //Act
      l.toggleField(1);
      l.toggleField(3);
      l.toggleField(5);
      l.toggleField(3);
      //Assert
      expect(l.fields[3], equals(true));
      expect(l.fields.where((element) => element).length, equals(3));
    });

    test('the last field can be checked if 5 fields before are checked.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      var lastFieldIndex = l.fields.length -1;
      //Act
      // Check 5 field in the line
      l.toggleField(1);
      l.toggleField(3);
      l.toggleField(5);
      l.toggleField(6);
      l.toggleField(8);
      // Check the last field of the line
      l.toggleField(lastFieldIndex);
      //Assert
      expect(l.fields[lastFieldIndex], equals(true));
    });

    test('the last field can not be checked if less than 5 fields before are checked.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      var lastFieldIndex = l.fields.length -1;
      //Act
      // Check 5 field in the line
      l.toggleField(1);
      l.toggleField(3);
      l.toggleField(6);
      l.toggleField(8);
      // Check the last field of the line
      l.toggleField(lastFieldIndex);
      //Assert
      expect(l.fields[lastFieldIndex], equals(false));
    });

    test('if the last field is checked, the line is marked as closed (with bonus).', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      var lastFieldIndex = l.fields.length -1;
      //Act
      // Check 5 field in the line
      l.toggleField(1);
      l.toggleField(3);
      l.toggleField(5);
      l.toggleField(6);
      l.toggleField(8);
      // Check the last field of the line
      l.toggleField(lastFieldIndex);
      //Assert
      expect(l.lineFinished, equals(LineClosedState.closedWithBonus));
    });

    test('if the last field is checked, and then unchecked the line is marked as open.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      var lastFieldIndex = l.fields.length -1;
      //Act
      // Check 5 field in the line
      l.toggleField(1);
      l.toggleField(3);
      l.toggleField(5);
      l.toggleField(6);
      l.toggleField(8);
      // Check the last field of the line
      l.toggleField(lastFieldIndex);
      l.toggleField(lastFieldIndex);
      //Assert
      expect(l.lineFinished, equals(LineClosedState.open));
    });

    test('if the last field is checked, and the line is opened again, the last field is also unchecked.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      var lastFieldIndex = l.fields.length -1;
      //Act
      // Check 5 field in the line
      l.toggleField(1);
      l.toggleField(3);
      l.toggleField(5);
      l.toggleField(6);
      l.toggleField(8);
      // Check the last field of the line
      l.toggleField(lastFieldIndex);
      l.toggleLineClosed();
      //Assert
      expect(l.fields[lastFieldIndex], equals(false));
    });

    test('if the line is closed, no new field can be checked.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      var lastFieldIndex = l.fields.length -1;
      //Act
      // Check fields in the line
      l.toggleField(1);
      l.toggleField(3);
      // Mark the line as closed
      l.toggleLineClosed();
      // Try to check another field (which should fail)
      l.toggleField(7);
      //Assert
      expect(l.fields[7], equals(false));
    });

    test('if the line is closed, no checked field can be unchecked.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      var lastFieldIndex = l.fields.length -1;
      //Act
      // Check fields in the line
      l.toggleField(1);
      l.toggleField(3);
      // Mark the line as closed
      l.toggleLineClosed();
      // Try to check another field (which should fail)
      l.toggleField(3);
      //Assert
      expect(l.fields[3], equals(true));
    });

    test('if the line is closed, and then opened again the number of checked fields does not change.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      var lastFieldIndex = l.fields.length -1;
      //Act
      // Check fields in the line
      l.toggleField(1);
      l.toggleField(3);
      l.toggleField(6);
      // Mark the line as closed
      l.toggleLineClosed();
      l.toggleLineClosed();
      // Try to check another field (which should fail)
      //Assert
      expect(l.fields.where((element) => element).length, equals(3));
    });

  });
}