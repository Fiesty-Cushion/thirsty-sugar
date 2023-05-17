import 'package:attendy/core/utils.dart';
import 'package:attendy/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //User SingUp
  Future<void> userSignUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      //register user
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      model.User _user = model.User(email: email, uid: credential.user!.uid);

      //add User to Database
      await _firestore.collection('users').doc(credential.user!.uid).set(_user.toJson());
      showSnackBar(context, 'Successfully Signed Up');

    } on FirebaseAuthException catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  //User LogIn
  Future<String> userLogIn({
    required String email,
    required String password,
    required BuildContext context,
}) async {
    String status = '';
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      status = 'success';
    } on FirebaseException catch (e) {
      showSnackBar(context, e.toString());
      status = 'error';
    }
    return status;
  }

}
