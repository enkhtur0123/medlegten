class WritingHelper {
  Map<int, bool> showCorrectAnswer = {};
  Map<int, int> counter = {};
  int currentVideoIndex = -1;
  static final WritingHelper _instance = WritingHelper._internal();

  WritingHelper._internal();

  factory WritingHelper() => _instance;

  clear() {
    showCorrectAnswer = {};
    counter = {};
    currentVideoIndex = -1;
  }
}
