import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/local/income_local_data_source.dart';
import 'package:spending/data/sources/local/user_local_data_source.dart';
import 'package:spending/data/sources/remote/income_remote_data_source.dart';
import 'package:spending/domain/models/income/income_model.dart';
import 'package:spending/domain/repositories/income_repository.dart';

@LazySingleton(as: IncomeRepository)
class IncomeRepositoryImpl implements IncomeRepository {
  final IncomeLocalDataSource _local;
  final IncomeRemoteDataSource _remote;
  final UserLocalDataSource _userLocalDataSource;

  const IncomeRepositoryImpl(
    this._local,
    this._remote,
    this._userLocalDataSource,
  );

  @override
  Future<List<IncomeModel>> findAll(String spendingId) async {
    final incomes = await _local.findAll(spendingId);
    incomes.sort((a, b) =>
        DateTime.parse(a.createdAt).compareTo(DateTime.parse(b.createdAt)));
    return incomes;
  }

  @override
  Future<List<IncomeModel>> findAllByUserIdRemote() async {
    final user = (await _userLocalDataSource.getUser())!;
    return _remote.findAll(user.id);
  }

  @override
  Future<IncomeModel> findOne(String id) {
    return _local.findOne(id);
  }

  @override
  Future<bool> insertOne(IncomeModel income) {
    return _local.insertOne(income);
  }

  @override
  Future<bool> insertOneNetwork(IncomeModel income) async {
    return insertOne(await _remote.insertOne(income));
  }

  @override
  Future<bool> removeOne(IncomeModel income) async {
    await _remote.removeOne(income);
    await _local.removeOne(income);
    return true;
  }

  @override
  Future<bool> updateOne(IncomeModel income) async {
    await _remote.updateOne(income);
    await _local.updateOne(income);
    return true;
  }
}
