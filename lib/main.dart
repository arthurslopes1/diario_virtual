import 'package:flutter/material.dart';
import 'package:diario_virtual/pages/login.dart';

void main() => runApp(Diario());

class Diario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Login(),
    );
  }
}

