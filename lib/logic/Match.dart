import 'Game.dart';
import 'Player.dart';
import 'Throw.dart';

class Match {
  late int sets;
  late int legsPerSet;
  late int startScore;
  var players;
  late Player setThrower;
  late Player legThrower;
  late Game game;

  Match(Player player1, Player player2, int sets, int legsPerSet, int startScore) {

    this.sets = sets;
    this.legsPerSet = legsPerSet;
    this.startScore = startScore;
    this.players = [];
    this.players.add(player1);
    this.players.add(player2);

    this.game = new Game(player1, player2, startScore, sets, legsPerSet);

    this.setThrower = player1;
    this.legThrower = player1;
  }

  int setsNeededToWinMatch() {
    return (this.sets ~/ 2) + 1;
  }

  int legsNeededToWinSet() {
    return (this.legsPerSet ~/ 2) + 1;
  }

  bool setWon() {
    if ((game.player1.legsWon == legsNeededToWinSet()) ||
        (game.player2.legsWon == legsNeededToWinSet())) {
      game.winner()?.setsWon++;
      return true;
    }
    return false;
  }

  bool matchWon() {
    return ((game.player1.setsWon == setsNeededToWinMatch()) ||
        (game.player2.setsWon == setsNeededToWinMatch()));
  }

  void newSet() {
    game.player1.legsWon = 0;
    game.player2.legsWon = 0;
    newGame();
    game.thrower = switchThrower(setThrower);
    this.setThrower = game.thrower;
  }

  newGame() {
    game.player1.resetScores(this.startScore);
    game.player2.resetScores(this.startScore);
    game = new Game(this.players[0], this.players[1] , this.startScore, this.sets, this.legsPerSet);
  }

  void newLeg() {
    this.newGame();
    game.thrower = this.switchThrower(legThrower);
    legThrower = game.thrower;
  }

  void turn(Player player) {
    // TODO: GET PLAYER SCORE FROM UI
    // Throw playerThrow = new Throw(playerThrowScore);
    // while (!playerThrow.isValid()) {
    //
    //   playerThrow = new Throw(playerThrowScore);
    // }
    //
    // player.throwDarts(playerThrow);
  }

  void legWon() {
    game.winner()?.legsWon++;
    if (setWon()) {
      if (matchWon()) {
        // TODO: DISPLAY MATCH WINNER;
        return;
      } else {
        // TODO: DISPLAY SET WINNER;
        newSet();
        return;
      }
    } else {
      //TODO: DISPLAY LEG WINNER;
      newLeg();
    }
  }

  void play() {

    while (matchWon() == false) {
      playLeg();
      legWon();
    }
  }

  void playLeg() {
    while (!game.gameWon()) {
      this.turn(game.thrower);
      this.game.changeThrower();
    }
  }

  Player switchThrower(Player thrower) {
    if (thrower == game.player1) {
      thrower = game.player2;
    } else {
      thrower = game.player1;
    }
    return thrower;
  }
}