import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/local/expense_local_data_source.dart';
import 'package:spending/data/sources/local/spending_local_data_source.dart';
import 'package:spending/data/sources/local/user_local_data_source.dart';
import 'package:spending/data/sources/remote/user_remote_data_source.dart';
import 'package:spending/domain/models/user/user_model.dart';
import 'package:spending/domain/repositories/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _local;
  final UserRemoteDataSource _remote;
  final SpendingLocalDataSource _spendingLocal;
  final ExpenseLocalDataSource _expenseLocal;

  UserRepositoryImpl(
    this._local,
    this._remote,
    this._spendingLocal,
    this._expenseLocal,
  );

  @override
  Future<UserModel?> getUser() => _local.getUser();

  @override
  Future<bool> signIn() async {
    final user = await _remote.signInWithGoogle();
    if (user == null) return false;
    return await _local.insertUser(user);
  }

  @override
  Future<bool> signOut() async {
    return await _expenseLocal.removeAll() &&
        await _spendingLocal.removeAll() &&
        await _local.signOut() &&
        await _remote.signOut();
  }
}
