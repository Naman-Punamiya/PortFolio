class ContactUtils {
  final String email;
  final String phone;
  final String location;
  final String availability;
  final String title;
  final String subtitle;

  const ContactUtils({
    required this.email,
    required this.phone,
    required this.location,
    required this.availability,
    required this.title,
    required this.subtitle,
  });

  factory ContactUtils.fromMap(Map<String, dynamic> map) {
    return ContactUtils(
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      location: map['location'] ?? '',
      availability: map['availability'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
      'location': location,
      'availability': availability,
      'title': title,
      'subtitle': subtitle,
    };
  }
}