import 'package:flutter_dart_scorer/logic/Throw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Throw', () {
    test('has score', () {
      final Throw playerThrow = new Throw(180);
      expect(180, playerThrow.score);
    });

    test('181 is not a valid score', () {
      final Throw playerThrow = new Throw(181);
      expect(false, playerThrow.isValid());
    });

    test('163 is not a valid score', () {
      final Throw playerThrow = new Throw(163);
      expect(false, playerThrow.isValid());
    });

    test('164 is a valid score', () {
      final Throw playerThrow = new Throw(164);
      expect(true, playerThrow.isValid());
    });

    test('100 is a valid score', () {
      final Throw playerThrow = new Throw(100);
      expect(true, playerThrow.isValid());
    });

    test('0 is a valid score', () {
      final Throw playerThrow = new Throw(0);
      expect(true, playerThrow.isValid());
    });

    test('negative value is not a valid score', () {
      final Throw playerThrow = new Throw(-10);
      expect(false, playerThrow.isValid());
    });

  });
}