// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WidgetsTableTable extends WidgetsTable
    with TableInfo<$WidgetsTableTable, WidgetsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WidgetsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagenUrlMeta = const VerificationMeta(
    'imagenUrl',
  );
  @override
  late final GeneratedColumn<String> imagenUrl = GeneratedColumn<String>(
    'imagen_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nombre, descripcion, imagenUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'widgets_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WidgetsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('imagen_url')) {
      context.handle(
        _imagenUrlMeta,
        imagenUrl.isAcceptableOrUnknown(data['imagen_url']!, _imagenUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WidgetsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WidgetsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      imagenUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}imagen_url'],
      ),
    );
  }

  @override
  $WidgetsTableTable createAlias(String alias) {
    return $WidgetsTableTable(attachedDatabase, alias);
  }
}

class WidgetsTableData extends DataClass
    implements Insertable<WidgetsTableData> {
  final int id;
  final String nombre;
  final String descripcion;
  final String? imagenUrl;
  const WidgetsTableData({
    required this.id,
    required this.nombre,
    required this.descripcion,
    this.imagenUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['descripcion'] = Variable<String>(descripcion);
    if (!nullToAbsent || imagenUrl != null) {
      map['imagen_url'] = Variable<String>(imagenUrl);
    }
    return map;
  }

  WidgetsTableCompanion toCompanion(bool nullToAbsent) {
    return WidgetsTableCompanion(
      id: Value(id),
      nombre: Value(nombre),
      descripcion: Value(descripcion),
      imagenUrl: imagenUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imagenUrl),
    );
  }

  factory WidgetsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WidgetsTableData(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      imagenUrl: serializer.fromJson<String?>(json['imagenUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'descripcion': serializer.toJson<String>(descripcion),
      'imagenUrl': serializer.toJson<String?>(imagenUrl),
    };
  }

  WidgetsTableData copyWith({
    int? id,
    String? nombre,
    String? descripcion,
    Value<String?> imagenUrl = const Value.absent(),
  }) => WidgetsTableData(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    descripcion: descripcion ?? this.descripcion,
    imagenUrl: imagenUrl.present ? imagenUrl.value : this.imagenUrl,
  );
  WidgetsTableData copyWithCompanion(WidgetsTableCompanion data) {
    return WidgetsTableData(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      imagenUrl: data.imagenUrl.present ? data.imagenUrl.value : this.imagenUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WidgetsTableData(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('imagenUrl: $imagenUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, descripcion, imagenUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WidgetsTableData &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.descripcion == this.descripcion &&
          other.imagenUrl == this.imagenUrl);
}

class WidgetsTableCompanion extends UpdateCompanion<WidgetsTableData> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> descripcion;
  final Value<String?> imagenUrl;
  const WidgetsTableCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.imagenUrl = const Value.absent(),
  });
  WidgetsTableCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required String descripcion,
    this.imagenUrl = const Value.absent(),
  }) : nombre = Value(nombre),
       descripcion = Value(descripcion);
  static Insertable<WidgetsTableData> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? descripcion,
    Expression<String>? imagenUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (descripcion != null) 'descripcion': descripcion,
      if (imagenUrl != null) 'imagen_url': imagenUrl,
    });
  }

  WidgetsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<String>? descripcion,
    Value<String?>? imagenUrl,
  }) {
    return WidgetsTableCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      imagenUrl: imagenUrl ?? this.imagenUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (imagenUrl.present) {
      map['imagen_url'] = Variable<String>(imagenUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WidgetsTableCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('imagenUrl: $imagenUrl')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WidgetsTableTable widgetsTable = $WidgetsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [widgetsTable];
}

typedef $$WidgetsTableTableCreateCompanionBuilder =
    WidgetsTableCompanion Function({
      Value<int> id,
      required String nombre,
      required String descripcion,
      Value<String?> imagenUrl,
    });
typedef $$WidgetsTableTableUpdateCompanionBuilder =
    WidgetsTableCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<String> descripcion,
      Value<String?> imagenUrl,
    });

class $$WidgetsTableTableFilterComposer
    extends Composer<_$AppDatabase, $WidgetsTableTable> {
  $$WidgetsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagenUrl => $composableBuilder(
    column: $table.imagenUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WidgetsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WidgetsTableTable> {
  $$WidgetsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagenUrl => $composableBuilder(
    column: $table.imagenUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WidgetsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WidgetsTableTable> {
  $$WidgetsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagenUrl =>
      $composableBuilder(column: $table.imagenUrl, builder: (column) => column);
}

class $$WidgetsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WidgetsTableTable,
          WidgetsTableData,
          $$WidgetsTableTableFilterComposer,
          $$WidgetsTableTableOrderingComposer,
          $$WidgetsTableTableAnnotationComposer,
          $$WidgetsTableTableCreateCompanionBuilder,
          $$WidgetsTableTableUpdateCompanionBuilder,
          (
            WidgetsTableData,
            BaseReferences<_$AppDatabase, $WidgetsTableTable, WidgetsTableData>,
          ),
          WidgetsTableData,
          PrefetchHooks Function()
        > {
  $$WidgetsTableTableTableManager(_$AppDatabase db, $WidgetsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WidgetsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WidgetsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WidgetsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<String?> imagenUrl = const Value.absent(),
              }) => WidgetsTableCompanion(
                id: id,
                nombre: nombre,
                descripcion: descripcion,
                imagenUrl: imagenUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                required String descripcion,
                Value<String?> imagenUrl = const Value.absent(),
              }) => WidgetsTableCompanion.insert(
                id: id,
                nombre: nombre,
                descripcion: descripcion,
                imagenUrl: imagenUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WidgetsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WidgetsTableTable,
      WidgetsTableData,
      $$WidgetsTableTableFilterComposer,
      $$WidgetsTableTableOrderingComposer,
      $$WidgetsTableTableAnnotationComposer,
      $$WidgetsTableTableCreateCompanionBuilder,
      $$WidgetsTableTableUpdateCompanionBuilder,
      (
        WidgetsTableData,
        BaseReferences<_$AppDatabase, $WidgetsTableTable, WidgetsTableData>,
      ),
      WidgetsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WidgetsTableTableTableManager get widgetsTable =>
      $$WidgetsTableTableTableManager(_db, _db.widgetsTable);
}
