import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce/model/response_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final shared = AuthService();
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

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

  void registerUserByEmail(
    String email,
    String password,
    String fullname,
    int phone_number,
  ) async {
    try {
      AuthResult user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(user.user.uid);
    } catch (err) {
      print(err);
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
