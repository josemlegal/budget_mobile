import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi primera aplicación Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi primera aplicación Flutter'),
        ),
        body: Center(
          child: Text('¡Hola, mundo!'),
        ),
      ),
    );
  }
}
