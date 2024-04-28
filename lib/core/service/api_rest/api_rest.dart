import 'package:cryptovisor/core/service/api_rest/interfaces/api_rest_interface.dart';
import 'package:dio/dio.dart';

class ApiRest extends IApiRest {
  final Dio _dio = Dio(BaseOptions(connectTimeout: const Duration(minutes: 1)));

  @override
  Future get(String path, {Map<String, dynamic>? query}) {
    return _dio.get(path, queryParameters: query);
  }
}
