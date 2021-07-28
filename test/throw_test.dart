import 'package:flutter_dart_scorer/logic/Throw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Throw', () {
    test('has score', () {
      final Throw playerThrow = new Throw(180);
      expect(playerThrow.score, 180);
    });

    test('181 is not a valid score', () {
      final Throw playerThrow = new Throw(181);
      expect(playerThrow.isValid(), false);
    });

    test('163 is not a valid score', () {
      final Throw playerThrow = new Throw(163);
      expect(playerThrow.isValid(), false);
    });

    test('164 is a valid score', () {
      final Throw playerThrow = new Throw(164);
      expect(playerThrow.isValid(), true);
    });

    test('100 is a valid score', () {
      final Throw playerThrow = new Throw(100);
      expect(playerThrow.isValid(), true);
    });

    test('0 is a valid score', () {
      final Throw playerThrow = new Throw(0);
      expect(playerThrow.isValid(), true);
    });

    test('negative value is not a valid score', () {
      final Throw playerThrow = new Throw(-10);
      expect(playerThrow.isValid(), false);
    });

  });
}