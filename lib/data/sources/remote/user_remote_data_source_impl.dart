import 'package:injectable/injectable.dart';
import 'package:spending/core/services/auth_service.dart';
import 'package:spending/data/sources/remote/user_remote_data_source.dart';
import 'package:spending/domain/models/user/user_model.dart';

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final AuthService _authService;

  UserRemoteDataSourceImpl(this._authService);

  @override
  Future<UserModel?> signInWithGoogle() {
    return _authService.signInWithGoogle();
  }

  @override
  Future<bool> signOut() {
    return _authService.signOut();
  }
}
