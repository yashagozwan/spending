import 'package:floor/floor.dart';
import 'package:spending/data/sources/local/floor/income/income_floor.dart';

@dao
abstract class IncomeDAO {
  @Insert(onConflict: OnConflictStrategy.abort)
  Future<void> insertOne(IncomeFloor income);

  @Query("SELECT * FROM incomes WHERE spending_id = :spendingId")
  Future<List<IncomeFloor>> findAllBySpendingId(String spendingId);

  @Query("SELECT * FROM incomes")
  Future<List<IncomeFloor>> findAll();

  @Query("SELECT * FROM incomes WHERE id = :id")
  Future<IncomeFloor?> findOne(String id);

  @update
  Future<void> updateOne(IncomeFloor income);

  @delete
  Future<void> removeOne(IncomeFloor income);

  @Query("DELETE FROM incomes")
  Future<void> removeAll();
}
