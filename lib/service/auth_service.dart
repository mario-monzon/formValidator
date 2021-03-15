import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_form_validation/models/member_model.dart';

import 'database_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create member obj based on firebase user
  Member _userFromFirebaseUser(User user) {
    return user != null ? Member(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
    // .authStateChanges
    // //.map((FirebaseUser user) => _userFromFirebaseUser(user));
    // .map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
