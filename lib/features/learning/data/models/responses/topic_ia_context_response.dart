class TopicAIContextResponse {
  final String topicId;
  final String topicName;
  final String topicDescription;
  final int difficulty;
  final String? difficultyHint;
  final String periodName;
  final List<HistoricalEventResponse> events;
  final List<HistoricalFigureResponse> figures;

  TopicAIContextResponse({
    required this.topicId,
    required this.topicName,
    required this.topicDescription,
    required this.difficulty,
    required this.difficultyHint,
    required this.periodName,
    required this.events,
    required this.figures,
  });

  factory TopicAIContextResponse.fromJson(Map<String, dynamic> json) {
    return TopicAIContextResponse(
      topicId: json['topic_id'],
      topicName: json['topic_name'],
      topicDescription: json['topic_description'],
      difficulty: json['difficulty'],
      difficultyHint: json['difficulty_hint'],
      periodName: json['period_name'],
      events:
          (json['events'] as List<dynamic>?)
              ?.map(
                (dynamic e) =>
                    HistoricalEventResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      figures:
          (json['figures'] as List<dynamic>?)
              ?.map(
                (dynamic e) => HistoricalFigureResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );
  }
}

class HistoricalEventResponse {
  final String id;
  final String name;
  final String description;
  final int? year;
  final int? eraStartYear;
  final int? eraEndYear;
  final String? location;
  final String? difficultyHint;
  final bool isPublished;
  final int version;
  final DateTime createdAt;
  final DateTime updatedAt;

  HistoricalEventResponse({
    required this.id,
    required this.name,
    required this.description,
    this.year,
    this.eraStartYear,
    this.eraEndYear,
    this.location,
    this.difficultyHint,
    required this.isPublished,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HistoricalEventResponse.fromJson(Map<String, dynamic> json) {
    return HistoricalEventResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      year: json['year'] as int?,
      eraStartYear: json['era_start_year'] as int?,
      eraEndYear: json['era_end_year'] as int?,
      location: json['location'] as String?,
      difficultyHint: json['difficulty_hint'] as String?,
      isPublished: json['is_published'] as bool,
      version: json['version'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}

class HistoricalFigureResponse {
  final String id;
  final String name;
  final String? role;
  final String biography;
  final int? birthYear;
  final int? deathYear;
  final String? difficultyHint;
  final bool isPublished;
  final int version;
  final DateTime createdAt;
  final DateTime updatedAt;

  HistoricalFigureResponse({
    required this.id,
    required this.name,
    this.role,
    required this.biography,
    this.birthYear,
    this.deathYear,
    this.difficultyHint,
    required this.isPublished,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HistoricalFigureResponse.fromJson(Map<String, dynamic> json) {
    return HistoricalFigureResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String?,
      biography: json['biography'] as String,
      birthYear: json['birth_year'] as int?,
      deathYear: json['death_year'] as int?,
      difficultyHint: json['difficulty_hint'] as String?,
      isPublished: json['is_published'] as bool,
      version: json['version'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}
