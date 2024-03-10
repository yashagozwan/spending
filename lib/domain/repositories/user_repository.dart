import '../models/user/user_model.dart';

abstract class UserRepository {
  Future<bool> signIn();

  Future<bool> signOut();

  Future<UserModel?> getUser();
}
