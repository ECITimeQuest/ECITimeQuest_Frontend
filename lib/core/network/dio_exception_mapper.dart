import 'package:dio/dio.dart';
import 'package:flutter_app/core/network/api_exception.dart';

class DioExceptionMapper {
  const DioExceptionMapper();

  ApiException map(DioException exception) {
    final response = exception.response;

    if (exception.type == DioExceptionType.badResponse) {
      return ApiException.fromResponse(
        statusCode: response?.statusCode,
        responseData: response?.data,
      );
    }

    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout) {
      return const ApiException(message: 'El servidor está tardando mucho en responder.');
    }

    if (exception.type == DioExceptionType.cancel) {
      return const ApiException(message: 'La solicitud fue cancelada.');
    }

    if (exception.type == DioExceptionType.connectionError) {
      return const ApiException(message: 'Servicio no disponible. Verifica tu conexión a internet.');
    }

    if (exception.type == DioExceptionType.badCertificate) {
      return const ApiException(message: 'Error de seguridad en la conexión.');
    }

    return ApiException.fromResponse(
      statusCode: response?.statusCode,
      responseData: response?.data,
      fallbackMessage: 'Ocurrió un error inesperado en la red.',
    );
  }
}
