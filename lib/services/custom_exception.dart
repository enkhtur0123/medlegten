class CustomException implements Exception {
  String? errorMsg;
  CustomException({this.errorMsg});
  @override
  String toString() {
    return errorMsg!;
  }
}
