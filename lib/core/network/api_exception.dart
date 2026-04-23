class ApiException implements Exception {
  final int? statusCode;
  final String message;

  const ApiException({this.statusCode, required this.message});

  factory ApiException.fromResponse({
    int? statusCode,
    Object? responseData,
    String fallbackMessage = 'Unexpected API error',
  }) {
    String message = fallbackMessage;

    if (responseData is Map<String, dynamic>) {
      final dynamic detail = responseData['detail'] ?? responseData['details'];
      if (detail != null) {
        message = detail.toString();
      }
    }

    return ApiException(statusCode: statusCode, message: message);
  }

  @override
  String toString() {
    if (statusCode == null) {
      return 'ApiException(message: $message)';
    }

    return 'ApiException(statusCode: $statusCode, message: $message)';
  }
}
