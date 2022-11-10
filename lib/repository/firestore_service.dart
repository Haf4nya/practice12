import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice12/helpers/constant_firebase.dart';

class FirestoreService {
  static Future getUserById(String uid) async {
    DocumentSnapshot doc = await fbFirestore.collection('users').doc(uid).get();
    return doc.data();
  }

  static Future<bool> initCurrentUser(String uid) async {
    try {
      bool value =
          await fbFirestore.collection('users').doc(uid).get().then((result) {
        if (result.exists) {
          return true;
        } else {
          return false;
        }
      });
      return value;
    } catch (e) {
      return false;
    }
  }
}
