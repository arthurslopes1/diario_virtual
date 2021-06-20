import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:diario_virtual/globals.dart' as globals;
import 'package:diario_virtual/pages/lista.dart';

class Nota extends StatelessWidget {
  final tituloCont = TextEditingController();
  final textoCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(globals.iNota != -1){
      tituloCont.text = globals.vPrincipal[globals.iNota].titulo;
      textoCont.text = globals.vPrincipal[globals.iNota].texto;
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, 
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'salvar',
            onPressed: () {
              if(globals.iNota != -1){
                globals.vPrincipal[globals.iNota].titulo = tituloCont.text;
                globals.vPrincipal[globals.iNota].texto = textoCont.text;
                globals.vPrincipal[globals.iNota].data = DateTime.now();
              }else{
                globals.vPrincipal.add( new globals.NotaTexto(tituloCont.text, textoCont.text, DateTime.now()));
              }

              globals.iNota = -1;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Lista(),
                ),
              );
            },
            tooltip: 'Salvar',
            backgroundColor: Colors.black,
            child: Icon(Icons.save),
          ),
          SizedBox(
                height: 10,
          ),
          FloatingActionButton(
            heroTag: 'cancelar',
            onPressed: () {
              globals.iNota = -1;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Lista(),
                ),
              );
            },
            tooltip: 'Cancelar',
            backgroundColor: Colors.black,
            child: Icon(Icons.cancel),
          ),
        ]
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
                      globals.iNota = -1;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lista(),
                        ),
                      );
                    },
                  ),
                  Text(
                    globals.tela,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Icon(Icons.more_vert,
                  size: 40,
                  ),
                ],
              ),
              Container(
                height: 40,
                padding: EdgeInsets.only(left: 15, right: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextField(
                    controller: tituloCont,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "",
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
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(26)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Theme(
                data: new ThemeData(
                  primaryColor: Colors.black,
                  primaryColorDark: Colors.black,
                ),
                child: TextField(
                  controller: textoCont,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  maxLines: 30,
                  decoration: new InputDecoration(
                    enabledBorder: new OutlineInputBorder(borderSide: new BorderSide(color: Colors.black, width: 2.0)),
                    border: new OutlineInputBorder(borderSide: new BorderSide(color: Colors.black, width: 4.0)),
                  ),
                )
              ),
            ],
          )
        ]
      )
    );
  }
}