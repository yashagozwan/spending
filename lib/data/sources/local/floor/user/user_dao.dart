import 'package:floor/floor.dart';
import 'package:spending/data/sources/local/floor/user/user_floor.dart';

@dao
abstract class UserDAO {
  @Query("SELECT * FROM users")
  Future<List<UserFloor>> getUsers();

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> insertOne(UserFloor user);

  @Query("DELETE FROM users")
  Future<void> removeAll();
}
