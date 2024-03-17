import 'package:injectable/injectable.dart';
import 'package:spending/data/mapper/income_mapper.dart';
import 'package:spending/data/sources/local/floor/database_floor.dart';
import 'package:spending/data/sources/local/floor/income/income_dao.dart';
import 'package:spending/data/sources/local/income_local_data_source.dart';
import 'package:spending/domain/models/income/income_model.dart';

@LazySingleton(as: IncomeLocalDataSource)
class IncomeLocalDataSourceImpl implements IncomeLocalDataSource {
  final DatabaseFloor _floor;
  final IncomeMapper _mapper;

  IncomeLocalDataSourceImpl(this._floor, this._mapper);

  IncomeDAO get _dao => _floor.incomeDAO;

  @override
  Future<List<IncomeModel>> findAll(String spendingId) async {
    return _dao
        .findAllBySpendingId(spendingId)
        .then((values) => values.map(_mapper.toModel).toList())
        .catchError((_) => throw Exception("Error"));
  }

  @override
  Future<IncomeModel> findOne(String id) async {
    return _dao
        .findOne(id)
        .then((value) => _mapper.toModel(value!))
        .catchError((_) => throw Exception("Error"));
  }

  @override
  Future<bool> insertOne(IncomeModel income) async {
    return _dao
        .insertOne(_mapper.toFloor(income))
        .then((_) => true)
        .catchError((_) => false);
  }

  @override
  Future<bool> removeOne(IncomeModel income) {
    return _dao
        .removeOne(_mapper.toFloor(income))
        .then((_) => true)
        .catchError((_) => false);
  }

  @override
  Future<bool> updateOne(IncomeModel income) {
    return _dao
        .updateOne(_mapper.toFloor(income))
        .then((_) => true)
        .catchError((_) => false);
  }

  @override
  Future<bool> removeAll() {
    return _dao.removeAll().then((_) => true).catchError((_) => false);
  }
}
