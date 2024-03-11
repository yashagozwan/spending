import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/local/floor/database_floor.dart';
import 'package:spending/data/sources/local/floor/spending/spending_dao.dart';
import 'package:spending/data/sources/local/spending_local_data_source.dart';
import 'package:spending/data/mapper/spending_mapper.dart';
import 'package:spending/domain/models/spending/spending_model.dart';

@LazySingleton(as: SpendingLocalDataSource)
class SpendingLocalDataSourceImpl implements SpendingLocalDataSource {
  final DatabaseFloor _databaseFloor;
  final SpendingMapper _mapper;

  SpendingLocalDataSourceImpl(this._databaseFloor, this._mapper);

  SpendingDAO get _dao => _databaseFloor.spendingDAO;

  @override
  Future<List<SpendingModel>> findAll() async {
    final spendings = await _dao.findAll();
    return spendings.map((e) => _mapper.toModel(e)).toList();
  }

  @override
  Future<bool> insertOne(SpendingModel spending) async {
    try {
      await _dao.insertOne(_mapper.toFloor(spending));
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> removeOne(SpendingModel spending) async {
    try {
      await _dao.removeOne(_mapper.toFloor(spending));
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> updateOne(SpendingModel spending) async {
    try {
      await _dao.updateOne(_mapper.toFloor(spending));
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<SpendingModel> findOne(String id) async {
    return _mapper.toModel((await _dao.findOne(id))!);
  }

  @override
  Future<bool> removeAll() async {
    try {
      await _dao.removeAll();
      return true;
    } catch (_) {
      return false;
    }
  }
}
