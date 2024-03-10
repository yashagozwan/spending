import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/local/floor/user/user_floor.dart';
import 'package:spending/domain/models/user/user_model.dart';

@lazySingleton
class UserMapper {
  UserFloor toFloor(UserModel user) {
    return UserFloor(
      id: user.id,
      name: user.name,
      email: user.email,
      avatar: user.avatar,
    );
  }

  UserModel toModel(UserFloor user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      avatar: user.avatar,
    );
  }
}
