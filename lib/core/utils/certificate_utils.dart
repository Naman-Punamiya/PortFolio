class CertificateUtils {
  final String id;
  final String image;
  final String title;
  final String issuer;
  final String date;
  final String category;
  final String? certificateLink;

  const CertificateUtils({
    required this.id,
    required this.image,
    required this.title,
    required this.issuer,
    required this.date,
    required this.category,
    this.certificateLink,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "image": image,
      "title": title,
      "issuer": issuer,
      "date": date,
      "category": category,
      "certificateLink": certificateLink,
    };
  }

  factory CertificateUtils.fromMap(Map<String, dynamic> map) {
    return CertificateUtils(
      id: map["id"] ?? "",
      image: map["image"] ?? "",
      title: map["title"] ?? "",
      issuer: map["issuer"] ?? "",
      date: map["date"] ?? "",
      category: map["category"] ?? "",
      certificateLink: map["certificateLink"],
    );
  }
}
