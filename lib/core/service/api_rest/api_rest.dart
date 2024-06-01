import 'package:cryptovisor/core/service/api_rest/interfaces/api_rest_interface.dart';
import 'package:cryptovisor/core/settings_app.dart';
import 'package:dio/dio.dart';

class ApiRest extends IApiRest {
  final Dio _dio =
      Dio(BaseOptions(headers: SettingsApp.headerDefaultSecurity, connectTimeout: const Duration(minutes: 1)));

  @override
  Future get(String path, {Map<String, dynamic>? query}) {
    return _dio.get(path, queryParameters: query);
  }
}
