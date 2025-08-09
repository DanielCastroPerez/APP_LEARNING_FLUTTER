import 'package:learning_flutter/data/models/widget_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


abstract class WidgetRemoteDataSource {
  Future<List<WidgetModel>> getWidgets();
}

class WidgetRemoteDataSourceImpl implements WidgetRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  WidgetRemoteDataSourceImpl({required this.client, required this.baseUrl});

  @override
  Future<List<WidgetModel>> getWidgets() async {
    final response = await client.get(Uri.parse('$baseUrl/get_widgets'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList
          .map((item) => WidgetModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Error al cargar los widgets (${response.statusCode})');
    }
  }
}






























/// Una clase abstracta con un metodo que retornara [WidgetModel]
/// Tiene como atributos [ client, baseUrl ]
// abstract class WidgetRemoteDataSource {
//   /// Retorna un [Future] que se completará con un [WidgetModel].
//   Future<WidgetModel> getWidget();//esto es un metodo
// }
// /// Esta clase realiza peticiones HTTP para obtener los datos del widget desde una API.
// class WidgetRemoteDataSourceImpl implements WidgetRemoteDataSource {
//   /// Cliente HTTP para realizar las peticiones.
//   final http.Client client;

//   /// URL base del endpoint de la API. Ejemplo: "https://api.midominio.com"
//   final String baseUrl;


//   /// Constructor que  tiene como atributos [ client, baseUrl ]
//   WidgetRemoteDataSourceImpl({
//     required this.client,
//     required this.baseUrl,
//   });

//   /// Si la respuesta es exitosa (código 200), decodifica el cuerpo en formato JSON
//   /// y lo convierte en un objeto [WidgetModel] usando [WidgetModel.fromJson].
//   @override
//   Future<WidgetModel> getWidget() async {
//     final response = await client.get(Uri.parse('$baseUrl/get_widgets'));
//     if (response.statusCode == 200) {
//       // Decodifica el cuerpo de la respuesta JSON a un mapa
//       final jsonData = json.decode(response.body);

//       // Convierte el mapa JSON en una instancia de WidgetModel y la retorna
//       return WidgetModel.fromJson(jsonData);
//     } else {
//       throw Exception('Error al cargar el widget (${response.statusCode})');
//     }
//   }
// }



