class CWord {
  CWord(this.id, this.word, this.wordValue, this.spaceNext);
  String id;
  String word;
  String wordValue;
  bool spaceNext;
}

class CParagraph {
  CParagraph(this.id, this.ordering, this.startTime, this.endTime, this.monText,
      this.engText, this.words);

  String id;
  int ordering;
  String startTime;
  String endTime;
  String monText;
  String engText;
  List<CWord> words;
}
