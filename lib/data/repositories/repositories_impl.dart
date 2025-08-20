import 'package:learning_flutter/data/datasources/widget_remote_datasource.dart';
import 'package:learning_flutter/domain/entities/widget_entity.dart';
import 'package:learning_flutter/domain/repositories/widget_repository.dart';

class WidgetRepositoryImpl implements WidgetRepository {
  final WidgetRemoteDataSource remoteDataSource;

  WidgetRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<WidgetEntity>> getWidgets() async {
    final widgetModels = await remoteDataSource.getWidgets();
    return widgetModels; 
  }
}

