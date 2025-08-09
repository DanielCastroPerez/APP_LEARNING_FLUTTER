

# Estructura y Uso de Provider en Flutter con Clean Architecture

## Estructura del Proyecto

```
/lib
├── core/                      ← Constantes, errores, utilidades
│   ├── errors/
│   └── utils/
├── data/                      ← Acceso a datos crudos (ej. JSON)
│   ├── datasources/
│   │   └── widget_local_data_source.dart  ← Carga de JSON local
│   ├── models/
│   │   └── widget_model.dart              ← Modelos con fromJson/toJson
│   └── repositories/
│       └── widget_repository_impl.dart    ← Implementación concreta del repositorio
├── domain/
│   ├── entities/
│   │   └── widget_entity.dart             ← Entidades con atributos y constructores
│   ├── repositories/
│   │   └── widget_repository.dart         ← Repositorio abstracto
│   └── usecases/
│       └── get_widgets.dart               ← Lógica de negocio (casos de uso)
├── presentation/
│   ├── pages/                            ← Pantallas
│   ├── widgets/                          ← Widgets UI reutilizables
│   └── providers/                        ← Controladores / manejo de estado con Provider o Riverpod
└── main.dart                            ← Punto de entrada de la app
```

---

## Notas sobre Clean Architecture

* Separar claramente responsabilidades en capas: `data`, `domain`, `presentation`.
* Evitar dependencias directas entre `presentation` y `data`.
* Usar repositorios abstractos en `domain` para desacoplar.
* Mantener lógica de negocio dentro de los casos de uso (`usecases`).

---

## Provider en Flutter

### ¿Qué es Provider?

`Provider` es un paquete para manejar estado en Flutter. Permite compartir datos y lógica entre widgets y actualizar automáticamente la UI cuando los datos cambian.

### ¿Cuándo usar Provider?

* Compartir información entre múltiples widgets o pantallas.
* Actualizar UI en respuesta a cambios de estado.
* Separar lógica de negocio y presentación.

---

### Pasos básicos para usar Provider

1. Crear una carpeta `/providers` para organizar tus controladores.
2. Crear clases que extiendan `ChangeNotifier`.
3. Registrar los providers en `main.dart` usando `ChangeNotifierProvider` o `MultiProvider`.
4. Acceder al estado con `context.watch<T>()` (para escuchar cambios y reconstruir) o `context.read<T>()` (para ejecutar acciones sin reconstruir UI).

---

### Ejemplo básico de Provider

```dart
// counter_provider.dart
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

```dart
// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterScreen());
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Contador con Provider")),
      body: Center(child: Text("Contador: ${counter.count}", style: TextStyle(fontSize: 24))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterProvider>().increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
```

---

### Diferencias entre `watch` y `read`

| Método               | Escucha cambios | Reconstruye UI | Uso típico                    |
| -------------------- | --------------- | -------------- | ----------------------------- |
| `context.watch<T>()` | Sí              | Sí             | Mostrar datos que cambian     |
| `context.read<T>()`  | No              | No             | Ejecutar acciones sin rebuild |

---

### ¿Qué hace `notifyListeners()`?

Llama a todos los widgets que están escuchando al provider para que se reconstruyan con los nuevos datos.

---

### Buenas prácticas

* Usa `MultiProvider` para agrupar varios providers.
* Mantén la lógica de estado dentro de tus providers, no en los widgets.
* Nombra tus providers claramente (`WidgetDataProvider`, `ThemeProvider`).
* Organiza tus providers en una carpeta `/providers`.
* Separa la UI de la lógica de negocio para facilitar mantenimiento y testing.

---

### Resumen rápido

* 📁 Organiza estados en `/providers`
* 🧠 Crea clases con `ChangeNotifier`
* 🛠 Registra providers en `main.dart` con `ChangeNotifierProvider` o `MultiProvider`
* 👁 Usa `watch` para leer datos y reconstruir UI
* 🕹 Usa `read` para ejecutar acciones sin rebuild
* 🔁 Usa `notifyListeners()` para actualizar la UI

