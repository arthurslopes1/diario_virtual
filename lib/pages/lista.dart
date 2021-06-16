import 'package:diario_virtual/pages/principal.dart';
import 'package:flutter/material.dart';
import 'package:diario_virtual/pages/nota.dart';
import 'package:diario_virtual/globals.dart' as globals;

class Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Nota(),
            ),
          );
        },
        tooltip: 'Adicionar Nota',
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 25, left: 10, right: 10),      
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    child: Icon(Icons.arrow_back_rounded, size: 40, color: Colors.black,),
                    onPressed: () {
                      globals.tela = -1;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Principal(),
                        ),
                      );
                    },
                  ),
                  Icon(Icons.more_vert,
                  size: 40,
                  ),
                ],
              ),
              Container(
                height: 43,
                padding: EdgeInsets.only(left: 15,),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Procurar Anotações",
                      icon: Icon(Icons.search, color: Colors.white,),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        decorationColor: Colors.white,
                        backgroundColor: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      enabledBorder: UnderlineInputBorder(      
                        borderSide: BorderSide(color: Colors.transparent),   
                      ),  
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ]
      )
    );
  }
}