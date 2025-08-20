import 'package:flutter/material.dart';

class ExampleRow extends StatelessWidget {
  const ExampleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo de Row'),centerTitle:true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const Text(
              'Ejemplo de Row',
              
            ),
            const SizedBox(width: 20),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(child: Text('Caja Azul y estoy dentro de un Row')),
            ),
            const SizedBox(width: 20),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: const Center(child: Text('Caja Roja y estoy dentro de un Row')),
            ),
            const SizedBox(width: 20),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
              child: const Center(child: Text('Caja Verde y estoy dentro de un Row')),
            ),
          ],
        ),
      ),
    );
  }
}