import 'package:learning_flutter/domain/entities/widget_entity.dart';
import 'package:learning_flutter/domain/repositories/widget_repository.dart';

class GetWidgetUseCase {
  final WidgetRepository repository;

  GetWidgetUseCase({required this.repository});

  Future<List<WidgetEntity>> call() async {
    return await repository.getWidgets();
  }
}
