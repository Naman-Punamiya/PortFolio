import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/core/constants/firebase_collections.dart';
import 'package:my_portfolio/core/utils/certificate_utils.dart';

class CertificateRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CertificateUtils>> getCertificates() async {
    try {
      final snapshot = await _firestore
          .collection(FirebaseCollections.certificates)
          .get();

      return snapshot.docs
          .map((doc) => CertificateUtils.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch certificates: $e");
    }
  }

  Stream<List<CertificateUtils>> streamCertificates() {
    return _firestore
        .collection(FirebaseCollections.certificates)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => CertificateUtils.fromMap(doc.data()))
              .toList(),
        );
  }
}
