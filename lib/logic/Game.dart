import 'Player.dart';

class Game {
  late Player _player1;
  late Player _player2;
  late Player _thrower;

  late int _startScore;
  late int _sets;
  late int _legsPerSet;

  Game(Player player1, Player player2, int startScore,
      int sets, int legsPerSet) {
    this._player1 = player1;
    this._player2 = player2;
    this._thrower = player1;
    this._startScore = startScore;
    this._sets = sets;
    this._legsPerSet = legsPerSet;
  }

  Player get player2 => _player2;

  Player get thrower => _thrower;

  int get startScore => _startScore;

  int get sets => _sets;

  int get legsPerSet => _legsPerSet;
  Player get player1 => _player1;
  set thrower(Player value) {
    _thrower = value;
  }

  void changeThrower() {
    if (this._thrower == this._player1) {
      this._thrower = this._player2;
    } else {
      this._thrower = this._player1;
    }
  }

  bool gameWon() {
    return ((_player1.currentScore == 0) || (_player2.currentScore == 0));
  }

  Player? winner() {
    if (_player1.currentScore == 0) {
      return _player1;
    } else if (_player2.currentScore == 0) {
      return _player2;
    }
    return null;
  }

}