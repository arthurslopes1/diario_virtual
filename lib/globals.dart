library globals;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'dart:io';



String UUID = "";
String tela = "";
int nTela = -1;
String pNome = "Teste";
String username = "";
String password = "";
bool salvo = false;

class NotaTexto {
  String id;
  String titulo;
  String texto;
  String data;

  NotaTexto(String id, String titulo, String texto, String data) {
    this.id = id;
    this.titulo = titulo;
    this.texto = texto;
    this.data = data;
  }
}

int iNota;
List<NotaTexto> vFiltro = [];
List<dynamic> vPrincipal = [];
List vIdeias = [];

void filtrar(String filtro) {
  vFiltro = [];

  vPrincipal.forEach((nota) {
    if (nota.titulo.toLowerCase().contains(filtro.toLowerCase()) ||
        nota.texto.toLowerCase().contains(filtro.toLowerCase()) ||
        nota.data.toString().toLowerCase().contains(filtro.toLowerCase())) {
      vFiltro.add(nota);
    }
  });
}

Future<bool> verificaLogin() async {
  final prefs = await SharedPreferences.getInstance();

  username = prefs.getString('username');
  password = prefs.getString('password');

  if (username == null || password == null) {
    return false;
  } else {
    return true;
  }
}

Future<String> buscaId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }
}