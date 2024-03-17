import 'package:injectable/injectable.dart';
import 'package:spending/domain/models/user/user_model.dart';
import 'package:spending/domain/repositories/user_repository.dart';
import 'package:spending/domain/usecases/user_usecase.dart';

@LazySingleton(as: UserUseCase)
class UserInteractor implements UserUseCase {
  final UserRepository _repository;

  const UserInteractor(this._repository);

  @override
  Future<UserModel?> getUser() {
    return _repository.getUser();
  }

  @override
  Future<bool> signIn() {
    return _repository.signIn();
  }

  @override
  Future<bool> signOut() {
    return _repository.signOut();
  }
}
