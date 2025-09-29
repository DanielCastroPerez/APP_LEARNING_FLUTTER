

# Estructura y Uso de Provider en Flutter con Clean Architecture

## Estructura del Proyecto

```
/lib
├── core/                      
│   ├── errors/
│   └── utils/
├── data/                      
│   ├── datasources/
│   │   └── widget_local_data_source.dart  
│   ├── models/
│   │   └── widget_model.dart              
│   └── repositories/
│       └── widget_repository_impl.dart    
├── domain/
│   ├── entities/
│   │   └── widget_entity.dart             
│   ├── repositories/
│   │   └── widget_repository.dart         
│   └── usecases/
│       └── get_widgets.dart               
├── presentation/
│   ├── screens/                            
│   ├── widgets/                          
│   └── providers/                        
└── main.dart                            
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

- Ejemplo de app:

<img width="407" height="912" alt="ListTitle1" src="https://github.com/user-attachments/assets/1e39f712-db4d-4a4e-8bea-b40bb3589dd8" />
<img width="428" height="946" alt="Inicio" src="https://github.com/user-attachments/assets/d676265e-4e0e-4a29-ac65-38ea932d41c5" />
<img width="412" height="917" alt="Scaffold5" src="https://github.com/user-attachments/assets/78945373-7647-44d1-b0e0-3a64bb2a5290" />
<img width="415" height="915" alt="Scaffold4" src="https://github.com/user-attachments/assets/438902a8-a302-4837-a1b7-6aa2d936c463" />
<img width="411" height="838" alt="Scaffold3" src="https://github.com/user-attachments/assets/1cb28220-c453-4686-84e2-4d330be786b3" />
<img width="418" height="905" alt="Scaffold2" src="https://github.com/user-attachments/assets/f5ed5471-a3be-4105-b4df-9044263f730b" />
<img width="411" height="913" alt="Scaffold1" src="https://github.com/user-attachments/assets/047d9ee2-0776-4a55-b965-e723a2ae7ffc" />
<img width="412" height="911" alt="ListTitle5" src="https://github.com/user-attachments/assets/8a7ee191-3115-4e67-9152-91a0e2d480f3" />
<img width="411" height="910" alt="ListTitle4" src="https://github.com/user-attachments/assets/a7a35b7d-9b5a-4a05-b407-36e64c0653b9" />
<img width="410" height="901" alt="ListTitle3" src="https://github.com/user-attachments/assets/16840a15-fd1f-430d-8f41-48e85b3e406a" />
<img width="412" height="913" alt="ListTitle2" src="https://github.com/user-attachments/assets/9f18f719-526d-4278-a87a-842e1b092376" />
