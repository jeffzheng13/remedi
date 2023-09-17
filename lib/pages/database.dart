import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('PatientInfo');

  Future updateUserData(String firstName, String lastName, String? email, String uid) async {
    return await userCollection.doc(uid).set({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'uid': uid,
    }, SetOptions(merge: true)).onError((e, _) => print("Error writing document: $e"));
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}