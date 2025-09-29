import 'package:flutter/material.dart';

class ExampleGridviewCount extends StatelessWidget {
  const ExampleGridviewCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView Example"), 
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[ 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.deepOrange),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: const Color.fromARGB(255, 117, 70, 182)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: const Color.fromARGB(255, 12, 193, 45)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: const Color.fromARGB(255, 147, 149, 163)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.deepOrangeAccent),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.amber),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, width: 50, color: Colors.greenAccent),
          ),
        ],
      ),
    );
  }
}