import 'package:floor/floor.dart';
import 'package:spending/data/sources/local/floor/spending/spending_floor.dart';

@dao
abstract class SpendingDAO {
  @Query("SELECT * FROM spending WHERE id = :id")
  Future<SpendingFloor?> findOne(String id);

  @Query("SELECT * FROM spending")
  Future<List<SpendingFloor>> findAll();

  @insert
  Future<void> insertOne(SpendingFloor spending);

  @delete
  Future<void> removeOne(SpendingFloor spending);

  @update
  Future<void> updateOne(SpendingFloor spending);

  @Query("DELETE FROM spending")
  Future<void> removeAll();
}
