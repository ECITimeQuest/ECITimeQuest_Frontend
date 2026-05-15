class ApiConfig {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://192.168.100.3:8000',
  );

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);

  // Auth
  static const String authSyncPath = '/auth/sync';
  static const String authMePath = '/auth/me';
  static String updateSubscriptionPath(String userId) =>
      '/auth/users/$userId/subscription';

  // IA
  static const String iaRequestPath = '/ai/task';
  static String iaTaskPath(String taskId) => '/ai/task/$taskId';

  // Learning
  static const String userProgressPath = '/learning/progress';
  static const String startSessionPath = '/learning/sessions/start';
  static String submitAnswerPath(String sessionId) =>
      '/learning/sessions/$sessionId/answers';
  static String finishSessionPath(String sessionId) =>
      '/learning/sessions/$sessionId/finish';
  static String badgesPath = '/learning/badges';
  static String conceptGapsPath = '/learning/gaps';
  static String eraMasteryPath = '/learning/periods/mastery';
  static String homeSummaryPath = '/learning/home-summary';

  // Content
  static String getIAContext(String topicId) =>
      '/content/topics/$topicId/ai-context';
  static String listPeriods = '/content/periods';
  static String getPeriod(String periodId) => '/content/periods/$periodId';
  static String listTopics(String periodId) =>
      '/content/periods/$periodId/topics';
  static String getTopic(String topicId) => '/content/topics/$topicId';
}
