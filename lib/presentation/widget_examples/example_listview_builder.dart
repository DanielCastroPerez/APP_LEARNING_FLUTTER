import 'package:flutter/material.dart';

class ExampleListviewBuilder extends StatelessWidget {
  const ExampleListviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final List post = [
      "post 1",
      "post 2",
      "post 3",
      "post 4",
      "post 5",
      "post 6",
      "post 7",
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Ejemplo de ListView.builder")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: ListView.builder(
          itemCount: post.length,
          itemBuilder: (context, index) {
            return Contenedor(child: post[index]);
          },
        ),
      ),
    );
  }
}

class Contenedor extends StatelessWidget {
  final String child;
  const Contenedor({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.purpleAccent,
      child: Container(),
    );
  }
}
