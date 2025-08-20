import 'package:flutter/material.dart';


class ExampleAppbar extends StatelessWidget {
  const ExampleAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soy un Appbar jajajaj"),centerTitle: true,
      ),
    );
  }
}