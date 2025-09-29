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
      widgetsData = await getWidgetUseCase();
    } catch (e) {
      error = 'Error al cargar widgets: $e';
    }

    isLoading = false;
    notifyListeners();
  }
}
