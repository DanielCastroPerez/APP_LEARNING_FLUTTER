import 'package:learning_flutter/domain/entities/widget_entity.dart';

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
          .map(
            (e) => PropiedadDetallada(
              id: e['id'],
              nombre: e['nombre'],
              tipo: e['tipo'],
              descripcionExtendida: e['descripcion_extendida'],
              ejemploPropiedad: e['ejemplo_propiedad'],
            ),
          )
          .toList(),

      usosComunes: (json['usos_comunes'] as List)
          .map((e) => UsosComunes(id: e['id'], descripcion: e['descripcion']))
          .toList(),

      constructoresComunes: (json['constructores_comunes'] as List)
          .map((e) => ConstructorComun(id: e['id'], firma: e['firma']))
          .toList(),

      widgetsRelacionados: (json['widgets_relacionados'] as List)
          .map((e) => WidgetRelacionado(id: e['id'], nombre: e['nombre']))
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
  ConstructoresComunesModel({required super.id, required super.firma});

  factory ConstructoresComunesModel.fromJson(Map<String, dynamic> json) {
    return ConstructoresComunesModel(id: json["id"], firma: json["firma"]);
  }

  Map<String, dynamic> toJson() => {"id": id, "firma": firma};
}

// Clase UsosComunesModel

class UsosComunesModel extends UsosComunes {
  UsosComunesModel({required super.id, required super.descripcion});
  factory UsosComunesModel.fromJson(Map<String, dynamic> json) {
    return UsosComunesModel(id: json["id"], descripcion: json["descripcion"]);
  }
  Map<String, dynamic> toJson() => {"id": id, "descripcion": descripcion};
}

// Clase WidgetsRelacionadosModel
class WidgetsRelacionadosModel extends WidgetRelacionado {
  WidgetRelacionado toEntity() {
    return WidgetRelacionado(id: id, nombre: nombre);
  }

  WidgetsRelacionadosModel({required super.id, required super.nombre});

  factory WidgetsRelacionadosModel.fromJson(Map<String, dynamic> json) {
    return WidgetsRelacionadosModel(id: json["id"], nombre: json["nombre"]);
  }

  Map<String, dynamic> toJson() => {"id": id, "nombre": nombre};
}
