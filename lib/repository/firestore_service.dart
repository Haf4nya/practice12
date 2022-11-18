import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice12/helpers/constant_firebase.dart';

class FirestoreService {
  static Future getUserById(String uid) async {
    DocumentSnapshot doc = await fbFirestore.collection('users').doc(uid).get();
    return doc.data();
  }

  static Future<void> addHomePhone(String addres, String code) async {
    DocumentReference ref =
        FirebaseFirestore.instance.collection('homePhones').doc();
    ref.set({'id': ref.id, 'address': addres, 'code': code});
  }

  static Future getHomePhones(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('homePhones').doc(id).get();
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

  static Future<void> addApartment(
      String address, String number, String photoUrl, String id) async {
    DocumentReference ref =
        FirebaseFirestore.instance.collection('apartments').doc(id);
    ref.set({
      'id': id,
      'address': address,
      'number': number,
      'mainPhoto': photoUrl
    });
  }

  // Добавление аватара на модерацию
  static Future<void> addMainPhotoValid(
      DateTime date, String url, String uid) async {
    DocumentReference ref =
        FirebaseFirestore.instance.collection("apartments").doc();
    ref.set({
      'date': date,
      'uid': uid,
      'url': url,
      'id': ref.id,
    });
  }

  static Future<void> AddMainPhotoValid(
      DateTime date, String url, String uid) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('apartments')
        .doc(uid)
        .get();
  }

  // Добавление фото на модерацию , создание ссылки на фото
  static Future<void> getPhotoByApartment(
      DateTime date, String url, String appartmentUid) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('apartments')
        .doc(appartmentUid)
        .get();
  }

  static Future getApartments(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('apartments').doc(id).get();
    return doc.data();
  }
}
