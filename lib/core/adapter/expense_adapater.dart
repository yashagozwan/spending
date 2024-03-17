import 'package:spending/domain/models/expense/expense_model.dart';

class ExpenseAdapter {
  static int calculateAmount(List<ExpenseModel> expenses) {
    var amount = 0;
    for (var expense in expenses) {
      amount += expense.amount;
    }
    return amount;
  }
}
