import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instacart/model/Auth/UserModel.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore instance = FirebaseFirestore.instance;

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Sign up method
  Future<bool> signUp(String email, String password,String name) async {
    _setLoading(true);
    try {
      final userCredential =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _setLoading(false);
      final userModel = UserModel(
        uid: userCredential.user!.uid,
        emailId: email,
        userName: name,
        mobileNumber: '',
        createdAt: DateTime.now(),
        updatedDate: null
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userModel.uid)
          .set(userModel.toMap());

      return true;
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
      return false;
    }
  }

  // Sign in method
  Future<bool> signIn(String email, String password) async {
    _setLoading(true);
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _setLoading(false);
      return true;
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
      return false;
    }
  }

  Future<bool> updateUser(String userName, String email, String number, String uid) async {
    _setLoading(true);
    try {
      final updatedModel = UserModel(
        uid: uid,
        emailId: email,
        userName: userName,
        mobileNumber: number,
        createdAt: null,
        updatedDate: DateTime.now()// won't override
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(updatedModel.uid)
          .update(updatedModel.toMap());

      _setLoading(false);
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }


  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _handleAuthError(FirebaseAuthException e) {
    _isLoading = false;
    _errorMessage = e.message;
    notifyListeners();
  }
}
