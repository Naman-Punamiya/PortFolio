import 'package:cloud_firestore/cloud_firestore.dart';

class ContactMessageUtils {
  final String name;
  final String email;
  final String subject;
  final String message;
  final bool isRead;
  final Timestamp? createdAt;

  ContactMessageUtils({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
    this.isRead = false,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "subject": subject,
      "message": message,
      "isRead": isRead,
      "createdAt": FieldValue.serverTimestamp(),
    };
  }
}