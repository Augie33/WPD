import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wpd_app/models/user/user.dart';
import 'package:wpd_app/services/secure_storage/secure_storage_service.dart';
import 'package:wpd_app/services/service_locator.dart';

import 'json_parsers/json_parsers.dart';

class RequestREST {
  const RequestREST();

  /// HTTP dio client
  static final _client = Dio(
    BaseOptions(
      // baseUrl: 'https://wpd-backend.herokuapp.com/api/v1/',
      // baseUrl: 'http://10.0.2.2:3000/api/v1/',
      baseUrl: 'http://localhost:3000/api/v1/',
      connectTimeout: 3000, // 3 seconds
      receiveTimeout: 3000, // 3 seconds
      // headers: <String, String>{
      //   "token": '',
      // },
    ),
  );

  void setUpLogger() {
    _client.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );
  }

  void setUpErrorInterceptor() {
    _client.interceptors.add(
      InterceptorsWrapper(onError: (DioError e, handler) {
        return handler.next(e); //continue
      }),
    );
  }

  void setUpToken(String token) {
    _client.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer $token';

        return handler.next(options); //continue
      },
    ));
  }

  Future<User?> checkToken() async {
    final _scureStorageService = serviceLocator<ScureStorageService>();

    // Getting the token from the scure Storage
    String token = await _scureStorageService.getToken() ?? '';
    setUpToken(token);

    final response = await _client.get('/auth/me');

    if (response.statusCode == 200) {
      final user = User.fromJson(response.data['data']);

      return user;
    }

    return null;
  }

  Future<T> executeGet<T>(String endpoint, JsonParser<T> parser,
      {Map<String, Object> data = const {}}) async {
    final response = await _client.get<String>(endpoint);
    return parser.parseFromJson(response.data!);
  }

  Future<T> executePost<T>(String endpoint, JsonParser<T> parser,
      {Map<String, Object> data = const {}}) async {
    // final formData = FormData.fromMap(data);

    final response = await _client.post<String>(
      endpoint,
      data: data,
    );

    return parser.parseFromJson(response.data!);
  }

  Future<T> executeDelete<T>(String endpoint, JsonParser<T> parser,
      {Map<String, Object> data = const {}}) async {
    final response = await _client.delete<String>(endpoint);
    return parser.parseFromJson(response.data!);
  }

  Future<void> uploadFile(String endpoint, {required File file}) async {
    FormData formData;

    if (kIsWeb) {
      formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          await file.readAsBytes(),
          filename: 'doc.pdf',
          contentType: MediaType('application', 'pdf'),
        ),
      });
    } else {
      formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: 'doc.pdf',
          contentType: MediaType('application', 'pdf'),
        ),
      });
    }

    await _client.put(
      endpoint,
      data: formData,
    );
  }
}
