import 'package:spending/domain/models/income/income_model.dart';

class IncomeAdapter {
  static int calculateAmount(List<IncomeModel> incomes) {
    var amount = 0;
    for (var income in incomes) {
      amount += income.amount;
    }
    return amount;
  }
}
