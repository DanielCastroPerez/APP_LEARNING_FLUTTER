import 'package:flutter/material.dart';

class ExampleContainer extends StatelessWidget {
  const ExampleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de un Container'),centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'Soy un Container de 200x200 ',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),

            Divider(),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color : Colors.red,
              ),
              child: Text('Container con BoxDecoration y BorderRadius',
              style: Theme.of(context).textTheme.headlineSmall,
                ),
            )
          ],
        ),
      ),
    );
  }
}