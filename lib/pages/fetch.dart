import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remedi/pages/auth.dart';

class fetch extends StatefulWidget {
  fetch({super.key, this.user});
  final User? user;
  @override
  State<fetch> createState() => _fetchState();
}

class _fetchState extends State<fetch> {
  final _auth = AuthService();
  final db = FirebaseFirestore.instance.collection('PatientInfo');

  @override
  void initState() {
    super.initState();
  }

  Widget getActionItems() {
    return FutureBuilder<DocumentSnapshot>(
      future: db.doc(widget.user!.uid).get(),
      builder:  (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },);
  }

  // void async getFAQ() {

  // }

  // void async getAppts() {

  // }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(children: [
      Text("Sign in successful"),
      IconButton(onPressed: () => _auth.signOut(), icon: Icon(Icons.logout))
    ]));
  }
}
