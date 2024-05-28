class Score {
  int value = 0;
  String name;

  Score(this.name);

  @override
  String toString() {
    return "$name: $value";
  }
}