import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce/core/model/response_model.dart';
import 'package:flutter_ecommerce/utils/constant.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final shared = AuthService();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore _firestore = Firestore.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    print("signInWithGoogle succeeded: $user");
    return 'signInWithGoogle succeeded: $user';
  }

  Future<bool> checkCurrentUser() async {
    try {
      FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future<Response> registerUserByEmail(
    String email,
    String password,
    String fullname,
    String phoneNumber,
  ) async {
    Response response = Response(
      data: null,
      isSuccess: false,
      message: "",
    );
    try {
      AuthResult user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final data = {
        "email": email,
        "fullname": fullname,
        "phone_number": phoneNumber
      };
      await _firestore
          .collection(DBCollection.userCollection)
          .document(user.user.uid)
          .setData(data);
      response = Response(
        data: data,
        isSuccess: true,
        message: "Success register user",
      );
      return response;
    } catch (err) {
      print(err);
      return response;
    }
  }

  Future<Response> loginUserByEmail(String email, String password) async {
    Response response = Response(
      data: null,
      isSuccess: false,
      message: "",
    );
    try {
      AuthResult user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      response = Response(
        data: user,
        isSuccess: true,
        message: "Success login user",
      );
      return response;
    } catch (err) {
      return response;
    }
  }

  void logoutUser() async {
    try {
      await _auth.signOut();
    } catch (err) {
      print(err);
    }
  }
}
