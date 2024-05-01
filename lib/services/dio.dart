import 'package:dio/dio.dart';

class DioHelper {
  final _dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
    ),
  );

  static final i = DioHelper();

  Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(path, queryParameters: query);
  }
}
