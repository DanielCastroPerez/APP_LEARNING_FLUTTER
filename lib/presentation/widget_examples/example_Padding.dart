import 'package:flutter/material.dart';

class ExamplePadding extends StatelessWidget {
  const ExamplePadding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Padding Demo'),centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.blueAccent,
                width: 150,
                height: 150,
                child: const Center(child: Text('Padding.all')),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: Container(
                color: Colors.green,
                width: 150,
                height: 50,
                child: const Center(child: Text('Padding.symmetric')),
              ),
            ),
            const SizedBox(height: 20),
            
            Container(
              color: Colors.orange,
              width: 150,
              height: 50,
              child: const Center(child: Text('Sin Padding')),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Container(
                color: Colors.red,
                width: 150,
                height: 50,
                child: const Center(child: Text('Padding.only')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}