import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../../core/Constant/API_Constants.dart';
import '../../domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final Logger _log;

  AuthRepoImpl({
    Logger logger,
    this.firebaseAuth,
    this.googleSignIn,
  }) : _log = logger;

  @override
  Future<void> logOut() async {
    _log.d("Signed Out");
    await firebaseAuth.signOut();
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      GoogleSignInAccount _googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication _auth = await _googleUser.authentication;

      GoogleAuthCredential _credential = GoogleAuthProvider.credential(
        accessToken: _auth.accessToken,
        idToken: _auth.idToken,
      );

      var res = await firebaseAuth.signInWithCredential(_credential);
      String idToken = await FirebaseAuth.instance.currentUser.getIdToken();
      googleSigning(idToken);
      _log.d(res.user);

      Hive.box("user").put("name", res.user.displayName);
      Hive.box("user").put("dp", res.user.photoURL);
      Hive.box("user").put("email", res.user.email);
      Hive.box("user").put("phone", res.user.phoneNumber);
      return res.user;
    } catch (e) {
      _log.e(e.toString());
      return null;
    }
  }

  @override
  Stream<User> get authState => firebaseAuth.authStateChanges();

  @override
  User getCurrentUser() {
    return firebaseAuth.currentUser;
  }
}

Future googleSigning(
  String token,
) async {
  try {
    print("###############################");
    final response = await http.post(
      ApiEndpoints.account,
      headers: {
        HttpHeaders.authorizationHeader: token,
      },
    );
    print("###############################");
    print(response.body);
    print("###############################");
  } catch (e) {
    print(e);
  }
}
