class GoalUtils {
  final String id;
  final String title;
  final String subtitle;
  final String icon;

  const GoalUtils({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  factory GoalUtils.fromMap(String id, Map<String, dynamic> map) {
    return GoalUtils(
      id: id,
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'icon': icon,
    };
  }
}