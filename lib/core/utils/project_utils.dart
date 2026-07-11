class ProjectUtils {
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
}