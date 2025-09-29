import 'package:flutter/material.dart';
import 'package:learning_flutter/domain/entities/widget_entity.dart';
import 'package:learning_flutter/presentation/providers/widget_provider.dart';
import 'package:learning_flutter/presentation/widgets/WidgetCard.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    final widgetProvider = Provider.of<WidgetProvider>(context, listen: false);
    widgetProvider.fetchWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Widgets"), centerTitle: true),
      body: Consumer<WidgetProvider>(
        builder: (context, widgetProvider, child) {
          if (widgetProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (widgetProvider.error != null) {
            return Center(
              child: Text(
                'Error: ${widgetProvider.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final widgetData = widgetProvider.widgetsData;

          final List<WidgetEntity> widgetsList = widgetData;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.2,
              ),
              itemCount: widgetsList.length,
              itemBuilder: (context, index) {
                return WidgetCard(widgetEntity: widgetsList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
