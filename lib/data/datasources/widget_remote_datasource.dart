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
