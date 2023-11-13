import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../AllScreen/RegisterScreen.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? gAuth = await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken,
        idToken: gAuth?.idToken,
      );

      final UserCredential userCredential =
      await _firebaseAuth.signInWithCredential(credential);
      final User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        // Lưu thông tin người dùng lên Firebase
        await saveUserInfoToFirebase(firebaseUser);

        return firebaseUser;
      } else {
        displayToastMessage("Lỗi đăng nhập", context);
        return null;
      }
    } catch (e) {
      displayToastMessage("Lỗi: $e", context);
      return null;
    }
  }

  Future<void> saveUserInfoToFirebase(User firebaseUser) async {
    final usersRef = FirebaseDatabase.instance.reference().child("users");
    final userDateMap = {
      "email": firebaseUser.email,
      // Thêm thông tin người dùng khác tại đây nếu cần thiết
    };

    await usersRef.child(firebaseUser.uid).set(userDateMap);
  }
}