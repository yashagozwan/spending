import 'package:spending/domain/models/user/user_model.dart';

abstract class UserLocalDataSource {
  Future<UserModel?> getUser();

  Future<bool> insertUser(UserModel user);

  Future<bool> signOut();
}
