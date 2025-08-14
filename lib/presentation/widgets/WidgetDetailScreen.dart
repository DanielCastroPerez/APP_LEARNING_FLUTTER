import 'package:flutter/material.dart';
import 'package:learning_flutter/domain/entities/widget_entity.dart';
import 'package:learning_flutter/presentation/widgets/CodeBlock.dart';

class WidgetDetailScreen extends StatelessWidget {
  final WidgetEntity widgetEntity; // Recibe un WidgetEntity para mostrar sus detalles
  const WidgetDetailScreen({super.key, required this.widgetEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widgetEntity.nombre)),

      body: SingleChildScrollView(
        // Permite desplazar el contenido si es más grande que la pantalla
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            // Imagen del widget
            // Hero widget para animación de transición

            Hero(  
              tag: "widget-${widgetEntity.nombre}",
              child: ClipRRect(
                // ClipRRect para redondear las esquinas de la imagen
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  widgetEntity.imagen,
                  height: 200,
                  width: double.infinity, // Ocupa todo el ancho disponible
                  fit: BoxFit.cover,
                  errorBuilder:  // Manejador de errores si la imagen no se carga
                      (
                        BuildContext context,
                        Object error,
                        StackTrace? stackTrace,
                      ) {
                        return Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 60,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        );
                      },
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Mostramos un titulo grande con el nombre del widget
            Text(
              "Descripción General",
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            Divider(), // Línea divisoria para separar secciones y se vea chido
            // Mostramos la descripción del widget
            Text(
              widgetEntity.descripcion,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign :TextAlign.justify,
            ),

            Divider(),

            Text(
              "Propiedades Detalladasta",
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            Divider(),

            // Mapeamos las propiedades detalladas a widgets
            ...widgetEntity.propiedadesDetalladas.map<Widget>(( 
              PropiedadDetallada propiedad,
            ) {
              // Mapeamos las propiedades detalladas a widgets
              return Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${propiedad.nombre} (${propiedad.tipo})",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 4.0),

                    Text(
                      propiedad.descripcionExtendida,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),

                    SizedBox(height: 8.0),

                    Text(
                      "Ejemplo de uso:",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    CodeBlock(code: propiedad.ejemploPropiedad),
                  ],
                ),
              );
            }),
            SizedBox(height: 24.0),

            Text(
              "Uso Comunes",
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            Divider(),
            // Mostramos los usos comunes del widget
            ...widgetEntity.usosComunes.map((UsosComunes uso) {
              return Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check, size: 18, color: Colors.green),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        uso.descripcion,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              );
            }),

            SizedBox(height: 24.0),
            Text(
              'Constructores Comunes',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Divider(),
            ...widgetEntity.constructoresComunes.map<Widget>((
              ConstructorComun construc,
            ) {
              return Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: CodeBlock(code: construc.firma),
              );
            }).toList(),

            SizedBox(height: 24.0),
            Text(
              "Widgets Relacionados",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Divider(),

            ///
            Wrap(
              spacing: 8.0, // Espacio horizontal entre chips
              runSpacing: 4.0, // Espacio vertical entre líneas de chips
              children: widgetEntity.widgetsRelacionados.map<Widget>((
                WidgetRelacionado related,
              ) {
                return Chip(
                  label: Text(related.nombre),
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.tertiaryContainer,
                  labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                );
              }).toList(),
            ),

            ///////
            const SizedBox(height: 24.0),
            Text(
              'Cuando NO usar ${widgetEntity.nombre}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),
            Text(
              widgetEntity.cuandoNoUsar,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24.0),
            Text(
              'Código de Ejemplo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(),

            CodeBlock(code: widgetEntity.codigo),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
