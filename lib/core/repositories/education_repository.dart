import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/core/constants/firebase_collections.dart';
import 'package:my_portfolio/core/utils/education_utils.dart';

class EducationRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<EducationUtils> getEducation() async {
    final doc = await _firestore
        .collection(FirebaseCollections.education)
        .doc("main")
        .get();

    if (!doc.exists) {
      throw Exception("Education document not found.");
    }

    return EducationUtils.fromMap(doc.data()!);
  }
}