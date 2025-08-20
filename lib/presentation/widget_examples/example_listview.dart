import 'package:flutter/material.dart';

class ExampleListview extends StatelessWidget {
  const ExampleListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejemplo de ListView"), centerTitle: true),

      body: ListView(
        padding: EdgeInsets.all(9.0),
        children: [
          Container(
            height: 200,
            color: Colors.blue,
            child: Text(
              "Yo soy un container pero tambien puedo ser un card",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            color: Colors.deepPurple,
            child: Text(
              "Yo soy otro container",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200, 
            color: Colors.lightGreenAccent,
          child: Text("Yo soy Yo soy otro container",style: Theme.of(context).textTheme.headlineSmall,),),
          SizedBox(height: 10),
          Container(
            height: 200, 
            color: Colors.orangeAccent,
            child: Text("Yo soy Yo soy otro container", style: Theme.of(context).textTheme.headlineSmall,),),
        ],
      ),
    );
  }
}
