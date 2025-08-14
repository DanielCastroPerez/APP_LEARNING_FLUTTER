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

// pequeña explicacon de List<ClaseModelo> en Dart

/**
 * En dart también puedes crear [listas de objetos], como **List<ClaseModelo>**. Este tipo de lista es una lista de tamaño variable (crecible) que contiene [instancias de una clase] específica que tú has definido.

Es una de las formas más comunes de trabajar con listas en aplicaciones, ya que te permite manejar colecciones de datos complejos.

Ejemplo
Imagina que tienes una clase Producto con algunas propiedades:

class Producto {
  String nombre;
  double precio;

  Producto(this.nombre, this.precio);
}
Ahora, puedes crear una lista de objetos Producto y manipularla como cualquier otra lista de tamaño variable:


void main() {
  // Crear una lista de tipo Producto (una lista de objetos)
  List<Producto> carritoDeCompras = [];

  // Agregar objetos a la lista
  carritoDeCompras.add(Producto('Laptop', 1200.0));
  carritoDeCompras.add(Producto('Mouse', 25.0));
  carritoDeCompras.add(Producto('Teclado', 75.5));

  // Puedes recorrer la lista para acceder a las propiedades de cada objeto
  print('Elementos en el carrito:');
  for (var producto in carritoDeCompras) {
    print('${producto.nombre}: \$${producto.precio}');
  }

  // Puedes usar métodos de lista como `remove` o `clear`
  carritoDeCompras.removeAt(1); // Eliminar el mouse
  print('\nDespués de eliminar el mouse:');
  for (var producto in carritoDeCompras) {
    print('${producto.nombre}: \$${producto.precio}');
  }

  // O usar métodos para buscar elementos
  Producto? teclado = carritoDeCompras.firstWhere(
    (producto) => producto.nombre == 'Teclado',
  );

  print('\nEl precio del teclado es: \$${teclado.precio}');
}

// Salida:
// Elementos en el carrito:
// Laptop: $1200.0
// Mouse: $25.0
// Teclado: $75.5
//
// Después de eliminar el mouse:
// Laptop: $1200.0
// Teclado: $75.5
//
// El precio del teclado es: $75.5
Como puedes ver, List<ClaseModelo> es simplemente una lista de tamaño variable que está tipada para aceptar únicamente objetos de la clase ClaseModelo. Esto asegura que todos los elementos de la lista tengan las mismas propiedades y métodos, lo que facilita su manipulación y evita errores de tipo en tiempo de ejecución.

 */