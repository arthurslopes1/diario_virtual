import 'package:diario_virtual/pages/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:diario_virtual/pages/alertasUsuario.dart';
import 'package:diario_virtual/globals.dart' as globals;
import 'package:diario_virtual/pages/principal.dart';

class Login extends StatelessWidget {
  final loginCont = TextEditingController();
  final senhaCont = TextEditingController();

  void realizarLogin(BuildContext context){
    //Adicionar validação de login
    if(true){
      if(globals.salvo){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Principal(),
          ),
        );
      }else{
        globals.username = loginCont.text;
        globals.password = senhaCont.text;
        showAlertaLogin(context);
      }
    } 
  }

  @override
  Widget build(BuildContext context) {
    globals.verificaLogin().then((value) {
      if(value){
        loginCont.text = globals.username;
        globals.username = null;
        senhaCont.text = globals.password;
        globals.password = null;
        globals.salvo = true;
        realizarLogin(context);
      }
    });

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset('imagens/logo.png'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: loginCont,
              // autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: senhaCont,
              // autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () {
                    realizarLogin(context);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: TextButton(
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}