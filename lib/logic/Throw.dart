class Throw {
  int _score;

  int get score => _score;

  Throw(this._score);

  bool isValid() {

    var validHighScores = [ 180, 177, 174, 171, 170, 168, 167, 165, 164 ];

    if (validHighScores.contains(this._score) || (this. _score >= 0 && this._score < 163)) {
      return true;
    }

    return false;
  }
}