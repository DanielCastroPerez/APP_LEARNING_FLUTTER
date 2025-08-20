import 'package:flutter/material.dart';

class ExampleCliprrect extends StatelessWidget {
  const ExampleCliprrect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejemplo de ClipRRect"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.lightBlueAccent, // Added color for visibility
                alignment: Alignment.center, // Center text
                child: const Text(
                  "Soy un container con un radio de 20",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.blueAccent, // Added color for visibility
                alignment: Alignment.center, // Center text
                child: const Text(
                  "Soy un container con un radio de 50",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}