import 'package:injectable/injectable.dart';
import 'package:spending/domain/models/expense/expense_model.dart';
import 'package:spending/domain/repositories/expense_repository.dart';
import 'package:spending/domain/usecases/expense_usecase.dart';

@LazySingleton(as: ExpenseUseCase)
class ExpenseInteractor implements ExpenseUseCase {
  final ExpenseRepository _repository;

  const ExpenseInteractor(this._repository);

  @override
  Future<ExpenseModel> findOne(String id) {
    return _repository.findOne(id);
  }

  @override
  Future<bool> insertOne(ExpenseModel expense) {
    return _repository.insertOne(expense);
  }

  @override
  Future<bool> insertOneNetwork(ExpenseModel expense) {
    return _repository.insertOneNetwork(expense);
  }

  @override
  Future<bool> updateOne(ExpenseModel expense) {
    return _repository.updateOne(expense);
  }

  @override
  Future<bool> removeOne(ExpenseModel expense) {
    return _repository.removeOne(expense);
  }

  @override
  Future<List<ExpenseModel>> findAll(String spendingId) {
    return _repository.findAll(spendingId);
  }

  @override
  Future<List<ExpenseModel>> findAllByUserIdRemote() {
    return _repository.findAllByUserIdRemote();
  }
}
