import 'package:dio/dio.dart';
import 'package:flutter_app/core/network/api_config.dart';
import 'package:flutter_app/core/network/api_exception.dart';
import 'package:flutter_app/core/network/dio_exception_mapper.dart';
import 'package:flutter_app/features/auth/data/models/responses/user_response.dart';

class BackendAuthDataSource {
  final Dio _dio;
  final DioExceptionMapper _exceptionMapper;

  BackendAuthDataSource(this._dio, {DioExceptionMapper? exceptionMapper})
    : _exceptionMapper = exceptionMapper ?? const DioExceptionMapper();

  Future<UserResponse> syncUser() async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConfig.authSyncPath,
      );
      return _parseUserResponse(response.data);
    } on DioException catch (exception) {
      throw _exceptionMapper.map(exception);
    }
  }

  Future<UserResponse> getMe() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiConfig.authMePath,
      );
      return _parseUserResponse(response.data);
    } on DioException catch (exception) {
      throw _exceptionMapper.map(exception);
    }
  }

  UserResponse _parseUserResponse(Map<String, dynamic>? data) {
    if (data == null) {
      throw const ApiException(message: 'Empty response body');
    }

    return UserResponse.fromJson(data);
  }
}
