import 'package:dio/dio.dart';
import 'package:flutter_app/core/network/api_config.dart';
import 'package:flutter_app/core/network/dio_exception_mapper.dart';
import 'package:flutter_app/features/learning/data/models/requests/finish_session_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/start_session_request.dart';
import 'package:flutter_app/features/learning/data/models/requests/submit_answer_request.dart';
import 'package:flutter_app/features/learning/data/models/responses/learning_session_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/submit_answer_response.dart';

class LearningDataSource {
  final Dio _dio;
  final DioExceptionMapper _exceptionMapper;

  LearningDataSource(this._dio, {DioExceptionMapper? exceptionMapper})
    : _exceptionMapper = exceptionMapper ?? const DioExceptionMapper();

  Future<LearningSessionResponse> startSession(
    StartSessionRequest request,
  ) async {
    try {
      final response = await _dio.post(
        ApiConfig.startSessionPath,
        data: request.toJson(),
      );
      return LearningSessionResponse.fromJson(response.data);
    } on DioException catch (exception) {
      throw _exceptionMapper.map(exception);
    }
  }

  Future<SubmitAnswerResponse> submitAnswer(SubmitAnswerRequest request) async {
    try {
      final response = await _dio.post(
        ApiConfig.submitAnswerPath(request.sessionId),
        data: request.toJson(),
      );
      return SubmitAnswerResponse.fromJson(response.data);
    } on DioException catch (exception) {
      throw _exceptionMapper.map(exception);
    }
  }

  Future<LearningSessionResponse> finishSession(
    FinishSessionRequest request,
    String sessionId,
  ) async {
    try {
      final response = await _dio.post(
        ApiConfig.finishSessionPath(sessionId),
        data: request.toJson(),
      );
      return LearningSessionResponse.fromJson(response.data);
    } on DioException catch (exception) {
      throw _exceptionMapper.map(exception);
    }
  }
}
