enum TaskStatus {
  processing,
  completed,
  failed;

  static TaskStatus fromApiValue(String value) {
    return switch (value) {
      'processing' => TaskStatus.processing,
      'completed' => TaskStatus.completed,
      'failed' => TaskStatus.failed,
      _ => throw FormatException('Invalid task status: $value'),
    };
  }

  String toApiValue() {
    return switch (this) {
      TaskStatus.processing => 'processing',
      TaskStatus.completed => 'completed',
      TaskStatus.failed => 'failed',
    };
  }
}
