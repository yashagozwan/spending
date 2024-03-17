import 'package:spending/domain/models/income/income_model.dart';

abstract class IncomeRemoteDataSource {
  Future<IncomeModel> insertOne(IncomeModel income);

  Future<List<IncomeModel>> findAll(String userId);

  Future<IncomeModel> findOne(String id);

  Future<bool> updateOne(IncomeModel income);

  Future<bool> removeOne(IncomeModel income);
}
