import 'dart:async';
import 'package:floor/floor.dart';
import 'package:spending/data/sources/local/floor/expense/expense_dao.dart';
import 'package:spending/data/sources/local/floor/expense/expense_floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:spending/data/sources/local/floor/user/user_dao.dart';
import 'package:spending/data/sources/local/floor/user/user_floor.dart';
import 'package:spending/data/sources/local/floor/spending/spending_dao.dart';
import 'package:spending/data/sources/local/floor/spending/spending_floor.dart';

part 'database_floor.g.dart';

@Database(version: 1, entities: [UserFloor, SpendingFloor, ExpenseFloor])
abstract class DatabaseFloor extends FloorDatabase {
  UserDAO get userDAO;

  SpendingDAO get spendingDAO;

  ExpenseDAO get expenseDAO;
}
