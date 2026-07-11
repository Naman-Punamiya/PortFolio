class ProfileUtils {
  final String name;
  final String designation;
  final String heroSubtitle;
  final String about;
  final String email;
  final String location;

  const ProfileUtils({
    required this.name,
    required this.designation,
    required this.heroSubtitle,
    required this.about,
    required this.email,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "designation": designation,
      "heroSubtitle": heroSubtitle,
      "about": about,
      "email": email,
      "location": location,
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
    );
  }
}