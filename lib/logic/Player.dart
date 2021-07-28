import 'Throw.dart';

class Player {
  late String _name;
  late int _currentScore;

  int _legsWon = 0;
  int _setsWon = 0;
  var _scores;

  String get name => _name;
  int get legsWon => _legsWon;
  int get setsWon => _setsWon;
  get scores => _scores;
  int get currentScore => _currentScore;


  set legsWon(int value) {
    _legsWon = value;
  }

  set setsWon(int value) {
    _setsWon = value;
  }

  Player(String name, int startScore) {
    this._name = name;
    this._currentScore = startScore;
    this._scores = [];
  }

  void resetScores(int startScore) {
    this._currentScore = startScore;
    this._scores = [];
  }

   void throwDarts(Throw t) {
     if (t.isValid() && !isBust(t)) {
       this._currentScore -= t.score;
       this._scores.add(this._currentScore);
     }
  }

  bool isBust(Throw t)
  {
    if ((t.score > this._currentScore) || ((this._currentScore - t.score) == 1)) {
      return true;
    }
    return false;
  }

  bool isOnAFinish()
  {
    var highFinishes  = [ 170, 167, 164, 161, 160 ];

    if ( highFinishes.contains(this._currentScore) || (this._currentScore < 159)) {
      return true;
    }
    return false;
  }

  bool isWinningScore(Throw t) {
    if (t.score == this._currentScore) {
      _currentScore = 0;
      return true;
    }
    return false;
  }
}