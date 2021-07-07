import 'package:diario_virtual/pages/alertasUsuario.dart';
import 'package:diario_virtual/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:diario_virtual/pages/lista.dart';
import 'package:diario_virtual/globals.dart' as globals;

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertaLogoff(context);
        },
        tooltip: 'Logout',
        backgroundColor: Colors.black,
        child: Icon(Icons.logout),
      ),
      */
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset('imagens/logo.png'),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Bem vindo',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              Text(
                'Por onde deseja começar hoje?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(
                height: 30,
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
                          "Ideias",
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
                      globals.tela = "Ideias";
                      globals.nTela = 1;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lista(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
                          "Opiniões",
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
                      globals.tela = "Opiniões";
                      globals.nTela = 2;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lista(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
                          "Desejos",
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
                      globals.tela = "Desejos";
                      globals.nTela = 3;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lista(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
                          "Experiências",
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
                      globals.tela = "Experiências";
                      globals.nTela = 4;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lista(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]
          )
        ,)
      ,)
    );
  }
}