import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/core/constants/firebase_collections.dart';
import 'package:my_portfolio/core/utils/social_utils.dart';

class SocialRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SocialUtils> getSocials() async {
    try {
      final doc = await _firestore
          .collection(FirebaseCollections.socials)
          .doc("links")
          .get();

      return SocialUtils.fromMap(doc.data()!);
    } catch (e) {
      throw Exception("Failed to fetch social links: $e");
    }
  }

  Stream<SocialUtils> streamSocials() {
    return _firestore
        .collection(FirebaseCollections.socials)
        .doc("links")
        .snapshots()
        .map(
          (doc) => SocialUtils.fromMap(doc.data()!),
        );
  }
}