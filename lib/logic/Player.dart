import 'Throw.dart';

class Player {
  String name;
  int currentScore;
  int legsWon;
  int setsWon;
  var scores;


  Player(String name, int startScore) {
    this.name = name;
    this.currentScore = startScore;
    this.legsWon = 0;
    this.setsWon = 0;
    this.scores = [];
  }

  void resetScores(int startScore) {
    this.currentScore = startScore;
    this.scores = [];
  }

   void throwDarts(Throw t) {
     if (t.isValid() && !isBust(t)) {
       this.currentScore -= t.score;
       this.scores.add(this.currentScore);
     }
  }

  bool isBust(Throw t)
  {
    if ((t.score > this.currentScore) || ((this.currentScore - t.score) == 1)) {
      return true;
    }
    return false;
  }

  bool isOnAFinish()
  {
    var highFinishes  = [ 170, 167, 164, 161, 160 ];

    if ( highFinishes.contains(this.currentScore) || (this.currentScore < 159)) {
      return true;
    }
    return false;
  }

  bool isWinningScore(Throw t) {
    if (t.score == this.currentScore) {
      currentScore = 0;
      return true;
    }
    return false;
  }
}