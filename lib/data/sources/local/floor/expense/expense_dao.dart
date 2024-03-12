import 'package:floor/floor.dart';
import 'expense_floor.dart';

@dao
abstract class ExpenseDAO {
  @insert
  Future<void> insertOne(ExpenseFloor expense);

  @Query("SELECT * FROM expenses WHERE spending_id = :spendingId")
  Future<List<ExpenseFloor>> findAll(String spendingId);

  @Query("SELECT * FROM expenses WHERE id = :id")
  Future<ExpenseFloor?> findOne(String id);

  @update
  Future<void> updateOne(ExpenseFloor expense);

  @delete
  Future<void> removeOne(ExpenseFloor expense);

  @Query("DELETE FROM expenses")
  Future<void> removeAll();
}
