class SkillUtils {
  final String id;
  final String image;
  final String title;
  final String? subtitle;
  final String type;

  const SkillUtils({
    required this.id,
    required this.image,
    required this.title,
    this.subtitle,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "image": image,
      "title": title,
      "subtitle": subtitle,
      "type": type,
    };
  }

  factory SkillUtils.fromMap(Map<String, dynamic> map) {
    return SkillUtils(
      id: map["id"] ?? "",
      image: map["image"] ?? "",
      title: map["title"] ?? "",
      subtitle: map["subtitle"],
      type: map["type"] ?? "",
    );
  }
}