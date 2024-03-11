import 'package:spending/domain/models/spending/spending_model.dart';

abstract class SpendingRemoteDataSource {
  Future<SpendingModel> findOne(String id);

  Future<List<SpendingModel>> findAll(String userId);

  Future<SpendingModel> insertOne(SpendingModel spending);

  Future<bool> removeOne(SpendingModel spending);

  Future<bool> updateOne(SpendingModel spending);
}
