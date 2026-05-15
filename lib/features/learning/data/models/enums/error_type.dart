enum ErrorType {
  factual,
  conceptual,
  contextual;

  static ErrorType fromApiValue(String value) {
    return switch (value) {
      'factual' => ErrorType.factual,
      'conceptual' => ErrorType.conceptual,
      'contextual' => ErrorType.contextual,
      _ => throw FormatException('Invalid error type: $value'),
    };
  }

  String toApiValue() {
    return switch (this) {
      ErrorType.factual => 'factual',
      ErrorType.conceptual => 'conceptual',
      ErrorType.contextual => 'contextual',
    };
  }
}
