import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
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

  //T0rr2flSZvRRwkZJMFMPLGttmZLDJS2pIfTg2yvYMiJNy5OXNptODn28TiJ1tZeV
  Future<String> setToken({String? token}) async {
    token ??= GetStorage().read('token') ?? '';
    print(token);
    _dio.options.headers['authorization'] = token;
    return token;
  }

  setTokenToDefault() async {
    dioRepository.setToken(
        token:
            'T0rr2flSZvRRwkZJMFMPLGttmZLDJS2pIfTg2yvYMiJNy5OXNptODn28TiJ1tZeV');
  }

  snackBar(msg) => Fluttertoast.showToast(
      msg: msg, gravity: ToastGravity.SNACKBAR, toastLength: Toast.LENGTH_LONG);

  Dio get instance => _dio;
}
