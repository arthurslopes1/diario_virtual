import 'package:diario_virtual/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:diario_virtual/pages/principal.dart';
import 'package:diario_virtual/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';


showAlertaLogin(BuildContext context) {

  Widget simButton = TextButton(
    child: Text("Sim", style: TextStyle( color: Colors.black,), ),
    onPressed:  () async {
      final prefs = await SharedPreferences.getInstance();

      prefs.setString('username', globals.username);
      debugPrint("movieTitle: ${globals.username}");
      prefs.setString('password', globals.password);
      debugPrint('movieTitle: ${globals.password}');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Principal(),
        ),
      );
    },
  );

  Widget naoButton = TextButton(
    child: Text("Não", style: TextStyle( color: Colors.black,), ),
    onPressed:  () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Principal(),
        ),
      );
    },
  );
  
  AlertDialog alert = AlertDialog(
    title: Text("Deseja salvar usuário e senha?"),
    actions: [
      simButton,
      naoButton,
    ],
  );
  
  showDialog(
    context: context,
    builder: (BuildContext context,) {
      return alert;
    },
  );
}

showAlertaLogoff(BuildContext context) {
  Widget simButton = TextButton(
    child: Text("Sim", style: TextStyle( color: Colors.black,), ),
    onPressed:  () async {
      final prefs = await SharedPreferences.getInstance();
      globals.pNome = "";

      prefs.remove('username');
      prefs.remove('password');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    },
  );

  Widget naoButton = TextButton(
    child: Text("Não", style: TextStyle( color: Colors.black,), ),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  
  AlertDialog alert = AlertDialog(
    title: Text("Deseja sair da conta?"),
    content: Text("Os dados de Login do usuário atual serão perdidos"),
    actions: [
      simButton,
      naoButton,
    ],
  );
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}