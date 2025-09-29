import 'package:flutter/material.dart';

class ExampleGesturedetector extends StatefulWidget {
  const ExampleGesturedetector({super.key});

  @override
  State<ExampleGesturedetector> createState() => _ExampleGesturedetectorState();
}

class _ExampleGesturedetectorState extends State<ExampleGesturedetector> {
  int contador = 0;
  void _incrementadorContador() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GestureDetector")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Contador: $contador", style: TextStyle(fontSize: 30)),
            GestureDetector(
              onTap: _incrementadorContador,
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.green,
                child: Text("Pulsa aqui", style: TextStyle(fontSize: 30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
