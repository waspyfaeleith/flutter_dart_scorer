import 'package:flutter_dart_scorer/logic/Throw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Throw', () {
    test('has score', () {
      final Throw playerThrow = new Throw(180);
      expect(180, playerThrow.score);
    });

  });
}