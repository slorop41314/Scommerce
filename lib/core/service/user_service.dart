import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce/core/model/userModel.dart';
import 'package:flutter_ecommerce/utils/constant.dart';

class UserService {
  static final shared = UserService();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore _firestore = Firestore.instance;

  Future<User> getUserData() async {
    final user = await _auth.currentUser();
    if (user != null) {
      final res = await _firestore
          .collection(DBCollection.userCollection)
          .document(user.uid)
          .get();
      final userData = User.fromJson(res.data);
      return userData;
    }
    return User(fullname: "", email: "", phoneNumber: "");
  }
}
