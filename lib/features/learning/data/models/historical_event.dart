class HistoricalEvent {
  final String name;
  final String description;
  final int? year;
  final int? eraStartYear;
  final int? eraEndYear;
  final String? location;

  const HistoricalEvent({
    required this.name,
    required this.description,
    this.year,
    this.eraStartYear,
    this.eraEndYear,
    this.location,
  });

  factory HistoricalEvent.fromJson(Map<String, dynamic> json) {
    return HistoricalEvent(
      name: json['name'] as String,
      description: json['description'] as String,
      year: json['year'] as int?,
      eraStartYear: json['era_start_year'] as int?,
      eraEndYear: json['era_end_year'] as int?,
      location: json['location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'year': year,
      'era_start_year': eraStartYear,
      'era_end_year': eraEndYear,
      'location': location,
    };
  }
}
