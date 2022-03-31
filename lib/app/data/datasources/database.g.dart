// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PlantDao _plantDaoInstance;

  PlantTypeDao _plantTypeDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `Plant` (`plantId` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `typeId` INTEGER, `plantingDate` INTEGER, FOREIGN KEY (`typeId`) REFERENCES `PlantType` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PlantType` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PlantDao get plantDao {
    return _plantDaoInstance ??= _$PlantDao(database, changeListener);
  }

  @override
  PlantTypeDao get plantTypeDao {
    return _plantTypeDaoInstance ??= _$PlantTypeDao(database, changeListener);
  }
}

class _$PlantDao extends PlantDao {
  _$PlantDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _plantInsertionAdapter = InsertionAdapter(
            database,
            'Plant',
            (Plant item) => <String, dynamic>{
                  'plantId': item.plantId,
                  'name': item.name,
                  'typeId': item.typeId,
                  'plantingDate': item.plantingDate
                }),
        _plantUpdateAdapter = UpdateAdapter(
            database,
            'Plant',
            ['plantId'],
            (Plant item) => <String, dynamic>{
                  'plantId': item.plantId,
                  'name': item.name,
                  'typeId': item.typeId,
                  'plantingDate': item.plantingDate
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Plant> _plantInsertionAdapter;

  final UpdateAdapter<Plant> _plantUpdateAdapter;

  @override
  Future<List<Plant>> getAllPlants() async {
    return _queryAdapter.queryList('SELECT * FROM Plant',
        mapper: (Map<String, dynamic> row) => Plant(
            plantId: row['plantId'] as int,
            name: row['name'] as String,
            typeId: row['typeId'] as int,
            plantingDate: row['plantingDate'] as int));
  }

  @override
  Future<Plant> getPlant(String name) async {
    return _queryAdapter.query('SELECT * FROM Plant WHERE name= ?',
        arguments: <dynamic>[name],
        mapper: (Map<String, dynamic> row) => Plant(
            plantId: row['plantId'] as int,
            name: row['name'] as String,
            typeId: row['typeId'] as int,
            plantingDate: row['plantingDate'] as int));
  }

  @override
  Future<void> insertPlant(Plant plant) async {
    await _plantInsertionAdapter.insert(plant, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePlant(Plant plant) async {
    await _plantUpdateAdapter.update(plant, OnConflictStrategy.abort);
  }
}

class _$PlantTypeDao extends PlantTypeDao {
  _$PlantTypeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _plantTypeInsertionAdapter = InsertionAdapter(
            database,
            'PlantType',
            (PlantType item) =>
                <String, dynamic>{'id': item.id, 'name': item.name}),
        _plantTypeDeletionAdapter = DeletionAdapter(
            database,
            'PlantType',
            ['id'],
            (PlantType item) =>
                <String, dynamic>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PlantType> _plantTypeInsertionAdapter;

  final DeletionAdapter<PlantType> _plantTypeDeletionAdapter;

  @override
  Future<List<PlantType>> getAllPlantTypes() async {
    return _queryAdapter.queryList('SELECT * FROM PlantType',
        mapper: (Map<String, dynamic> row) =>
            PlantType(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<PlantType> getPlantType(String id) async {
    return _queryAdapter.query('SELECT * FROM Plant WHERE id= ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) =>
            PlantType(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<void> insertPlantType(PlantType plantType) async {
    await _plantTypeInsertionAdapter.insert(
        plantType, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePlantType(PlantType plantType) async {
    await _plantTypeDeletionAdapter.delete(plantType);
  }
}
