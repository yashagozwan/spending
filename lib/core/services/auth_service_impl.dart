import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:spending/domain/models/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_service.dart';

@named
@LazySingleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  final Logger _logger;
  final GoogleSignIn _googleSignIn;

  final FirebaseAuth _firebaseAuth;

  AuthServiceImpl(
    this._logger,
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
  Future<UserModel?> signOut() async {
    final user = await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    if (user == null) return null;
    return UserModel(
      id: user.id,
      name: '${user.displayName}',
      avatar: '${user.photoUrl}',
      email: user.email,
    );
  }

// Future<UserCredential?> signInWithGoogle() async {
//   final googleUser = await GoogleSignIn().signIn();
//   final googleAuth = await googleUser?.authentication;
//
//   if (googleAuth == null) return null;
//
//   final credential = GoogleAuthProvider.credential(
//     idToken: googleAuth.idToken,
//     accessToken: googleAuth.accessToken,
//   );
//
//   return FirebaseAuth.instance.signInWithCredential(credential);
// }
//
// Future<void> isSignedIn() async {
//   final user = FirebaseAuth.instance.currentUser;
//   _logger.d(user.toString());
// }
//
// Future<void> signOut() async {
//   final googleUser = await GoogleSignIn().signOut();
//   await FirebaseAuth.instance.signOut();
//   _logger.d(googleUser.toString());
// }
}
