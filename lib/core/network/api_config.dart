class ApiConfig {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://192.168.0.9:8000',
  );

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);

  static const String authSyncPath = '/auth/sync';
  static const String authMePath = '/auth/me';
  static const String iaRequestPath = '/ai/task';
  static const String startSessionPath = '/learning/sessions/start';
  static String submitAnswerPath(String sessionId) =>
      '/learning/sessions/$sessionId/answers';
  static String finishSessionPath(String sessionId) =>
      '/learning/sessions/$sessionId/finish';
}
