import 'package:spending/domain/models/income/income_model.dart';

abstract class IncomeRepository {
  Future<bool> insertOne(IncomeModel income);

  Future<bool> insertOneNetwork(IncomeModel income);

  Future<List<IncomeModel>> findAll(String spendingId);

  Future<List<IncomeModel>> findAllByUserIdRemote();

  Future<IncomeModel> findOne(String id);

  Future<bool> updateOne(IncomeModel income);

  Future<bool> removeOne(IncomeModel income);
}
