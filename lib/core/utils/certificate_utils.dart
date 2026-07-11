class CertificateUtils {
  final String image;
  final String title;
  final String issuer;
  final String date;
  final String category;
  final String? certificateLink;

  const CertificateUtils({
    required this.image,
    required this.title,
    required this.issuer,
    required this.date,
    required this.category,
    this.certificateLink,
  });
}