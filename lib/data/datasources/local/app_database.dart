import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

// Definimos la tabla Widgets
class WidgetsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text()();
  TextColumn get descripcion => text()();
  //TextColumn get imagenUrl => text().nullable()(); // si usas imágenes
}

// Creamos la base de datos Drift
@DriftDatabase(tables: [WidgetsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Métodos DAO manuales (más adelante podemos separarlos en archivos)
  Future<List<WidgetsTableData>> getAllWidgets() => select(widgetsTable).get();

  Future<int> insertWidget(WidgetsTableCompanion widget) =>
      into(widgetsTable).insert(widget);

  Future<void> insertWidgets(List<WidgetsTableCompanion> widgets) async {
    await batch((batch) {
      batch.insertAll(widgetsTable, widgets);
    });
  }

  Future<void> clearWidgets() => delete(widgetsTable).go();
}

// Configuración para abrir la BD
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
