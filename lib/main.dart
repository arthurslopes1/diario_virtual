import 'package:diario_virtual/pages/principal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:diario_virtual/pages/login.dart';
import 'package:diario_virtual/globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  globals.UUID = await globals.buscaId();
  runApp(Diario());
}

class Diario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela Principal',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Principal(),
    );
  }
}
