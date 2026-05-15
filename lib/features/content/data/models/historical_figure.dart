class HistoricalFigure {
  final String name;
  final String? role;
  final String biography;
  final int? birthYear;
  final int? deathYear;

  const HistoricalFigure({
    required this.name,
    this.role,
    required this.biography,
    this.birthYear,
    this.deathYear,
  });

  factory HistoricalFigure.fromJson(Map<String, dynamic> json) {
    return HistoricalFigure(
      name: json['name'] as String,
      role: json['role'] as String?,
      biography: json['biography'] as String,
      birthYear: json['birth_year'] as int?,
      deathYear: json['death_year'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'biography': biography,
      'birth_year': birthYear,
      'death_year': deathYear,
    };
  }
}
