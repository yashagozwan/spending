import 'package:injectable/injectable.dart';
import 'package:spending/domain/models/income/income_model.dart';
import 'package:spending/domain/repositories/income_repository.dart';
import 'package:spending/domain/usecases/income_usecase.dart';

@LazySingleton(as: IncomeUseCase)
class IncomeInteractor implements IncomeUseCase {
  final IncomeRepository _repository;

  const IncomeInteractor(this._repository);

  @override
  Future<List<IncomeModel>> findAll(String spendingId) {
    return _repository.findAll(spendingId);
  }

  @override
  Future<List<IncomeModel>> findAllByUserIdRemote() {
    return _repository.findAllByUserIdRemote();
  }

  @override
  Future<IncomeModel> findOne(String id) {
    return _repository.findOne(id);
  }

  @override
  Future<bool> insertOne(IncomeModel income) {
    return _repository.insertOne(income);
  }

  @override
  Future<bool> insertOneNetwork(IncomeModel income) {
    return _repository.insertOneNetwork(income);
  }

  @override
  Future<bool> removeOne(IncomeModel income) {
    return _repository.removeOne(income);
  }

  @override
  Future<bool> updateOne(IncomeModel income) {
    return _repository.updateOne(income);
  }
}
