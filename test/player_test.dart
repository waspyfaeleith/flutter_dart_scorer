import 'package:flutter_dart_scorer/logic/Player.dart';
import 'package:flutter_dart_scorer/logic/Throw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Player', () {
    test('has name', () {
      final Player player = new Player("Jack", 501);
      expect(player.name, "Jack");
    });

    test('current score starts at 501', () {
      final Player player = new Player("Jack", 501);
      expect(player.currentScore, 501);
    });

    test('legs score starts at 0', () {
      final Player player = new Player("Jack", 501);
      expect(player.legsWon, 0);
    });

    test('sets score starts at 0', () {
      final Player player = new Player("Jack", 501);
      expect(player.setsWon, 0);
    });

    test('throw updates current score', () {
      final Player player = new Player("Jack", 501);
      Throw t = new Throw(180);
      player.throwDarts(t);
      expect(player.currentScore, 321);
    });

    test('player bust when throw greater than current score', () {
      final Player player = new Player("Jack", 40);
      Throw t = new Throw(41);
      player.throwDarts(t);
      expect(true, player.isBust(t));
      expect(player.currentScore, 40);
    });

    test('player bust when throw leaves score of 1', () {
      final Player player = new Player("Jack", 41);
      Throw t = new Throw(40);
      player.throwDarts(t);
      expect(true, player.isBust(t));
      expect(player.currentScore, 41);
    });

    test('player throws winning score', () {
      final Player player = new Player("Jack", 41);
      Throw t = new Throw(41);
      expect(true, player.isWinningScore(t));
      expect(player.currentScore, 0);
    });

    test('player does not throw winning score', () {
      final Player player = new Player("Jack", 100);
      Throw t = new Throw(41);
      expect(player.isWinningScore(t), false);
    });

    test('player throws bust score does not change', () {
      final Player player = new Player("Jack", 40);
      Throw t = new Throw(41);
      player.throwDarts(t);
      expect(player.currentScore, 40);
    });

    test('player on a finish with score 164', () {
      final Player player = new Player("Jack", 164);
      expect(player.isOnAFinish(), true);
    });

    test('player on a finish with score 158', () {
      final Player player = new Player("Jack", 158);
      expect(player.isOnAFinish(), true);
    });

    test('player on a finish with score 138', () {
      final Player player = new Player("Jack", 138);
      expect(player.isOnAFinish(), true);
    });

    test('player is not on a finish with score 159', () {
      final Player player = new Player("Jack", 159);
      expect(player.isOnAFinish(), false);
    });

    test('player is not on a finish with score 162', () {
      final Player player = new Player("Jack", 162);
      expect(player.isOnAFinish(), false);
    });

  });
}