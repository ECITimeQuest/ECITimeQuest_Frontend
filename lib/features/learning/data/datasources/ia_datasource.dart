import 'package:dio/dio.dart';
import 'package:flutter_app/core/network/api_config.dart';
import 'package:flutter_app/core/network/api_exception.dart';
import 'package:flutter_app/core/network/dio_exception_mapper.dart';
import 'package:flutter_app/features/learning/data/models/requests/ia_task_request.dart';
import 'package:flutter_app/features/learning/data/models/responses/ia_task_response.dart';

class IADataSource {
  final Dio _dio;
  final DioExceptionMapper _exceptionMapper;

  IADataSource(this._dio, {DioExceptionMapper? exceptionMapper})
    : _exceptionMapper = exceptionMapper ?? const DioExceptionMapper();

  Future<IATaskResponse> requestIATask(IATaskRequest request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConfig.iaRequestPath,
        data: request.toJson(),
      );
      return _parseIATaskResponse(response.data);
    } on DioException catch (exception) {
      throw _exceptionMapper.map(exception);
    }
  }

  Future<IATaskResponse> getIATask(String taskId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${ApiConfig.iaRequestPath}/$taskId',
      );
      return _parseIATaskResponse(response.data);
    } on DioException catch (exception) {
      throw _exceptionMapper.map(exception);
    }
  }

  IATaskResponse _parseIATaskResponse(Map<String, dynamic>? data) {
    if (data == null) {
      throw const ApiException(message: 'Empty response body');
    }

    return IATaskResponse.fromJson(data);
  }
}
