import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/local/spending_local_data_source.dart';
import 'package:spending/data/sources/remote/spending_remote_data_source.dart';
import 'package:spending/domain/models/spending/spending_model.dart';
import 'package:spending/domain/repositories/spending_repository.dart';
import 'package:spending/data/sources/local/user_local_data_source.dart';

@LazySingleton(as: SpendingRepository)
class SpendingRepositoryImpl implements SpendingRepository {
  final SpendingRemoteDataSource _remote;
  final SpendingLocalDataSource _local;
  final UserLocalDataSource _userLocalDataSource;

  SpendingRepositoryImpl(
    this._remote,
    this._local,
    this._userLocalDataSource,
  );

  @override
  Future<List<SpendingModel>> findAll() => _local.findAll();

  @override
  Future<List<SpendingModel>> findAllRemote() async {
    final userId = (await _userLocalDataSource.getUser())!.id;
    return _remote.findAll(userId);
  }

  @override
  Future<SpendingModel> findOne(String id) {
    return _local.findOne(id);
  }

  @override
  Future<bool> insertOne(SpendingModel spending) async {
    try {
      final mSpending = await _remote.insertOne(spending);
      await _local.insertOne(mSpending);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> removeOne(SpendingModel spending) async {
    try {
      await _local.removeOne(spending);
      await _remote.removeOne(spending);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> updateOne(SpendingModel spending) async {
    try {
      await _local.updateOne(spending);
      await _remote.updateOne(spending);
      return true;
    } catch (_) {
      return false;
    }
  }
}
