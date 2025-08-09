import 'package:flutter/material.dart';
import 'package:learning_flutter/domain/entities/widget_entity.dart';
import 'package:learning_flutter/domain/usecases/get_widget.dart';


class WidgetProvider with ChangeNotifier {
  final GetWidgetUseCase getWidgetUseCase;

  List<WidgetEntity> widgetsData = [];

  bool isLoading = false;
  String? error;

  WidgetProvider({required this.getWidgetUseCase});

  Future<void> fetchWidgets() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      widgetsData = await getWidgetUseCase(); // aquí ya no casteas
    } catch (e) {
      error = 'Error al cargar widgets: $e';
    }

    isLoading = false;
    notifyListeners();
  }
}



// // Provider que maneja el estado relacionado con el WidgetEntity
// class WidgetProvider with ChangeNotifier {
//   // Caso de uso para obtener el widget (proviene de la capa Domain)
//   final GetWidgetUseCase getWidgetUseCase;

//   // Datos del widget (puede ser null hasta que se carguen)
//   WidgetEntity? widgetData;

//   // Estado de carga (true mientras se están obteniendo los datos)
//   bool isLoading = false;

//   // Posible mensaje de error si ocurre un problema al obtener los datos
//   String? error;

//   // Constructor que recibe el caso de uso
//   WidgetProvider({required this.getWidgetUseCase});

//   // Método para obtener el widget desde el caso de uso
//   Future<void> fetchWidget() async {
//     // Se indica que comenzó la carga
//     isLoading = true;
//     error = null; // Reinicia el error
//     notifyListeners(); // Notifica a la UI para que actualice el estado

//     try {
//       // Ejecuta el caso de uso y guarda la respuesta en widgetData
//       widgetData = (await getWidgetUseCase()) as WidgetEntity?;
//     } catch (e) {
//       // Si ocurre un error, se guarda en la variable error
//       error = 'Error al cargar widget: $e';
//     }

//     // Finaliza la carga y notifica cambios
//     isLoading = false;
//     notifyListeners();
//   }
// }
 //C:\Users\DanielCP\Desktop\APIS_TODAS\API_Learning_Flutter>