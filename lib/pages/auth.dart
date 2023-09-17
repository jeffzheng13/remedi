import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:remedi/pages/database.dart';
import 'package:rxdart/rxdart.dart';

import 'user.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  //Stream<FirebaseUser> user;
  late Stream<Map<String, dynamic>> profile;
  PublishSubject loading = PublishSubject();

  // create user obj based on FirebaseUser
  User _userFromFirebaseUser(auth.User? user) {
    return User(uid: user!.uid);
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // register with Email and Password
  Future registerWithEmailAndPassword(String firstName, String lastName,
      String _email, String _password) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      auth.User? user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user!.uid)
          .updateUserData(firstName, lastName, _email, user.uid);

      return _userFromFirebaseUser(user);
    } on auth.FirebaseAuthException catch (e) {
      print("Caught exception " + e.code);
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String _email, String _password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      auth.User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with google
  Future googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      auth.UserCredential result = await _auth.signInWithCredential(credential);
      auth.User? user = result.user;

      await DatabaseService(uid: user!.uid).updateUserData(
          user.displayName!.split(" ")[0],
          user.displayName!.split(" ")[1],
          user.email,
          user.uid);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out logic
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
