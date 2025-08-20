import 'package:flutter/material.dart';

class ExampleImage extends StatelessWidget {
  const ExampleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo de propiedades de Image'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/imagenesflutter.firebasestorage.app/o/Imagenes%2FImage.jpg?alt=media&token=9e404d54-e22e-4c53-8695-dd598332a1ab',
              width: 150,
              height: 150,
              fit: BoxFit.contain, 
              alignment: Alignment.center, 
              color: Colors.pink.withOpacity(0.5),
              colorBlendMode: BlendMode.srcOver,
            ),
          ),
        ),
      );
  }
}