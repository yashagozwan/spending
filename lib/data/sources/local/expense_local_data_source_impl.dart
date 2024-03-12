import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/local/expense_local_data_source.dart';
import 'package:spending/data/sources/local/floor/database_floor.dart';
import 'package:spending/data/sources/local/floor/expense/expense_dao.dart';
import 'package:spending/domain/models/expense/expense_model.dart';

@LazySingleton(as: ExpenseLocalDataSource)
class ExpenseLocalDataSourceImpl implements ExpenseLocalDataSource {
  final DatabaseFloor _databaseFloor;

  ExpenseLocalDataSourceImpl(this._databaseFloor);

  ExpenseDAO get _dao => _databaseFloor.expenseDAO;

  @override
  Future<ExpenseModel> findOne(String id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future<bool> insertOne(ExpenseModel expense) {
    // TODO: implement insertOne
    throw UnimplementedError();
  }

  @override
  Future<bool> removeAll() {
    // TODO: implement removeAll
    throw UnimplementedError();
  }

  @override
  Future<bool> removeOne(ExpenseModel expense) {
    // TODO: implement removeOne
    throw UnimplementedError();
  }

  @override
  Future<bool> updateOne(ExpenseModel expense) {
    // TODO: implement updateOne
    throw UnimplementedError();
  }

  @override
  Future<List<ExpenseModel>> findAll(String spendingId) {
    // TODO: implement findAll
    throw UnimplementedError();
  }
}
