import 'package:spending/domain/models/expense/expense_model.dart';

abstract class ExpenseLocalDataSource {
  Future<bool> insertOne(ExpenseModel expense);

  Future<List<ExpenseModel>> findAll(String spendingId);

  Future<ExpenseModel> findOne(String id);

  Future<bool> updateOne(ExpenseModel expense);

  Future<bool> removeOne(ExpenseModel expense);

  Future<bool> removeAll();
}
