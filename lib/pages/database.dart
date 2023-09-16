import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
      // ignore: non_constant_identifier_names
      String firstName, String lastName, String email, String uid) async {
    return await userCollection.doc(uid).set({
      'first_name': firstName,
      'last_name': lastName,
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}