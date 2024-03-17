import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/local/floor/income/income_floor.dart';
import 'package:spending/domain/models/income/income_model.dart';

@lazySingleton
class IncomeMapper {
  IncomeFloor toFloor(IncomeModel income) {
    return IncomeFloor(
      id: income.id,
      title: income.title,
      amount: income.amount,
      spendingId: income.spendingId,
      userId: income.userId,
      createdAt: income.createdAt,
    );
  }

  IncomeModel toModel(IncomeFloor income) {
    return IncomeModel(
      id: income.id,
      title: income.title,
      amount: income.amount,
      spendingId: income.spendingId,
      userId: income.userId,
      createdAt: income.createdAt,
    );
  }
}
