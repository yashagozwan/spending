import 'package:spending/domain/models/user/user_model.dart';

abstract class AuthService {
  Future<UserModel?> signInWithGoogle();

  Future<bool> isLoggedId();

  Future<UserModel?> getUser();

  Future<bool> signOut();
}
