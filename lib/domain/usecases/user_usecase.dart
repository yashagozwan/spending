import '../models/user/user_model.dart';

abstract class UserUseCase {
  Future<bool> signIn();

  Future<bool> signOut();

  Future<UserModel?> getUser();
}
