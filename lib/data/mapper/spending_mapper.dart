import 'package:injectable/injectable.dart';
import 'package:spending/data/sources/local/floor/spending/spending_floor.dart';
import 'package:spending/domain/models/spending/spending_model.dart';

@lazySingleton
class SpendingMapper {
  SpendingFloor toFloor(SpendingModel spending) {
    return SpendingFloor(
      id: spending.id,
      title: spending.title,
      userId: spending.userId,
      createdAt: spending.createdAt,
    );
  }

  SpendingModel toModel(SpendingFloor spending) {
    return SpendingModel(
      id: spending.id,
      title: spending.title,
      userId: spending.userId,
      createdAt: spending.createdAt,
    );
  }
}
