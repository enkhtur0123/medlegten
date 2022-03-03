class WritingHelper {
  Map<int, bool> showCorrectAnswer = {};
  Map<int, int> counter = {};

  static final WritingHelper _instance = WritingHelper._internal();

  WritingHelper._internal();

  factory WritingHelper() => _instance;
}
