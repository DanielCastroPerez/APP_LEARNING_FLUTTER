
// En este archivo se declaran las entidades, que representan las estructuras principales de dominio (similares a los esquemas/modelos en FastAPI)
// Cada clase debe tener sus atributos con su tipo de dato correspondiente
// Las listas como uso, constructores y relacionados deben declararse como clases independientes porque son entidades con su propia estructura  

class WidgetEntity {
  final int id;
  final String nombre;
  final String descripcion;
  final String cuandoNoUsar;
  final String codigo;
  final String imagen;
  final String ruta;
  final List<PropiedadDetallada> propiedadesDetalladas; //  porque es una lista de propiedades detalladas
  final List<UsosComunes> usosComunes;
  final List<ConstructorComun> constructoresComunes;
  final List<WidgetRelacionado> widgetsRelacionados;

  WidgetEntity({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.cuandoNoUsar,
    required this.codigo,
    required this.imagen,
    required this.ruta,
    required this.propiedadesDetalladas,
    required this.usosComunes,
    required this.constructoresComunes,
    required this.widgetsRelacionados,
  });
}

class PropiedadDetallada {
  final int id;
  final String nombre;
  final String tipo;
  final String descripcionExtendida;
  final String ejemploPropiedad;

  PropiedadDetallada({
    required this.id,
    required this.nombre,
    required this.tipo,
    required this.descripcionExtendida,
    required this.ejemploPropiedad,
  });
}

class UsosComunes {
  final int id;
  final String descripcion;

  UsosComunes({
    required this.id,
    required this.descripcion,
  });
}

class ConstructorComun {
  final int id;
  final String firma;

  ConstructorComun({
    required this.id,
    required this.firma,
  });
}

class WidgetRelacionado {
  final int id;
  final String nombre;

  WidgetRelacionado({
    required this.id,
    required this.nombre,
  });
}
