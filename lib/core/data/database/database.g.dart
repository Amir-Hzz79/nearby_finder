// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PlacesTableTable extends PlacesTable
    with TableInfo<$PlacesTableTable, PlacesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlacesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  @override
  late final GeneratedColumn<int> distance = GeneratedColumn<int>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryNameMeta = const VerificationMeta(
    'categoryName',
  );
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
    'category_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIconUrlMeta = const VerificationMeta(
    'categoryIconUrl',
  );
  @override
  late final GeneratedColumn<String> categoryIconUrl = GeneratedColumn<String>(
    'category_icon_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    distance,
    categoryName,
    categoryIconUrl,
    address,
    latitude,
    longitude,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'places_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlacesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
        _categoryNameMeta,
        categoryName.isAcceptableOrUnknown(
          data['category_name']!,
          _categoryNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    if (data.containsKey('category_icon_url')) {
      context.handle(
        _categoryIconUrlMeta,
        categoryIconUrl.isAcceptableOrUnknown(
          data['category_icon_url']!,
          _categoryIconUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryIconUrlMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlacesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlacesTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      distance:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}distance'],
          )!,
      categoryName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category_name'],
          )!,
      categoryIconUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category_icon_url'],
          )!,
      address:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}address'],
          )!,
      latitude:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}latitude'],
          )!,
      longitude:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}longitude'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
    );
  }

  @override
  $PlacesTableTable createAlias(String alias) {
    return $PlacesTableTable(attachedDatabase, alias);
  }
}

