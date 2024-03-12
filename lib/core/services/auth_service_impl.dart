import 'package:injectable/injectable.dart';
import 'package:spending/domain/models/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_service.dart';

@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  final GoogleSignIn _googleSignIn;

  final FirebaseAuth _firebaseAuth;

  AuthServiceImpl(
    this._googleSignIn,
    this._firebaseAuth,
  );

  @override
  Future<UserModel?> getUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    return UserModel(
      id: user.uid,
      name: '${user.displayName}',
      avatar: '${user.photoURL}',
      email: '${user.email}',
    );
  }

  @override
  Future<bool> isLoggedId() async {
    return await _googleSignIn.isSignedIn();
  }

  @override
  Future<UserModel?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth == null) return null;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final googleCredential =
        await _firebaseAuth.signInWithCredential(credential);
    final user = googleCredential.user;

    if (user == null) return null;

    return UserModel(
      id: user.uid,
      name: '${user.displayName}',
      avatar: '${user.photoURL}',
      email: '${user.email}',
    );
  }

  @override
  Future<bool> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    return true;
  }
}
