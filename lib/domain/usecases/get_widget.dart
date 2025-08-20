
import 'package:learning_flutter/domain/entities/widget_entity.dart';
import 'package:learning_flutter/domain/repositories/widget_repository.dart';

class GetWidgetUseCase {
  final WidgetRepository repository;

  // constructor para recibir el repositorio
  GetWidgetUseCase({required this.repository});

  // Usamos call para que la clase se comporte como una función. El call retornara una lista de WidgetEntity
  Future<List<WidgetEntity>> call() async  {// WidgetEntity porque mostraremos todos los widgets si solo usaremos Propiedad Detallada llamaremos [Future<PropiedadDetallada>]
    return await repository.getWidgets();
  }
}
