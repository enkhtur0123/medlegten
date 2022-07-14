import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

final dioRepository = Repository();

class Repository {
  final Dio _dio = Dio();
  DateFormat get format =>
      DateFormat('EEE, dd MMM yyyy HH:mm:ss \'GMT\'', 'en_US');

  setDioOptions() {
    _dio.options.baseUrl = 'https://api.ddishtv.mn/v1/';
    _dio.options.headers['content-Type'] = 'application/json; charset=utf-8';
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 10000;
  }

  snackBar(msg) => Fluttertoast.showToast(
      msg: msg, gravity: ToastGravity.SNACKBAR, toastLength: Toast.LENGTH_LONG);

  Dio get instance => _dio;
}
