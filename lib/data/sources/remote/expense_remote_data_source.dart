import 'package:spending/domain/models/expense/expense_model.dart';

abstract class ExpenseRemoteDataSource {
  Future<ExpenseModel> insertOne(ExpenseModel expense);

  Future<List<ExpenseModel>> findAll(String userId);

  Future<ExpenseModel> findOne(String id);

  Future<bool> updateOne(ExpenseModel expense);

  Future<bool> removeOne(ExpenseModel expense);
}
