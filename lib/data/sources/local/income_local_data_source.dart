import 'package:spending/domain/models/income/income_model.dart';

abstract class IncomeLocalDataSource {
  Future<bool> insertOne(IncomeModel income);

  Future<List<IncomeModel>> findAll(String spendingId);

  Future<IncomeModel> findOne(String id);

  Future<bool> updateOne(IncomeModel income);

  Future<bool> removeOne(IncomeModel income);

  Future<bool> removeAll();
}
