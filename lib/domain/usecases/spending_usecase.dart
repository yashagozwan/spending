import 'package:spending/domain/models/spending/spending_model.dart';

abstract class SpendingUseCase {
  Future<SpendingModel> findOne(String id);

  Future<List<SpendingModel>> findAll();

  Future<List<SpendingModel>> findAllRemote();

  Future<bool> insertOne(SpendingModel spending);

  Future<bool> insertOneNetwork(SpendingModel spending);

  Future<bool> removeOne(SpendingModel spending);

  Future<bool> updateOne(SpendingModel spending);
}
