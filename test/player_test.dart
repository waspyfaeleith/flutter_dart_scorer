import 'package:flutter_dart_scorer/logic/Player.dart';
import 'package:flutter_dart_scorer/logic/Throw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Player', () {
    test('has name', () {
      final Player player = new Player("Jack", 501);
      expect("Jack", player.name);
    });

    test('current score starts at 501', () {
      final Player player = new Player("Jack", 501);
      expect(501, player.currentScore);
    });

    test('legs score starts at 0', () {
      final Player player = new Player("Jack", 501);
      expect(0, player.legsWon);
    });

    test('sets score starts at 0', () {
      final Player player = new Player("Jack", 501);
      expect(0, player.setsWon);
    });

    test('throw updates current score', () {
      final Player player = new Player("Jack", 501);
      Throw t = new Throw(180);
      player.throwDarts(t);
      expect(321, player.currentScore);
    });

    test('player bust when throw greater than current score', () {
      final Player player = new Player("Jack", 40);
      Throw t = new Throw(41);
      player.throwDarts(t);
      expect(true, player.isBust(t));
      expect(40, player.currentScore);
    });

    test('player bust when throw leaves score of 1', () {
      final Player player = new Player("Jack", 41);
      Throw t = new Throw(40);
      player.throwDarts(t);
      expect(true, player.isBust(t));
      expect(41, player.currentScore);
    });

    test('player throws winning score', () {
      final Player player = new Player("Jack", 41);
      Throw t = new Throw(41);
      expect(true, player.isWinningScore(t));
      expect(0, player.currentScore);
    });

    test('player does not throw winning score', () {
      final Player player = new Player("Jack", 100);
      Throw t = new Throw(41);
      expect(false, player.isWinningScore(t));
    });

    test('player throws bust score does not change', () {
      final Player player = new Player("Jack", 40);
      Throw t = new Throw(41);
      player.throwDarts(t);
      expect(40, player.currentScore);
    });

    test('player on a finish with score 164', () {
      final Player player = new Player("Jack", 164);
      expect(true, player.isOnAFinish());
    });

    test('player on a finish with score 158', () {
      final Player player = new Player("Jack", 158);
      expect(true, player.isOnAFinish());
    });

    test('player on a finish with score 138', () {
      final Player player = new Player("Jack", 138);
      expect(true, player.isOnAFinish());
    });

    test('player is not on a finish with score 159', () {
      final Player player = new Player("Jack", 159);
      expect(false, player.isOnAFinish());
    });

    test('player is not on a finish with score 162', () {
      final Player player = new Player("Jack", 162);
      expect(false, player.isOnAFinish());
    });

  });
}