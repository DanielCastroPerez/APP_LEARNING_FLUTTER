import 'package:flutter/material.dart';
import 'package:learning_flutter/domain/entities/widget_entity.dart';
import 'package:learning_flutter/presentation/widgets/WidgetDetailScreen.dart';


// WidgetCard es para oonstruir una tarjeta que muestra un widget y permite navegar a su detalle
// Recibe un WidgetEntity que contiene la información del widget a mostrar

class WidgetCard extends StatelessWidget {
  final WidgetEntity widgetEntity; // Porque WidgetEntity?
  const WidgetCard({super.key, required this.widgetEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        // Usamos InkWell para que sea interactivo convierte un widget en un botón
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => WidgetDetailScreen(
                widgetEntity: widgetEntity,
              ), // Navegamos a  la clase WidgetDetailScreen y le pasamos el widget selecionado
            ),
          );
        },

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Imagen del widget
            Expanded(
              flex: 3,
              child: Hero( // Usamos Hero para animar la imagen 
                tag: widgetEntity.nombre, // debe ser único
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    widgetEntity.imagen,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (
                          BuildContext context,
                          Object error,
                          StackTrace? stackTrace,
                        ) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 48,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          );
                        },
                  ),
                ),
              ),
            ),

            // Titulo y descripcion del widget
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text para el Titulo del widget
                    Text(
                      widgetEntity.nombre,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow
                          .ellipsis, // Si el texto es ml largo solo se mustrara una linea?
                    ),
                    const SizedBox(height: 4.0),
                    Expanded(
                      // Usamos Expanded para que el texto ocupe el espacio restante
                      child: Text(
                        // Descripcion del widget
                        widgetEntity.descripcion,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
