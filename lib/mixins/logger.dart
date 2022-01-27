import 'package:logger/logger.dart';

mixin Logging {
  final Logger _logger = Logger(output: JsonOutput());

  Logger get log {
    return _logger;
  }
}

class JsonOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      print(line);
    }
  }
}
