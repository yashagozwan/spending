import 'package:injectable/injectable.dart';
import 'package:spending/data/mapper/user_mapper.dart';
import 'package:spending/data/sources/local/floor/database_floor.dart';
import 'package:spending/data/sources/local/floor/user/user_dao.dart';
import 'package:spending/data/sources/local/user_local_data_source.dart';
import 'package:spending/domain/models/user/user_model.dart';

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final DatabaseFloor _database;
  final UserMapper _mapper;

  UserLocalDataSourceImpl(
    this._database,
    this._mapper,
  );

  UserDAO get _userDAO => _database.userDAO;

  @override
  Future<UserModel?> getUser() async {
    final users = await _userDAO.getUsers();
    final user = users.firstOrNull;
    if (user == null) return null;
    return _mapper.toModel(user);
  }

  @override
  Future<bool> insertUser(UserModel user) async {
    _userDAO.insertOne(_mapper.toFloor(user));
    return true;
  }

  @override
  Future<bool> signOut() async {
    await _userDAO.removeAll();
    return true;
  }
}
