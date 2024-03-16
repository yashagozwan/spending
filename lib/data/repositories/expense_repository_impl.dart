import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/local/expense_local_data_source.dart';
import 'package:spending/data/sources/remote/expense_remote_data_source.dart';
import 'package:spending/domain/models/expense/expense_model.dart';
import 'package:spending/domain/repositories/expense_repository.dart';
import 'package:spending/domain/usecases/user_usecase.dart';

@LazySingleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseRemoteDataSource _remote;
  final ExpenseLocalDataSource _local;
  final UserUseCase _userUseCase;

  ExpenseRepositoryImpl(this._remote, this._local, this._userUseCase);

  @override
  Future<ExpenseModel> findOne(String id) {
    return _local.findOne(id);
  }

  @override
  Future<bool> insertOne(ExpenseModel expense) {
    return _local.insertOne(expense);
  }

  @override
  Future<bool> insertOneNetwork(ExpenseModel expense) async {
    final user = (await _userUseCase.getUser())!;
    final mExpense = await _remote.insertOne(expense.copyWith(userId: user.id));
    return insertOne(mExpense);
  }

  @override
  Future<bool> updateOne(ExpenseModel expense) async {
    await _remote.updateOne(expense);
    await _remote.updateOne(expense);
    return true;
  }

  @override
  Future<bool> removeOne(ExpenseModel expense) async {
    await _remote.removeOne(expense);
    await _local.removeOne(expense);
    return true;
  }

  @override
  Future<List<ExpenseModel>> findAll(String spendingId) {
    return _local.findAll(spendingId);
  }

  @override
  Future<List<ExpenseModel>> findAllByUserIdRemote() async {
    await _local.removeAll();
    final user = (await _userUseCase.getUser())!;
    return _remote.findAll(user.id);
  }
}
