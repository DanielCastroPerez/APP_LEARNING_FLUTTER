
import 'package:learning_flutter/domain/entities/widget_entity.dart';

/// Define un método que deberá ser implementado por cualquier clase que se encargue
/// de obtener un [WidgetEntity], ya sea desde una fuente remota, local, o mixta.
abstract class WidgetRepository {

  /// Método abstracto que debe retornar un [Future] con una instancia de [WidgetEntity].
  ///
  /// Este método será implementado por la clase concreta del repositorio, que se encargará
  /// de manejar la lógica para obtener los datos del widget.
  Future<List<WidgetEntity>> getWidgets();
  
}