class ProfileUtils {
  final String name;
  final String designation;
  final String heroSubtitle;
  final String about;
  final String email;
  final String location;
  final List<String> availability;
  final String resumeUrl;
  final String profileImageUrl;

  const ProfileUtils({
    required this.name,
    required this.designation,
    required this.heroSubtitle,
    required this.about,
    required this.email,
    required this.location, 
    required this.availability, 
    required this.resumeUrl, 
    required this.profileImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "designation": designation,
      "heroSubtitle": heroSubtitle,
      "about": about,
      "email": email,
      "location": location,
      "availability": availability,
      'resumeUrl': resumeUrl,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory ProfileUtils.fromMap(Map<String, dynamic> map) {
    return ProfileUtils(
      name: map["name"] ?? "",
      designation: map["designation"] ?? "",
      heroSubtitle: map["heroSubtitle"] ?? "",
      about: map["about"] ?? "",
      email: map["email"] ?? "",
      location: map["location"] ?? "",
      availability: List<String>.from(map["availability"] ?? []),
      resumeUrl: map['resumeUrl'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
    );
  }
}