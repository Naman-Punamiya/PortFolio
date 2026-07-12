import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/core/constants/firebase_collections.dart';
import 'package:my_portfolio/core/utils/contact_utils.dart';

class ContactRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ContactUtils> getContact() async {
    final doc = await _firestore
        .collection(FirebaseCollections.contact)
        .doc("main")
        .get();

    if (!doc.exists) {
      throw Exception("Contact document not found.");
    }

    return ContactUtils.fromMap(doc.data()!);
  }
}