class HistoricalPeriodResponse {
  final String id;
  final String name;
  final String description;
  final int? startYear;
  final int? endYear;
  final int order;
  final bool isActive;
  final bool isPublished;
  final int version;
  final DateTime createdAt;
  final DateTime updatedAt;

  const HistoricalPeriodResponse({
    required this.id,
    required this.name,
    required this.description,
    this.startYear,
    this.endYear,
    required this.order,
    required this.isActive,
    required this.isPublished,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HistoricalPeriodResponse.fromJson(Map<String, dynamic> json) {
    return HistoricalPeriodResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      startYear: json['start_year'] as int?,
      endYear: json['end_year'] as int?,
      order: json['order'] as int,
      isActive: json['is_active'] as bool,
      isPublished: json['is_published'] as bool,
      version: json['version'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}
