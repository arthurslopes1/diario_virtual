import 'package:diario_virtual/pages/principal.dart';
import 'package:flutter/material.dart';
import 'package:diario_virtual/pages/nota.dart';
import 'package:diario_virtual/globals.dart' as globals;
import 'package:flutter/services.dart';
import 'package:diario_virtual/pages/sobre.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final firestore = FirebaseFirestore.instance;
  @override
  Future<List<dynamic>> fetchLembrete() async {
    //listar no firebase
    globals.vPrincipal = [];
    await FirebaseFirestore.instance.collection("${globals.nTela}").where("UUID", isEqualTo: globals.UUID) .get().then(
      (value) {
        value.docs.forEach(
          (element) {
            final el = element.data();
            globals.vPrincipal.add(new globals.NotaTexto(element.id, el['titulo'], el['texto'], el['data']));
          },
        );
      },
    );
    setState(() {});
  }

  @override
  void initState() {
    fetchLembrete();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            globals.iNota = -1;
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
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 40,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          globals.vPrincipal = [];
                          globals.tela = "";
                          globals.nTela = -1;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Principal(),
                            ),
                          );
                        },
                      ),
                      Text(globals.tela,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      TextButton(
                        child: Icon(
                          Icons.help_outline,
                          size: 40,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          showSobre(context);
                        },
                      ),
                    ],
                  ),
                  /*
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
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "",
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
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(26)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),*/
                  Wrap(
                    spacing: 4.0,
                    runSpacing: 0.0,
                    children: List<Widget>.generate(
                        globals.vPrincipal
                            .length,
                        (int index) {
                      return TextButton(
                        child: Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  globals.vPrincipal[index].titulo,
                                  style: TextStyle(fontSize: 20),
                                ),
                                subtitle: Text(
                                  globals.vPrincipal[index].data.toString(),
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  globals.vPrincipal[index].texto,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          globals.iNota = index;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Nota(),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              )
            ]));
  }
}
