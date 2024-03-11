import 'package:injectable/injectable.dart';
import 'package:spending/domain/models/spending/spending_model.dart';
import 'package:spending/domain/repositories/spending_repository.dart';
import 'package:spending/domain/usecases/spending_usecase.dart';

@LazySingleton(as: SpendingUseCase)
class SpendingInteractor implements SpendingUseCase {
  final SpendingRepository _repository;

  SpendingInteractor(this._repository);

  @override
  Future<List<SpendingModel>> findAll() {
    return _repository.findAll();
  }

  @override
  Future<SpendingModel> findOne(String id) {
    return _repository.findOne(id);
  }

  @override
  Future<bool> insertOne(SpendingModel spending) {
    return _repository.insertOne(spending);
  }

  @override
  Future<bool> removeOne(SpendingModel spending) {
    return _repository.removeOne(spending);
  }

  @override
  Future<bool> updateOne(SpendingModel spending) {
    return _repository.updateOne(spending);
  }

  @override
  Future<List<SpendingModel>> findAllRemote() {
    return _repository.findAllRemote();
  }

  @override
  Future<bool> insertOneNetwork(SpendingModel spending) {
    return _repository.insertOneNetwork(spending);
  }
}
