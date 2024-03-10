import 'package:floor/floor.dart';

@Entity(tableName: 'users')
class UserFloor {
  @PrimaryKey()
  final String id;
  final String name;
  final String email;
  final String avatar;

  UserFloor({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });
}
