import 'package:spending/domain/models/user/user_model.dart';

abstract class UserRemoteDataSource {
  Future<bool> signOut();

  Future<UserModel?> signInWithGoogle();
}
