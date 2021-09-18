import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'json_parsers/json_parsers.dart';

class RequestREST {
  const RequestREST();

  /// HTTP dio client
  static final _client = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3000/api/v1/',
      connectTimeout: 3000, // 3 seconds
      receiveTimeout: 3000, // 3 seconds
      // headers: <String, String>{
      //   "token": '',
      // },
    ),
  );

  void setUpLogger() {
    // _client.interceptors.add(PrettyDioLogger());

    _client.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
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
}
