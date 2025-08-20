import 'package:flutter/material.dart';

class ExamlpleText extends StatelessWidget {
  const ExamlpleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de Widget Text'), centerTitle:true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Ejemplo 1: Título con estilo personalizado
              const Text(
                '¡Hola, Flutter!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.5,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
              ),
              const SizedBox(height: 20),

              // Ejemplo 2: Texto largo con desbordamiento y alineación
              const Text(
                'Este es un texto de ejemplo largo para demostrar cómo se maneja el desbordamiento y la alineación. Si el texto es demasiado largo para una sola línea, se limitará y añadirá puntos suspensivos al final.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.5, // Altura de línea
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}