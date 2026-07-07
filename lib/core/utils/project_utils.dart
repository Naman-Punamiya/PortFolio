class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

List<ProjectUtils> allProjectUtils = [
  ProjectUtils(
    image: "projects/HomePage.jpg",
    title: "GDG App",
    subtitle: "This is an demo app made for UI Feature.",
    androidLink: "",
    iosLink: "",
  ),
  ProjectUtils(
    image: "projects/HomePage.jpg",
    title: "GDG App",
    subtitle: "This is an demo app made for UI Feature.",
    androidLink: "",
    iosLink: "",
  ),
  ProjectUtils(
    image: "projects/HomePage.jpg",
    title: "GDG App",
    subtitle: "This is an demo app made for UI Feature.",
    androidLink: "",
    iosLink: "",
  ),
  ProjectUtils(
    image: "projects/HomePage.jpg",
    title: "GDG App",
    subtitle: "This is an demo app made for UI Feature.",
    androidLink: "",
    iosLink: "",
  ),
];
