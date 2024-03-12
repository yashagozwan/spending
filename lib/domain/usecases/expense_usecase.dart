import 'package:spending/domain/models/expense/expense_model.dart';

abstract class ExpenseUseCase {
  Future<bool> insertOne(ExpenseModel expense);

  Future<bool> insertOneNetwork(ExpenseModel expense);

  Future<List<ExpenseModel>> findAll(String spendingId);

  Future<List<ExpenseModel>> findAllByUserIdRemote();

  Future<ExpenseModel> findOne(String id);

  Future<bool> updateOne(ExpenseModel expense);

  Future<bool> removeOne(ExpenseModel expense);
}
