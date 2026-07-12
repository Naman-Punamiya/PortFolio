import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/core/constants/firebase_collections.dart';
import 'package:my_portfolio/core/utils/goal_utils.dart';

class GoalRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<GoalUtils>> getGoals() async {
    final snapshot = await _firestore
        .collection(FirebaseCollections.goals)
        .get();

    return snapshot.docs
        .map((doc) => GoalUtils.fromMap(doc.id, doc.data()))
        .toList();
  }
}