import 'package:flutter/material.dart';

class ExampleGridViewBuilder extends StatelessWidget {
  const ExampleGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Soy un GridView.builder")),
      body: GridView.builder(
        itemCount: 11, // Numero de elementos que se mostraran en el grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, //Numero de columnas mostradas en el grid
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.amberAccent),
          );
        },
      ),
    );
  }
}
