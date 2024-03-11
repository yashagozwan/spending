import 'package:spending/domain/models/spending/spending_model.dart';

abstract class SpendingLocalDataSource {
  Future<SpendingModel> findOne(String id);

  Future<List<SpendingModel>> findAll();

  Future<bool> insertOne(SpendingModel spending);

  Future<bool> removeOne(SpendingModel spending);

  Future<bool> updateOne(SpendingModel spending);

  Future<bool> removeAll();
}
