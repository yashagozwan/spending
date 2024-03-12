import 'package:floor/floor.dart';
import 'package:spending/data/sources/local/floor/user/user_floor.dart';

@Entity(tableName: 'spending', foreignKeys: [
  ForeignKey(
    childColumns: ['user_id'],
    parentColumns: ['id'],
    entity: UserFloor,
    onDelete: ForeignKeyAction.cascade,
  )
])
class SpendingFloor {
  @PrimaryKey()
  final String id;

  final String title;

  @ColumnInfo(name: 'user_id')
  final String userId;

  @ColumnInfo(name: 'created_at')
  final String createdAt;

  SpendingFloor({
    required this.id,
    required this.title,
    required this.userId,
    required this.createdAt,
  });
}
