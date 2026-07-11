import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/core/constants/firebase_collections.dart';
import 'package:my_portfolio/core/utils/skill_utils.dart';

class SkillRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<SkillUtils>> getSkills() async {
    try {
      final snapshot = await _firestore
          .collection(FirebaseCollections.skills)
          .get();

      return snapshot.docs
          .map((doc) => SkillUtils.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch skills: $e");
    }
  }

  Stream<List<SkillUtils>> streamSkills() {
    return _firestore
        .collection(FirebaseCollections.skills)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => SkillUtils.fromMap(doc.data()))
              .toList(),
        );
  }

  Future<List<SkillUtils>> getPlatformSkills() async {
    final skills = await getSkills();

    return skills.where((skill) => skill.type == "platform").toList();
  }

  Future<List<SkillUtils>> getTechnologySkills() async {
    final skills = await getSkills();

    return skills.where((skill) => skill.type == "technology").toList();
  }
}
