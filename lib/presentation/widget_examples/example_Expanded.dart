import 'package:flutter/material.dart';

class ExampleExpanded extends StatelessWidget {
  const ExampleExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejemplo de Expanded"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ejemplo 1: Expanded llenando el espacio restante
            const Text(
              'Expanded llenando el espacio restante:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                  child: const Center(child: Text('Fijo')),
                ),
                Expanded(
                  // Este Container ocupará todo el espacio restante
                  child: Container(
                    height: 80,
                    color: Colors.blue,
                    child: const Center(child: Text('Expandido')),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Ejemplo 2: Expanded con flex para distribuir espacio
            const Text(
              'Expanded con flex:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 1, // Ocupará 1/3 del espacio disponible
                  child: Container(
                    height: 80,
                    color: Colors.green,
                    child: const Center(child: Text('Flex 1')),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2, // Ocupará 2/3 del espacio disponible
                  child: Container(
                    height: 80,
                    color: Colors.orange,
                    child: const Center(child: Text('Flex 2')),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Ejemplo 3: Expanded vs Flexible
            const Text(
              'Expanded vs Flexible:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: Container(
                    height: 80,
                    color: Colors.purple,
                    child: const Center(
                      child: Text(
                        'Flexible (fit: loose)',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 80,
                    color: Colors.cyan,
                    child: const Center(
                      child: Text(
                        'Expanded (fit: tight)',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
