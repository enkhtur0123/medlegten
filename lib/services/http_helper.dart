// ignore_for_file: empty_catches

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medlegten/services/custom_exception.dart';

class HttpHelper {
  Dio _createDio() {
    var dio = Dio();
    dio.options.baseUrl = 'https://api.ddishtv.mn/v1/';
     dio.options.headers['content-Type'] = 'application/json; charset=utf-8';
    dio.options.connectTimeout = 40000;
    dio.options.receiveTimeout = 40000;
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    }));
    return dio;
  }

  Future<dynamic> getUrl({String? url}) async {
    var dio = _createDio();
    var access_token = await getToken();
    dio.options.headers['authorization']=access_token;
    try {
      var response = await dio.get(url!);
      return response.data;
    } on DioError catch (ex) {
      throw CustomException(errorMsg: ex.message.toString());
    } catch (ex) {
      throw CustomException(errorMsg: ex.toString());
    }
  }

  Future<dynamic> postUrl({String? url, dynamic body}) async {
    var dio = _createDio();
    var access_token = await getToken();
    dio.options.headers['authorization']=access_token;
    try {
      var response = await dio.post(url!, data: body);
      return response.data;
    } on DioError catch (ex) {
      throw CustomException(errorMsg: ex.message.toString());
    } catch (ex) {
      throw CustomException(errorMsg: ex.toString());
    }
  }

  Future<dynamic> putUrl({String? url, dynamic body}) async {
    var dio = _createDio();
    var access_token = await getToken();
    dio.options.headers['authorization']=access_token;
    try {
      var response = await dio.put(url!, data: body);
      return response.data;
    } on DioError catch (ex) {
      throw CustomException(errorMsg: ex.message.toString());
    } catch (ex) {
      throw CustomException(errorMsg: ex.toString());
    }
  }

  Future<dynamic> deleteUrl({String? url, dynamic body}) async {
    var dio = _createDio();
    var access_token = await getToken();
    dio.options.headers['authorization']=access_token;
    try {
      var response = await dio.delete(url!, data: body);
      return response.data;
    } on DioError catch (ex) {
      throw CustomException(errorMsg: ex.message.toString());
    } catch (ex) {
      throw CustomException(errorMsg: ex.toString());
    }
  }
}

Future<String> getToken() async {
  String token = GetStorage().read('token') ?? '';
  return token;
}
