import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/core/constants/firebase_collections.dart';
import 'package:my_portfolio/core/utils/project_utils.dart';

class ProjectRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProjectUtils>> getProjects() async {
    try {
      final snapshot = await _firestore
          .collection(FirebaseCollections.projects)
          .get();

      return snapshot.docs
          .map((doc) => ProjectUtils.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch projects: $e");
    }
  }

  Stream<List<ProjectUtils>> streamProjects() {
    return _firestore
        .collection(FirebaseCollections.projects)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ProjectUtils.fromMap(doc.data()))
              .toList(),
        );
  }
}
