import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/network/api_config.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      headers: const {'Content-Type': 'application/json'},
      responseType: ResponseType.json,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final token = await user.getIdToken(true);
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }

        developer.log(
          '➡️ ${options.method} ${options.path}',
          name: 'HTTP',
          level: 500,
        );

        handler.next(options);
      },
      onResponse: (response, handler) {
        developer.log(
          '✅ ${response.statusCode} ${response.requestOptions.path}',
          name: 'HTTP',
          level: 800,
        );

        handler.next(response);
      },
      onError: (error, handler) {
        developer.log(
          '❌ ${error.response?.statusCode} ${error.requestOptions.path}',
          name: 'HTTP',
          error: error,
          stackTrace: error.stackTrace,
          level: 1000,
        );

        handler.next(error);
      },
    ),
  );

  return dio;
});
