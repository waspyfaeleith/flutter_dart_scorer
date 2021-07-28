import 'package:flutter_dart_scorer/logic/Game.dart';
import 'package:flutter_dart_scorer/logic/Player.dart';
import 'package:flutter_dart_scorer/logic/Throw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final Player player1 = new Player("Jack", 501);
  final Player player2 = new Player("Victor", 501);

  final Game game = new Game(player1, player2, 501, 3, 5);

  group('Game', () {
    test('start score is set', () {
      expect(501, game.startScore);
    });

    test('player 1 to throw first', () {
      expect(player1, game.thrower);
    });

    test('switch thrower to player2', () {
      game.changeThrower();
      expect(player2, game.thrower);
    });

    test('game has not yet been won', () {
      expect(false, game.gameWon());
    });

    test('game has been won', () {
      Player player = new Player("Phil", 101);
      Game winningGame = new Game(player, player2, 101, 3, 3);
      winningGame.player1.throwDarts(new Throw(101));

      expect(true, winningGame.gameWon());
    });




  });
}