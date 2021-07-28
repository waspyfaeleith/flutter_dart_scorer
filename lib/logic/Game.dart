import 'Player.dart';

class Game {
  Player player1;
  Player player2;
  Player thrower;
  int startScore;
  int sets;
  int legsPerSet;

  Game(this.player1, this.player2, this.thrower, this.startScore,
      this.sets, this.legsPerSet);

  void changeThrower() {
    if (this.thrower == this.player1) {
      this.thrower = this.player2;
    } else {
      this.thrower = this.player1;
    }
  }

  bool gameWon() {
    return ((player1.currentScore == 0) || (player2.currentScore == 0));
  }

  Player? winner() {
    if (player1.currentScore == 0) {
      return player1;
    } else if (player2.currentScore == 0) {
      return player2;
    }
    return null;
  }
}