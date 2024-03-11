import '../models/spending/spending_model.dart';

abstract class SpendingRepository {
  Future<SpendingModel> findOne(String id);

  Future<List<SpendingModel>> findAll();

  Future<List<SpendingModel>> findAllRemote();

  Future<bool> insertOne(SpendingModel spending);

  Future<bool> insertOneNetwork(SpendingModel spending);

  Future<bool> removeOne(SpendingModel spending);

  Future<bool> updateOne(SpendingModel spending);
}
