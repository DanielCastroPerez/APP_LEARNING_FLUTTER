import 'package:learning_flutter/domain/entities/widget_entity.dart';

abstract class WidgetRepository {
  Future<List<WidgetEntity>> getWidgets();
}
