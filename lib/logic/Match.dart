import 'Game.dart';
import 'Player.dart';
import 'Throw.dart';

class Match {
  late int _sets;
  late int _legsPerSet;
  late int _startScore;
  var _players;
  late Player _setThrower;
  late Player _legThrower;
  late Game _game;
  late String _message;

  Match(Player player1, Player player2, int sets, int legsPerSet, int startScore) {

    this._sets = sets;
    this._legsPerSet = legsPerSet;
    this._startScore = startScore;
    this._players = [];
    this._players.add(player1);
    this._players.add(player2);

    this._game = new Game(player1, player2, startScore, sets, legsPerSet);

    this._setThrower = player1;
    this._legThrower = player1;
    this._message = "${this._legThrower.name} to throw";
  }


  Game get game => _game;

  Player get setThrower => _setThrower;

  Player get legThrower => _legThrower;

  get players => _players;

  String get message => _message;

  int setsNeededToWinMatch() {
    return (this._sets ~/ 2) + 1;
  }

  int legsNeededToWinSet() {
    return (this._legsPerSet ~/ 2) + 1;
  }

  bool setWon() {
    if ((this._game.player1.legsWon == legsNeededToWinSet()) ||
        (this._game.player2.legsWon == legsNeededToWinSet())) {
      this._game.winner()?.setsWon++;
      this.newSet();
      return true;
    }
    return false;
  }

  bool matchWon() {
    return ((_game.player1.setsWon == this.setsNeededToWinMatch()) ||
        (_game.player2.setsWon == this.setsNeededToWinMatch()));
  }

  void newSet() {
    _game.player1.legsWon = 0;
    _game.player2.legsWon = 0;
    this.newGame();
    _game.thrower = switchThrower(_setThrower);
    this._setThrower = _game.thrower;
  }

  newGame() {
    _game.player1.resetScores(this._startScore);
    _game.player2.resetScores(this._startScore);
    _game = new Game(this._players[0], this._players[1] , this._startScore, this._sets, this._legsPerSet);
  }

  void newLeg() {
    this.newGame();
    _game.thrower = this.switchThrower(_legThrower);
    _legThrower = _game.thrower;
  }

  void turn(Player player, int score) {
    Throw playerThrow = new Throw(score);
    if (playerThrow.isValid()) {
      if (player.isBust(playerThrow)) {
        this._message = "Bust!";
      }
      else {
        player.throwDarts(playerThrow);
      }
      this._game.changeThrower();
    } else {
      this._message = "Invalid Score Entered!";
    }
  }

  void legWon() {
    _game.winner()?.legsWon++;
    if (setWon()) {
      if (matchWon()) {
        _gameWon("match");
        return;
      } else {
        _gameWon("set");
        newSet();
        return;
      }
    } else {
      _gameWon("leg");
      newLeg();
    }
  }

  void _gameWon(String msg) {
    this._message = "Game Shot, and the ${msg} to ${this.game.winner()?.name}";
  }

  void play() {
    while (matchWon() == false) {
      playLeg();
      legWon();
    }
  }

  void playLeg() {
    while (!_game.isWon()) {
      this._game.changeThrower();
    }
  }

  Player switchThrower(Player thrower) {
    if (thrower == _game.player1) {
      thrower = _game.player2;
    } else {
      thrower = _game.player1;
    }
    return thrower;
  }

  void processScore(int score) {
    if (!matchWon()) {
      if (!this._game.isWon()) {
        this.turn(this._game.thrower, score);
        if (this._game.isWon()) {
          legWon();
        }
        else {
          if (this._game.thrower.isOnAFinish()) {
            this._message = "${this._game.thrower.name}, you require ${this._game.thrower.currentScore}";
          }
          else {
            this._message = this._game.thrower.name + " to throw";
          }
        }
      }
    }
  }
}