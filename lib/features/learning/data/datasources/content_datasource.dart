import 'package:dio/dio.dart';
import 'package:flutter_app/core/network/api_config.dart';
import 'package:flutter_app/core/network/dio_exception_mapper.dart';
import 'package:flutter_app/features/learning/data/models/responses/historical_period_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/topic_response.dart';
import 'package:flutter_app/features/learning/data/models/responses/topic_ia_context_response.dart';

class ContentDataSource {
  final Dio _dio;
  final DioExceptionMapper _exceptionMapper;

  ContentDataSource(this._dio, {DioExceptionMapper? exceptionMapper})
    : _exceptionMapper = exceptionMapper ?? const DioExceptionMapper();

  Future<TopicAIContextResponse> getIAContext(String topicId) async {
    try {
      final response = await _dio.get(ApiConfig.getIAContext(topicId));
      return TopicAIContextResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _exceptionMapper.map(e);
    }
  }

  Future<List<HistoricalPeriodResponse>> listPeriods() async {
    try {
      final response = await _dio.get(ApiConfig.listPeriods);
      final List<dynamic> data = response.data;
      return data
          .map((item) => HistoricalPeriodResponse.fromJson(item))
          .toList();
    } on DioException catch (e) {
      throw _exceptionMapper.map(e);
    }
  }

  Future<HistoricalPeriodResponse> getPeriod(String periodId) async {
    try {
      final response = await _dio.get(ApiConfig.getPeriod(periodId));
      return HistoricalPeriodResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _exceptionMapper.map(e);
    }
  }

  Future<List<TopicResponse>> listTopics(String periodId) async {
    try {
      final response = await _dio.get(ApiConfig.listTopics(periodId));
      final List<dynamic> data = response.data;
      return data.map((item) => TopicResponse.fromJson(item)).toList();
    } on DioException catch (e) {
      throw _exceptionMapper.map(e);
    }
  }

  Future<TopicResponse> getTopic(String topicId) async {
    try {
      final response = await _dio.get(ApiConfig.getTopic(topicId));
      return TopicResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _exceptionMapper.map(e);
    }
  }
}
