import 'package:flutter/material.dart';
import 'package:learning_flutter/domain/entities/widget_entity.dart';
import 'package:learning_flutter/providers/widget_provider.dart';
//import 'package:learning_flutter/widgets/widget_card.dart';
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
    // Aquí llamamos fetchWidget solo una vez al iniciar la pantalla
    // Usamos listen: false para no reconstruir widget por este llamado
    final widgetProvider = Provider.of<WidgetProvider>(context, listen: false);
    widgetProvider.fetchWidgets();
  }

  @override
  Widget build(BuildContext context) {
    // Usamos Consumer para escuchar cambios en WidgetProvider y reconstruir UI
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Widgets"),
        centerTitle: true,
      ),
      body: Consumer<WidgetProvider>(
        builder: (context, widgetProvider, child) {
          // 1. Si está cargando, mostramos un indicador
          if (widgetProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Si hay error, mostramos mensaje de error
          if (widgetProvider.error != null) {
            return Center(
              child: Text(
                'Error: ${widgetProvider.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // 4. Si hay datos, los mostramos en GridView
          final widgetData = widgetProvider.widgetsData;
          // Aquí convertimos el único widget que tienes en lista para mostrar,
          // pero si luego tienes lista real, solo usa widgetData directamente.
          final List<WidgetEntity> widgetsList = [widgetData[0]];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,  // Cambia el número de columnas según la pantalla
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.2,
              ),
              itemCount: widgetsList.length,
              itemBuilder: (context, index) {
                
                return Container();
                //return WidgetCard(widgetEntity: widgetsList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
