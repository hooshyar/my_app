import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/src/models/my_app_user.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserOfApp> addUserWithIntialInformatinToDb(
      {required User user, required String name, required String phone}) async {
    UserOfApp userOfApp = UserOfApp(
      name: name,
      dateTime: DateTime.now(),
      phonenumber: phone,
      email: user.email!,
      uid: user.uid,
    );
    await _firestore.collection('user').doc(user.uid).set(userOfApp.toMap());
    return userOfApp;
  }
}
