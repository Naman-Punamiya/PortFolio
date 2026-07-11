class ProjectUtils {
  final String id;
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final List<String>? techs;
  final String? github;
  final String? liveDemo;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    this.techs,
    this.github,
    this.liveDemo,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'techs': techs ?? [],
      'github': github,
      'liveDemo': liveDemo,
      'androidLink': androidLink,
      'iosLink': iosLink,
      'webLink': webLink,
    };
  }

  factory ProjectUtils.fromMap(Map<String, dynamic> map) {
    return ProjectUtils(
      id: map["id"] ?? "",
      image: map["image"] ?? "",
      title: map["title"] ?? "",
      subtitle: map["subtitle"] ?? "",
      description: map["description"] ?? "",
      techs: List<String>.from(map["techs"] ?? []),
      github: map["github"],
      liveDemo: map["liveDemo"],
      androidLink: map["androidLink"],
      iosLink: map["iosLink"],
      webLink: map["webLink"],
    );
  }
}
