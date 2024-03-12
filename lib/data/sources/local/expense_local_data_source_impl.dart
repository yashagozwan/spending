import 'package:injectable/injectable.dart';
import 'package:spending/data/mapper/expense_mapper.dart';
import 'package:spending/data/sources/local/expense_local_data_source.dart';
import 'package:spending/data/sources/local/floor/database_floor.dart';
import 'package:spending/data/sources/local/floor/expense/expense_dao.dart';
import 'package:spending/domain/models/expense/expense_model.dart';

@LazySingleton(as: ExpenseLocalDataSource)
class ExpenseLocalDataSourceImpl implements ExpenseLocalDataSource {
  final DatabaseFloor _databaseFloor;
  final ExpenseMapper _mapper;

  ExpenseLocalDataSourceImpl(this._databaseFloor, this._mapper);

  ExpenseDAO get _dao => _databaseFloor.expenseDAO;

  @override
  Future<ExpenseModel> findOne(String id) async {
    return _mapper.toModel((await _dao.findOne(id))!);
  }

  @override
  Future<bool> insertOne(ExpenseModel expense) async {
    await _dao.insertOne(_mapper.toFloor(expense));
    return true;
  }

  @override
  Future<bool> removeAll() async {
    await _dao.removeAll();
    return true;
  }

  @override
  Future<bool> removeOne(ExpenseModel expense) async {
    await _dao.removeOne(_mapper.toFloor(expense));
    return true;
  }

  @override
  Future<bool> updateOne(ExpenseModel expense) async {
    await _dao.updateOne(_mapper.toFloor(expense));
    return true;
  }

  @override
  Future<List<ExpenseModel>> findAll(String spendingId) async {
    final expenses = await _dao.findAll(spendingId);
    return expenses.map(_mapper.toModel).toList();
  }
}
