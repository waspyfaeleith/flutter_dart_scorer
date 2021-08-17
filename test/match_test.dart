import 'package:flutter_dart_scorer/logic/Player.dart';
import 'package:flutter_dart_scorer/logic/Match.dart';
import 'package:flutter_dart_scorer/logic/Throw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Match', () {
    int startScore = 101;
    final Player player1 = new Player("Jocky", startScore);
    final Player player2 = new Player("Eric", startScore);
    Match match = new Match(player1, player2, 7, 5, startScore);

    test('sets needed to win match', () {
      expect(match.setsNeededToWinMatch(), 4);
    });

    test('legs needed to win set', () {
      expect(match.legsNeededToWinSet(), 3);
    });

    test('set won', () {
      match.game.player1.legsWon = 3;
      match.game.player2.setsWon = 1;
      player2.throwDarts(new Throw(101));

      expect(match.setWon(), true);
      expect(player2, match.setThrower);
    });

    test('match won', () {
      match.game.player1.legsWon = 2;
      match.game.player1.setsWon = 2;
      match.game.player2.legsWon = 3;
      match.game.player2.setsWon = 4;
      player2.throwDarts(new Throw(101));

      expect(match.matchWon(), true);
    });
  });
}
