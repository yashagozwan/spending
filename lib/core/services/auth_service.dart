import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

@lazySingleton
class AuthService {
  final Logger _logger;

  AuthService(this._logger);

  Future<UserCredential?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth == null) return null;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );

    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> isSignedIn() async {
    final user = FirebaseAuth.instance.currentUser;
    _logger.d(user.toString());
  }
}
