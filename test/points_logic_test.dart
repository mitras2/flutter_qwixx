import 'package:flutter/material.dart';
import 'package:flutter_playground/data_models/game_provider.dart';
import 'package:flutter_playground/data_models/line_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('The calculated points for a line', () {
    test('with no checked fields is 0.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      //Act
      //Assert
      expect(l.linePoints, equals(0));
    });

    test('with no checked fields (after toggles) is 0.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      //Act
      l.toggleField(6);
      l.toggleField(6);
      //Assert
      expect(l.linePoints, equals(0));
    });

    test('with one checked field is 1.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      //Act
      l.toggleField(3);
      //Assert
      expect(l.linePoints, equals(1));
    });

    test('with five checked field is 15.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      //Act
      l.toggleField(3);
      l.toggleField(4);
      l.toggleField(6);
      l.toggleField(7);
      l.toggleField(9);
      //Assert
      expect(l.linePoints, equals(15));
    });

    test('with three checked fields that is closed without bonus is 6.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      //Act
      l.toggleField(3);
      l.toggleField(7);
      l.toggleField(9);
      l.toggleLineClosed();
      //Assert
      expect(l.linePoints, equals(6));
    });

    test('with six checked fields that is closed with bonus is 28.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      //Act
      l.toggleField(3);
      l.toggleField(4);
      l.toggleField(5);
      l.toggleField(7);
      l.toggleField(9);
      l.toggleField(10);
      //Assert
      expect(l.linePoints, equals(28));
    });

    test('with all checked fields that is closed with bonus is 78.', () {
      //Arange
      var l = LineProvider(GameProvider(), const Color.fromRGBO(200, 100, 0, 0));
      //Act
      l.toggleField(0);
      l.toggleField(1);
      l.toggleField(2);
      l.toggleField(3);
      l.toggleField(4);
      l.toggleField(5);
      l.toggleField(6);
      l.toggleField(7);
      l.toggleField(8);
      l.toggleField(9);
      l.toggleField(10);
      //Assert
      expect(l.linePoints, equals(78));
    });

  });
}