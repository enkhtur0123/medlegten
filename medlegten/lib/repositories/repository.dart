import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:medlegten/models/app_user.dart';

final repo = Repository();

class Repository {
  Dio dio = Dio();
  DateFormat get format =>
      DateFormat('EEE, dd MMM yyyy HH:mm:ss \'GMT\'', 'en_US');
  setDioOptions() {
    dio.options.baseUrl = 'https://medlegten/api/';
    dio.options.headers['content-Type'] = 'application/json; charset=utf-8';
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;
  }

  setToken(token) => dio.options.headers['authorization'] = 'Bearer $token';

  snackBar(msg) => Fluttertoast.showToast(
      msg: msg, gravity: ToastGravity.SNACKBAR, toastLength: Toast.LENGTH_LONG);

  //Post
  // Future<List> sendPost(String apiUrl, ) async {
  //   try {
  //     final response = await dio.post(apiUrl);
  //     final res = json.decode('$response');
  //     if (res['success']) {
  //       List data = res['data'];
  //       return data.map((e) => T.fromJson(e)).toList();
  //     } else {
  //       return List.empty();
  //     }
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e);
  //     return List.empty();
  //   }
  // }

  Future<AppUser?> login(User fbuser) async {
    try {
      final response = await dio.post(
        'login',
        data: json.encode({
          'name': fbuser.displayName,
          'email': fbuser.email,
          'uid': fbuser.uid
        }),
      );
      final res = json.decode('$response');
      if (res['success']) {
        return AppUser.fromJson(res['data']);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
