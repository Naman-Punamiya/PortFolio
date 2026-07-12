import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/core/constants/firebase_collections.dart';
import 'package:my_portfolio/core/utils/contact_message_utils.dart';

class ContactMessageRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(ContactMessageUtils message) async {
    await _firestore
        .collection(FirebaseCollections.messages)
        .add(message.toMap());
  }
}