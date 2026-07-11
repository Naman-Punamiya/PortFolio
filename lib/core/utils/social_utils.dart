class SocialUtils {
  final String github;
  final String linkedin;
  final String leetcode;
  final String email;
  final String instagram;

  const SocialUtils({
    required this.github,
    required this.linkedin,
    required this.leetcode,
    required this.email,
    required this.instagram,
  });

  Map<String, dynamic> toMap() {
    return {
      "github": github,
      "linkedin": linkedin,
      "leetcode": leetcode,
      "email": email,
      "instagram": instagram,
    };
  }

  factory SocialUtils.fromMap(Map<String, dynamic> map) {
    return SocialUtils(
      github: map["github"] ?? "",
      linkedin: map["linkedin"] ?? "",
      leetcode: map["leetcode"] ?? "",
      email: map["email"] ?? "",
      instagram: map["instagram"] ?? "",
    );
  }
}