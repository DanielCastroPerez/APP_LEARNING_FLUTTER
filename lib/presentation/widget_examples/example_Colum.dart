import 'package:flutter/material.dart';

class ExampleColum extends StatelessWidget {
  const ExampleColum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de Column'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ejemplo de Column',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: const Center(child: Text('Caja Azul y estoy dentro de un Column')),
          ),
          const SizedBox(height: 20),
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: const Center(child: Text('Caja Roja y estoy dentro de un Column')),
          ),
          const SizedBox(height: 20),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
            child: const Center(child: Text('Caja Verde y estoy dentro de un Column')),
          ),
        ],
      ),
    );
  }
}