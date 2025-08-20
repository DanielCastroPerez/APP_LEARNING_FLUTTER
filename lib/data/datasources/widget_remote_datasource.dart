import 'package:learning_flutter/data/models/widget_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class WidgetRemoteDataSource {
  Future<List<WidgetModel>> getWidgets(); // usamos WidgetModel porque es el modelo que contiene la estructura de los datos que queremos obtener
}

/// Esta clase realiza peticiones HTTP para obtener los datos del widget desde una API.
class WidgetRemoteDataSourceImpl implements WidgetRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  WidgetRemoteDataSourceImpl({required this.client, required this.baseUrl});

  @override // se  sobreescribe el metodo de la clase abstracta
  Future<List<WidgetModel>> getWidgets() async {
    final response = await client.get(
      Uri.parse('$baseUrl/get_widgets'),
    ); // hacemos una peticion GET a la URL base concatenada con el endpoint 'get_widgets'

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList // Decodifica el cuerpo de la respuesta HTTP (que está en formato JSON) a una lista dinámica de Dart
          .map((item) => WidgetModel.fromJson(item as Map<String, dynamic>)) // Mapea cada elemento (item) del JSON a un [objeto] WidgetModel usando el método fromJson
          .toList();
    } else {
      throw Exception('Error al cargar los widgets (${response.statusCode})');
    }
  }
}


// Notas:
/*
future: es un tipo de dato que representa un valor que estará disponible en el futuro, es decir, una operación asíncrona.
async: es una palabra clave que se utiliza para definir una función asíncrona, lo que significa que puede contener operaciones que se ejecutan de manera asíncrona y pueden devolver un Future.
await: es una palabra clave que se utiliza dentro de una función asíncrona para esperar y no interrumpir la ejecución del código.
cuando usamos implements siempre debemos sobreescribir los metodos de la clase abstracta ***importante***
*/



