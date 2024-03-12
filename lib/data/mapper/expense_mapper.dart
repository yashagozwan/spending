import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/local/floor/expense/expense_floor.dart';
import 'package:spending/domain/models/expense/expense_model.dart';

@lazySingleton
class ExpenseMapper {
  ExpenseFloor toFloor(ExpenseModel expense) {
    return ExpenseFloor(
      id: expense.id,
      title: expense.title,
      amount: expense.amount,
      userId: expense.userId,
      spendingId: expense.spendingId,
      createdAt: expense.createdAt,
    );
  }

  ExpenseModel toModel(ExpenseFloor expense) {
    return ExpenseModel(
      id: expense.id,
      title: expense.title,
      amount: expense.amount,
      userId: expense.userId,
      spendingId: expense.spendingId,
      createdAt: expense.createdAt,
    );
  }
}
