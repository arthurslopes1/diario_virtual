import 'package:flutter/material.dart';

showSobre(BuildContext context) 
{ 
  
  Widget okButton = TextButton(
    child: Text("OK", style: TextStyle( color: Colors.black,), ),
    onPressed: () { 
      Navigator.pop(context);
    },
  );
  
  AlertDialog alerta = AlertDialog(
    title: Text("Sobre o App", textAlign: TextAlign.center, ),
    content: Text("Aplicativos Mobile \n UCL 2021/1 \n \n Desenvolvedores: \n Arthur Serrano Lopes \n Elielson Oliveira \n Enivaldo Silva Pinheiro \n Lauro Valentim \n \n \n"
    "A intenção do grupo SMART é criar um diário digital, para que as pessoas possam escrever seus registros diários, suas alegrias, angústias e dores, podendo até mesmo criar planejamentos e definir metas diárias e semanais a serem cumpridas e as deixando registradas em um lugar de fácil acesso.", textAlign: TextAlign.center,),
    actions: [
      okButton,
    ],
  );
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}