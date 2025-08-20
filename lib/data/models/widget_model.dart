import 'package:learning_flutter/domain/entities/widget_entity.dart';

// Esta clase es para el modelo de la data donde convierto un modelo a JSON (fromJson) y de JSON a modelo (toJson)
// Heredo de la clase de domain/entidades/widget_entity.dart y pongo super para sus atributos


///  Convierte el JSON a un modelo y de modelo a entidad.
///  Esta capa traduce la respuesta del backend para que el [dominio] trabaje con datos puros y limpios.
class WidgetModel extends WidgetEntity {
  WidgetModel({
    required super.id,
    required super.nombre,
    required super.descripcion,
    required super.cuandoNoUsar,
    required super.codigo,
    required super.imagen,
    required super.ruta,
    required super.propiedadesDetalladas,
    required super.usosComunes,
    required super.constructoresComunes,
    required super.widgetsRelacionados,
  });

  factory WidgetModel.fromJson(Map<String, dynamic> json) {
    return WidgetModel(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      cuandoNoUsar: json['cuando_no_usar'],
      codigo: json['codigo'],
      imagen: json['imagen'],
      ruta: json['ruta'],
      
      propiedadesDetalladas: (json['propiedades_detalladas'] as List)
          .map((e) => PropiedadDetallada( // Convierte cada elemento de la lista a un objeto PropiedadDetallada
                id: e['id'],
                nombre: e['nombre'],
                tipo: e['tipo'],
                descripcionExtendida: e['descripcion_extendida'],
                ejemploPropiedad: e['ejemplo_propiedad'],
              ))
          .toList(),

      usosComunes: (json['usos_comunes'] as List)
          .map((e) => UsosComunes(
                id: e['id'],
                descripcion: e['descripcion'],
              ))
          .toList(),

      constructoresComunes: (json['constructores_comunes'] as List)
          .map((e) => ConstructorComun(
                id: e['id'],
                firma: e['firma'],
              ))
          .toList(),

      widgetsRelacionados: (json['widgets_relacionados'] as List)
          .map((e) => WidgetRelacionado(
                id: e['id'],
                nombre: e['nombre'],
              ))
          .toList(),
    );
  }
}


// Clase propiedadesDetallada
class PropiedadDetalladaModel extends PropiedadDetallada {
  PropiedadDetalladaModel({
      required super.id,
      required super.nombre,
      required super.tipo,
      required super.descripcionExtendida,
      required super.ejemploPropiedad,
    });
  // Sirve para crear un modelo de datos
  factory PropiedadDetalladaModel.fromJson(Map<String, dynamic> json) {
    return PropiedadDetalladaModel(
      id: json["id"],
      nombre: json["nombre"],
      tipo: json["tipo"],
      descripcionExtendida: json["descripcion_extendida"],
      ejemploPropiedad: json["ejemplo_propiedad"],
    );
  }


  /// Sirve para enviar datos al backend. Si vas a enviar datos (POST, PUT)
  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "tipo": tipo,
    "descripcion_extendida": descripcionExtendida,
    "ejemplo_propiedad": ejemploPropiedad,
  };
}
// Clase ConstructoresComunesModel

class ConstructoresComunesModel extends ConstructorComun {
  ConstructoresComunesModel({
      required super.id,
      required super.firma,
    });

    factory ConstructoresComunesModel.fromJson(Map<String,dynamic> json){
      return ConstructoresComunesModel(
        id: json["id"],
        firma: json["firma"],
      );
    }

    Map <String,dynamic> toJson()=>{
        "id":id,
        "firma":firma,
    };
}


// Clase UsosComunesModel

class UsosComunesModel extends UsosComunes {
  UsosComunesModel({
    required super.id,
    required super.descripcion,
  });
  factory UsosComunesModel.fromJson(Map <String,dynamic> json){
    return UsosComunesModel(
      id: json["id"],
      descripcion: json["descripcion"],
    );
  }
  Map <String,dynamic> toJson()=>{
    "id":id,
    "descripcion":descripcion,
  };
}

// Clase WidgetsRelacionadosModel
class WidgetsRelacionadosModel extends WidgetRelacionado {
  WidgetRelacionado toEntity() {
    return WidgetRelacionado(
      id: id,
      nombre: nombre,
    );
  }

  WidgetsRelacionadosModel({required super.id, required super.nombre});

  factory WidgetsRelacionadosModel.fromJson(Map<String, dynamic> json) {
    return WidgetsRelacionadosModel(id: json["id"], nombre: json["nombre"]);
  }

  Map<String, dynamic> toJson() => {"id": id, "nombre": nombre};
}


/**
 * Descomponiendo el código: de JSON a Objetos Dart
La línea de código que mostraste es un ejemplo perfecto de cómo convertir una lista de mapas (que es como se representa una lista de objetos en JSON) en una lista de objetos de una clase de Dart.

propiedadesDetalladas: (json['propiedades_detalladas'] as List).map((e) => PropiedadDetallada(id: e['id'], nombre: e['nombre'],)).toList(),

Aquí está el desglose paso a paso:

json['propiedades_detalladas']

Primero, se accede al valor de la clave propiedades_detalladas dentro del mapa json. Se asume que este valor es una lista, que en Dart se interpreta como List<dynamic>.

as List

Este es un cast o "moldeado" de tipo. Se le dice explícitamente a Dart que el valor que se obtiene es una List. Esto es una buena práctica para asegurar que el código funcione como se espera.

.map((e) => PropiedadDetallada(...))

Aquí es donde ocurre la magia. El método map() se aplica a la lista obtenida.

e es una variable que representa cada elemento de la lista. En este caso, cada elemento es un Map (un objeto JSON) con las claves 'id' y 'nombre'.

La función de flecha (e) => ... indica que se debe ejecutar el código a la derecha para cada elemento.

PropiedadDetallada(id: e['id'], nombre: e['nombre'],) crea una nueva instancia de la clase PropiedadDetallada para cada mapa. Se toman los valores de las claves 'id' y 'nombre' de cada mapa y se usan para inicializar el nuevo objeto.

.toList()

Como vimos en los ejemplos anteriores, el método map() no devuelve directamente una List, sino un Iterable. Para obtener una lista real de objetos PropiedadDetallada, se utiliza toList() al final. Esto convierte el Iterable resultante en una List.

El resultado final de esta línea de código es una lista (List<PropiedadDetallada>) que contiene objetos de la clase PropiedadDetallada, cada uno inicializado con los datos de sus respectivos mapas JSON.
 */


