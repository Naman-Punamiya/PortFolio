class EducationUtils {
  final String degree;
  final String university;
  final String location;
  final String startYear;
  final String endYear;
  final String cgpa;
  final String description;
  final List<String> points;

  const EducationUtils({
    required this.degree,
    required this.university,
    required this.location,
    required this.startYear,
    required this.endYear,
    required this.cgpa,
    required this.description,
    required this.points,
  });

  factory EducationUtils.fromMap(Map<String, dynamic> map) {
    return EducationUtils(
      degree: map['degree'] ?? '',
      university: map['university'] ?? '',
      location: map['location'] ?? '',
      startYear: map['startYear'] ?? '',
      endYear: map['endYear'] ?? '',
      cgpa: map['cgpa'] ?? '',
      description: map['description'] ?? '',
      points: List<String>.from(map['points'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'degree': degree,
      'university': university,
      'location': location,
      'startYear': startYear,
      'endYear': endYear,
      'cgpa': cgpa,
      'description': description,
      'points': points,
    };
  }
}