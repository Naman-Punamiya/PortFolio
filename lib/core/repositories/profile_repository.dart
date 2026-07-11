import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/core/constants/firebase_collections.dart';
import 'package:my_portfolio/core/utils/profile_utils.dart';

class ProfileRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ProfileUtils> getProfile() async {
    try {
      final doc = await _firestore
          .collection(FirebaseCollections.profile)
          .doc("main")
          .get();

      return ProfileUtils.fromMap(doc.data()!);
    } catch (e) {
      throw Exception("Failed to fetch profile: $e");
    }
  }

  Stream<ProfileUtils> streamProfile() {
    return _firestore
        .collection(FirebaseCollections.profile)
        .doc("main")
        .snapshots()
        .map(
          (doc) => ProfileUtils.fromMap(doc.data()!),
        );
  }
}