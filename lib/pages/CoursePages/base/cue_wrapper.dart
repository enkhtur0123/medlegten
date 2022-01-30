class CWord {
  CWord(this.id, this.word, this.wordValue, this.spaceNext);
  String id;
  String word;
  String wordValue;
  bool spaceNext;
}

class CParagraph {
  CParagraph(this.id, this.ordering, this.monText, this.engText, this.words,
      {this.startTime, this.endTime});

  String id;
  int ordering;
  String monText;
  String engText;
  List<CWord> words;

  String? startTime;
  String? endTime;
  //String? grammarIsHighLighted;
  //String? grammarDescription;
}
