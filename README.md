

# Estructura y Uso de Provider en Flutter con Clean Architecture

## Estructura del Proyecto

```
/lib
├── core/                      // Constantes, errores, utilidades
│   ├── errors/
│   └── utils/
├── data/                      // Acceso a datos crudos (ej. JSON)
│   ├── datasources/
│   │   └── widget_local_data_source.dart  // Carga de JSON local
│   ├── models/
│   │   └── widget_model.dart              // Modelos con fromJson/toJson
│   └── repositories/
│       └── widget_repository_impl.dart    // Implementación concreta del repositorio
├── domain/
│   ├── entities/
│   │   └── widget_entity.dart             // Entidades con atributos y constructores
│   ├── repositories/
│   │   └── widget_repository.dart         // Repositorio abstracto
│   └── usecases/
│       └── get_widgets.dart               // Lógica de negocio (casos de uso)
├── presentation/
│   ├── screens/                            // Pantallas
│   ├── widgets/                          // Widgets UI reutilizables
│   └── providers/                        // Controladores / manejo de estado con Provider o Riverpod
└── main.dart                            // Punto de entrada de la app
```

---

## Notas sobre Clean Architecture

* Capas separadas: `data`, `domain`, `presentation`.
* `domain` define contratos y lógica de negocio. solo van las clases y su constructor
* `data` implementa esos contratos y gestiona datos crudos. reciben datos de un json y se las pasa a `domain` y doman guada esa informacio en las clases 
* `presentation` consume la lógica usando `Provider` para manejo de estado.
* No hay dependencias directas entre `presentation` y `data`.

## Uso de Provider en este Proyecto

* Providers ubicados en `/presentation/providers`.
* Cada provider extiende `ChangeNotifier`.
* Registro en `main.dart` usando `MultiProvider`.
* `context.watch` para escuchar cambios y reconstruir UI.
* `context.read` para ejecutar acciones sin reconstruir UI.

## Buenas Prácticas Aplicadas

* Lógica de negocio aislada en `/domain/usecases`.
* Providers enfocados solo en manejo de estado, sin lógica de UI.
* UI dividida en widgets reutilizables.
* Uso de repositorios abstractos en `domain` para desacoplar.
* Constantes y utilidades centralizadas en `/core`.

## Resumen Rápido

* Organiza estado en `/presentation/providers`.
* Crea clases `ChangeNotifier` para manejar estado.
* Registra providers globalmente en `main.dart`.
* Usa `watch` para mostrar datos y `read` para acciones.
* Aplica `notifyListeners()` para actualizar la UI.
## Nota de aprendizaje

*Este proyecto fue desarrollado como parte de mi aprendizaje de Clean Architecture en Flutter.
Durante su construcción investigué, adapté y escribí código basado en ejemplos, ajustándolo para comprender a fondo:

- Organización del proyecto por capas (data, domain, presentation)

- Uso de Provider para manejo de estado

- Creación y reutilización de widgets personalizados

- Configuración de ThemeData para estilos globales