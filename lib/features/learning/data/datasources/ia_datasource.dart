import 'package:dio/dio.dart';
import 'package:flutter_app/core/network/api_config.dart';
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
      final response = await _dio.post(
        ApiConfig.iaRequestPath,
        data: request.toJson(),
      );
      return IATaskResponse.fromJson(response.data);
    } on DioException catch (exception) {
      throw _exceptionMapper.map(exception);
    }
  }

  Future<IATaskResponse> getIATask(String taskId) async {
    try {
      final response = await _dio.get('${ApiConfig.iaRequestPath}/$taskId');
      return IATaskResponse.fromJson(response.data);
    } on DioException catch (exception) {
      throw _exceptionMapper.map(exception);
    }
  }
}
