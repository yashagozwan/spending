// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_floor.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDatabaseFloor {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseFloorBuilder databaseBuilder(String name) =>
      _$DatabaseFloorBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseFloorBuilder inMemoryDatabaseBuilder() =>
      _$DatabaseFloorBuilder(null);
}

class _$DatabaseFloorBuilder {
  _$DatabaseFloorBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DatabaseFloorBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DatabaseFloorBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DatabaseFloor> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DatabaseFloor();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DatabaseFloor extends DatabaseFloor {
  _$DatabaseFloor([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDAO? _userDAOInstance;

  SpendingDAO? _spendingDAOInstance;

  ExpenseDAO? _expenseDAOInstance;

  IncomeDAO? _incomeDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `email` TEXT NOT NULL, `avatar` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `spending` (`id` TEXT NOT NULL, `title` TEXT NOT NULL, `user_id` TEXT NOT NULL, `created_at` TEXT NOT NULL, FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `expenses` (`id` TEXT NOT NULL, `title` TEXT NOT NULL, `amount` INTEGER NOT NULL, `spending_id` TEXT NOT NULL, `user_id` TEXT NOT NULL, `created_at` TEXT NOT NULL, FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, FOREIGN KEY (`spending_id`) REFERENCES `spending` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `incomes` (`id` TEXT NOT NULL, `title` TEXT NOT NULL, `amount` INTEGER NOT NULL, `spending_id` TEXT NOT NULL, `user_id` TEXT NOT NULL, `created_at` TEXT NOT NULL, FOREIGN KEY (`spending_id`) REFERENCES `spending` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDAO get userDAO {
    return _userDAOInstance ??= _$UserDAO(database, changeListener);
  }

  @override
  SpendingDAO get spendingDAO {
    return _spendingDAOInstance ??= _$SpendingDAO(database, changeListener);
  }

  @override
  ExpenseDAO get expenseDAO {
    return _expenseDAOInstance ??= _$ExpenseDAO(database, changeListener);
  }

  @override
  IncomeDAO get incomeDAO {
    return _incomeDAOInstance ??= _$IncomeDAO(database, changeListener);
  }
}

class _$UserDAO extends UserDAO {
  _$UserDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userFloorInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (UserFloor item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'avatar': item.avatar
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserFloor> _userFloorInsertionAdapter;

  @override
  Future<List<UserFloor>> getUsers() async {
    return _queryAdapter.queryList('SELECT * FROM users',
        mapper: (Map<String, Object?> row) => UserFloor(
            id: row['id'] as String,
            name: row['name'] as String,
            email: row['email'] as String,
            avatar: row['avatar'] as String));
  }

  @override
  Future<void> removeAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM users');
  }

  @override
  Future<void> insertOne(UserFloor user) async {
    await _userFloorInsertionAdapter.insert(user, OnConflictStrategy.fail);
  }
}

class _$SpendingDAO extends SpendingDAO {
  _$SpendingDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _spendingFloorInsertionAdapter = InsertionAdapter(
            database,
            'spending',
            (SpendingFloor item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'user_id': item.userId,
                  'created_at': item.createdAt
                }),
        _spendingFloorUpdateAdapter = UpdateAdapter(
            database,
            'spending',
            ['id'],
            (SpendingFloor item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'user_id': item.userId,
                  'created_at': item.createdAt
                }),
        _spendingFloorDeletionAdapter = DeletionAdapter(
            database,
            'spending',
            ['id'],
            (SpendingFloor item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'user_id': item.userId,
                  'created_at': item.createdAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SpendingFloor> _spendingFloorInsertionAdapter;

  final UpdateAdapter<SpendingFloor> _spendingFloorUpdateAdapter;

  final DeletionAdapter<SpendingFloor> _spendingFloorDeletionAdapter;

  @override
  Future<SpendingFloor?> findOne(String id) async {
    return _queryAdapter.query('SELECT * FROM spending WHERE id = ?1',
        mapper: (Map<String, Object?> row) => SpendingFloor(
            id: row['id'] as String,
            title: row['title'] as String,
            userId: row['user_id'] as String,
            createdAt: row['created_at'] as String),
        arguments: [id]);
  }

  @override
  Future<List<SpendingFloor>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM spending',
        mapper: (Map<String, Object?> row) => SpendingFloor(
            id: row['id'] as String,
            title: row['title'] as String,
            userId: row['user_id'] as String,
            createdAt: row['created_at'] as String));
  }

  @override
  Future<void> removeAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM spending');
  }

  @override
  Future<void> insertOne(SpendingFloor spending) async {
    await _spendingFloorInsertionAdapter.insert(
        spending, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateOne(SpendingFloor spending) async {
    await _spendingFloorUpdateAdapter.update(
        spending, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeOne(SpendingFloor spending) async {
    await _spendingFloorDeletionAdapter.delete(spending);
  }
}

class _$ExpenseDAO extends ExpenseDAO {
  _$ExpenseDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _expenseFloorInsertionAdapter = InsertionAdapter(
            database,
            'expenses',
            (ExpenseFloor item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'amount': item.amount,
                  'spending_id': item.spendingId,
                  'user_id': item.userId,
                  'created_at': item.createdAt
                }),
        _expenseFloorUpdateAdapter = UpdateAdapter(
            database,
            'expenses',
            ['id'],
            (ExpenseFloor item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'amount': item.amount,
                  'spending_id': item.spendingId,
                  'user_id': item.userId,
                  'created_at': item.createdAt
                }),
        _expenseFloorDeletionAdapter = DeletionAdapter(
            database,
            'expenses',
            ['id'],
            (ExpenseFloor item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'amount': item.amount,
                  'spending_id': item.spendingId,
                  'user_id': item.userId,
                  'created_at': item.createdAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ExpenseFloor> _expenseFloorInsertionAdapter;

  final UpdateAdapter<ExpenseFloor> _expenseFloorUpdateAdapter;

  final DeletionAdapter<ExpenseFloor> _expenseFloorDeletionAdapter;

  @override
  Future<List<ExpenseFloor>> findAll(String spendingId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM expenses WHERE spending_id = ?1',
        mapper: (Map<String, Object?> row) => ExpenseFloor(
            id: row['id'] as String,
            title: row['title'] as String,
            amount: row['amount'] as int,
            userId: row['user_id'] as String,
            spendingId: row['spending_id'] as String,
            createdAt: row['created_at'] as String),
        arguments: [spendingId]);
  }

  @override
  Future<ExpenseFloor?> findOne(String id) async {
    return _queryAdapter.query('SELECT * FROM expenses WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ExpenseFloor(
            id: row['id'] as String,
            title: row['title'] as String,
            amount: row['amount'] as int,
            userId: row['user_id'] as String,
            spendingId: row['spending_id'] as String,
            createdAt: row['created_at'] as String),
        arguments: [id]);
  }

  @override
  Future<void> removeAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM expenses');
  }

  @override
  Future<void> insertOne(ExpenseFloor expense) async {
    await _expenseFloorInsertionAdapter.insert(
        expense, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateOne(ExpenseFloor expense) async {
    await _expenseFloorUpdateAdapter.update(expense, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeOne(ExpenseFloor expense) async {
    await _expenseFloorDeletionAdapter.delete(expense);
  }
}

class _$IncomeDAO extends IncomeDAO {
  _$IncomeDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _incomeFloorInsertionAdapter = InsertionAdapter(
            database,
            'incomes',
            (IncomeFloor item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'amount': item.amount,
                  'spending_id': item.spendingId,
                  'user_id': item.userId,
                  'created_at': item.createdAt
                }),
        _incomeFloorUpdateAdapter = UpdateAdapter(
            database,
            'incomes',
            ['id'],
            (IncomeFloor item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'amount': item.amount,
                  'spending_id': item.spendingId,
                  'user_id': item.userId,
                  'created_at': item.createdAt
                }),
        _incomeFloorDeletionAdapter = DeletionAdapter(
            database,
            'incomes',
            ['id'],
            (IncomeFloor item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'amount': item.amount,
                  'spending_id': item.spendingId,
                  'user_id': item.userId,
                  'created_at': item.createdAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<IncomeFloor> _incomeFloorInsertionAdapter;

  final UpdateAdapter<IncomeFloor> _incomeFloorUpdateAdapter;

  final DeletionAdapter<IncomeFloor> _incomeFloorDeletionAdapter;

  @override
  Future<List<IncomeFloor>> findAllBySpendingId(String spendingId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM incomes WHERE spending_id = ?1',
        mapper: (Map<String, Object?> row) => IncomeFloor(
            id: row['id'] as String,
            title: row['title'] as String,
            amount: row['amount'] as int,
            spendingId: row['spending_id'] as String,
            userId: row['user_id'] as String,
            createdAt: row['created_at'] as String),
        arguments: [spendingId]);
  }

  @override
  Future<List<IncomeFloor>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM incomes',
        mapper: (Map<String, Object?> row) => IncomeFloor(
            id: row['id'] as String,
            title: row['title'] as String,
            amount: row['amount'] as int,
            spendingId: row['spending_id'] as String,
            userId: row['user_id'] as String,
            createdAt: row['created_at'] as String));
  }

  @override
  Future<IncomeFloor?> findOne(String id) async {
    return _queryAdapter.query('SELECT * FROM incomes WHERE id = ?1',
        mapper: (Map<String, Object?> row) => IncomeFloor(
            id: row['id'] as String,
            title: row['title'] as String,
            amount: row['amount'] as int,
            spendingId: row['spending_id'] as String,
            userId: row['user_id'] as String,
            createdAt: row['created_at'] as String),
        arguments: [id]);
  }

  @override
  Future<void> removeAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM incomes');
  }

  @override
  Future<void> insertOne(IncomeFloor income) async {
    await _incomeFloorInsertionAdapter.insert(income, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateOne(IncomeFloor income) async {
    await _incomeFloorUpdateAdapter.update(income, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeOne(IncomeFloor income) async {
    await _incomeFloorDeletionAdapter.delete(income);
  }
}