class PlacesTableData extends DataClass implements Insertable<PlacesTableData> {
  final String id;
  final String name;
  final int distance;
  final String categoryName;
  final String categoryIconUrl;
  final String address;
  final double latitude;
  final double longitude;
  final String status;
  const PlacesTableData({
    required this.id,
    required this.name,
    required this.distance,
    required this.categoryName,
    required this.categoryIconUrl,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['distance'] = Variable<int>(distance);
    map['category_name'] = Variable<String>(categoryName);
    map['category_icon_url'] = Variable<String>(categoryIconUrl);
    map['address'] = Variable<String>(address);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['status'] = Variable<String>(status);
    return map;
  }

  PlacesTableCompanion toCompanion(bool nullToAbsent) {
    return PlacesTableCompanion(
      id: Value(id),
      name: Value(name),
      distance: Value(distance),
      categoryName: Value(categoryName),
      categoryIconUrl: Value(categoryIconUrl),
      address: Value(address),
      latitude: Value(latitude),
      longitude: Value(longitude),
      status: Value(status),
    );
  }

  factory PlacesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlacesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      distance: serializer.fromJson<int>(json['distance']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
      categoryIconUrl: serializer.fromJson<String>(json['categoryIconUrl']),
      address: serializer.fromJson<String>(json['address']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'distance': serializer.toJson<int>(distance),
      'categoryName': serializer.toJson<String>(categoryName),
      'categoryIconUrl': serializer.toJson<String>(categoryIconUrl),
      'address': serializer.toJson<String>(address),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'status': serializer.toJson<String>(status),
    };
  }

  PlacesTableData copyWith({
    String? id,
    String? name,
    int? distance,
    String? categoryName,
    String? categoryIconUrl,
    String? address,
    double? latitude,
    double? longitude,
    String? status,
  }) => PlacesTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    distance: distance ?? this.distance,
    categoryName: categoryName ?? this.categoryName,
    categoryIconUrl: categoryIconUrl ?? this.categoryIconUrl,
    address: address ?? this.address,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    status: status ?? this.status,
  );
  PlacesTableData copyWithCompanion(PlacesTableCompanion data) {
    return PlacesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      distance: data.distance.present ? data.distance.value : this.distance,
      categoryName:
          data.categoryName.present
              ? data.categoryName.value
              : this.categoryName,
      categoryIconUrl:
          data.categoryIconUrl.present
              ? data.categoryIconUrl.value
              : this.categoryIconUrl,
      address: data.address.present ? data.address.value : this.address,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlacesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('distance: $distance, ')
          ..write('categoryName: $categoryName, ')
          ..write('categoryIconUrl: $categoryIconUrl, ')
          ..write('address: $address, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    distance,
    categoryName,
    categoryIconUrl,
    address,
    latitude,
    longitude,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlacesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.distance == this.distance &&
          other.categoryName == this.categoryName &&
          other.categoryIconUrl == this.categoryIconUrl &&
          other.address == this.address &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.status == this.status);
}

class PlacesTableCompanion extends UpdateCompanion<PlacesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> distance;
  final Value<String> categoryName;
  final Value<String> categoryIconUrl;
  final Value<String> address;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> status;
  final Value<int> rowid;
  const PlacesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.distance = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.categoryIconUrl = const Value.absent(),
    this.address = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlacesTableCompanion.insert({
    required String id,
    required String name,
    required int distance,
    required String categoryName,
    required String categoryIconUrl,
    required String address,
    required double latitude,
    required double longitude,
    required String status,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       distance = Value(distance),
       categoryName = Value(categoryName),
       categoryIconUrl = Value(categoryIconUrl),
       address = Value(address),
       latitude = Value(latitude),
       longitude = Value(longitude),
       status = Value(status);
  static Insertable<PlacesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? distance,
    Expression<String>? categoryName,
    Expression<String>? categoryIconUrl,
    Expression<String>? address,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (distance != null) 'distance': distance,
      if (categoryName != null) 'category_name': categoryName,
      if (categoryIconUrl != null) 'category_icon_url': categoryIconUrl,
      if (address != null) 'address': address,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlacesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? distance,
    Value<String>? categoryName,
    Value<String>? categoryIconUrl,
    Value<String>? address,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return PlacesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      distance: distance ?? this.distance,
      categoryName: categoryName ?? this.categoryName,
      categoryIconUrl: categoryIconUrl ?? this.categoryIconUrl,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (distance.present) {
      map['distance'] = Variable<int>(distance.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (categoryIconUrl.present) {
      map['category_icon_url'] = Variable<String>(categoryIconUrl.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlacesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('distance: $distance, ')
          ..write('categoryName: $categoryName, ')
          ..write('categoryIconUrl: $categoryIconUrl, ')
          ..write('address: $address, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$PlacesDatabase extends GeneratedDatabase {
  _$PlacesDatabase(QueryExecutor e) : super(e);
  $PlacesDatabaseManager get managers => $PlacesDatabaseManager(this);
  late final $PlacesTableTable placesTable = $PlacesTableTable(this);
  late final PlacesDao placesDao = PlacesDao(this as PlacesDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [placesTable];
}

typedef $$PlacesTableTableCreateCompanionBuilder =
    PlacesTableCompanion Function({
      required String id,
      required String name,
      required int distance,
      required String categoryName,
      required String categoryIconUrl,
      required String address,
      required double latitude,
      required double longitude,
      required String status,
      Value<int> rowid,
    });
typedef $$PlacesTableTableUpdateCompanionBuilder =
    PlacesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> distance,
      Value<String> categoryName,
      Value<String> categoryIconUrl,
      Value<String> address,
      Value<double> latitude,
      Value<double> longitude,
      Value<String> status,
      Value<int> rowid,
    });

class $$PlacesTableTableFilterComposer
    extends Composer<_$PlacesDatabase, $PlacesTableTable> {
  $$PlacesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryIconUrl => $composableBuilder(
    column: $table.categoryIconUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlacesTableTableOrderingComposer
    extends Composer<_$PlacesDatabase, $PlacesTableTable> {
  $$PlacesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryIconUrl => $composableBuilder(
    column: $table.categoryIconUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlacesTableTableAnnotationComposer
    extends Composer<_$PlacesDatabase, $PlacesTableTable> {
  $$PlacesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryIconUrl => $composableBuilder(
    column: $table.categoryIconUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$PlacesTableTableTableManager
    extends
        RootTableManager<
          _$PlacesDatabase,
          $PlacesTableTable,
          PlacesTableData,
          $$PlacesTableTableFilterComposer,
          $$PlacesTableTableOrderingComposer,
          $$PlacesTableTableAnnotationComposer,
          $$PlacesTableTableCreateCompanionBuilder,
          $$PlacesTableTableUpdateCompanionBuilder,
          (
            PlacesTableData,
            BaseReferences<
              _$PlacesDatabase,
              $PlacesTableTable,
              PlacesTableData
            >,
          ),
          PlacesTableData,
          PrefetchHooks Function()
        > {
  $$PlacesTableTableTableManager(_$PlacesDatabase db, $PlacesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PlacesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PlacesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$PlacesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> distance = const Value.absent(),
                Value<String> categoryName = const Value.absent(),
                Value<String> categoryIconUrl = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlacesTableCompanion(
                id: id,
                name: name,
                distance: distance,
                categoryName: categoryName,
                categoryIconUrl: categoryIconUrl,
                address: address,
                latitude: latitude,
                longitude: longitude,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int distance,
                required String categoryName,
                required String categoryIconUrl,
                required String address,
                required double latitude,
                required double longitude,
                required String status,
                Value<int> rowid = const Value.absent(),
              }) => PlacesTableCompanion.insert(
                id: id,
                name: name,
                distance: distance,
                categoryName: categoryName,
                categoryIconUrl: categoryIconUrl,
                address: address,
                latitude: latitude,
                longitude: longitude,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlacesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$PlacesDatabase,
      $PlacesTableTable,
      PlacesTableData,
      $$PlacesTableTableFilterComposer,
      $$PlacesTableTableOrderingComposer,
      $$PlacesTableTableAnnotationComposer,
      $$PlacesTableTableCreateCompanionBuilder,
      $$PlacesTableTableUpdateCompanionBuilder,
      (
        PlacesTableData,
        BaseReferences<_$PlacesDatabase, $PlacesTableTable, PlacesTableData>,
      ),
      PlacesTableData,
      PrefetchHooks Function()
    >;

class $PlacesDatabaseManager {
  final _$PlacesDatabase _db;
  $PlacesDatabaseManager(this._db);
  $$PlacesTableTableTableManager get placesTable =>
      $$PlacesTableTableTableManager(_db, _db.placesTable);
}
