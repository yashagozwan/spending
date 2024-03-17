import 'package:floor/floor.dart';
import 'package:spending/data/sources/local/floor/spending/spending_floor.dart';
import 'package:spending/data/sources/local/floor/user/user_floor.dart';

@Entity(
  tableName: 'incomes',
  foreignKeys: [
    ForeignKey(
      parentColumns: ['id'],
      childColumns: ['spending_id'],
      entity: SpendingFloor,
      onDelete: ForeignKeyAction.cascade,
    ),
    ForeignKey(
      childColumns: ['user_id'],
      parentColumns: ['id'],
      entity: UserFloor,
      onDelete: ForeignKeyAction.cascade,
    ),
  ],
)
class IncomeFloor {
  @PrimaryKey()
  final String id;

  final String title;
  final int amount;

  @ColumnInfo(name: 'spending_id')
  final String spendingId;

  @ColumnInfo(name: 'user_id')
  final String userId;

  @ColumnInfo(name: 'created_at')
  final String createdAt;

  const IncomeFloor({
    required this.id,
    required this.title,
    required this.amount,
    required this.spendingId,
    required this.userId,
    required this.createdAt,
  });
}
