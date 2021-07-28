class Throw {
  int score;

  Throw(this.score);

  bool isValid() {

    var validHighScores = [ 180, 177, 174, 171, 170, 168, 167, 165, 164 ];

    if (validHighScores.contains(this.score) || (this. score >= 0 && this.score < 163)) {
      return true;
    }

    return false;
  }
}