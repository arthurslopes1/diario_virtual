library globals;

String tela = "";
int nTela = -1;
String pNome = "Teste";

class NotaTexto {
  String titulo;
  String texto;
  DateTime data;
  
  NotaTexto(String titulo, String texto, DateTime data) {
    this.titulo = titulo;
    this.texto = texto;
    this.data = data;
  }
}

int iNota;
List<NotaTexto> vFiltro = [];
List<NotaTexto> vPrincipal = [];
List<NotaTexto> vIdeias = [new NotaTexto("Ideias 1", "Teste de texto da nota de ideias 1", DateTime.parse("2021-06-12 20:18:04")),
                      new NotaTexto("Ideias 2", "Teste de texto da nota de ideias 2", DateTime.parse("2021-06-14 16:32:04")),
                      new NotaTexto("Ideias 3", "Teste de texto da nota de ideias 3", DateTime.parse("2021-06-14 16:32:04")),
                      new NotaTexto("Ideias 4", "Teste de texto da nota de ideias 4", DateTime.parse("2021-06-14 16:32:04")),
                      new NotaTexto("Ideias 5", "Teste de texto da nota de ideias 5", DateTime.parse("2021-06-14 16:32:04")),
                      new NotaTexto("Ideias 6", "Teste de texto da nota de ideias 6", DateTime.parse("2021-06-14 16:32:04"))];

List<NotaTexto> vOpinioes = [new NotaTexto("Opinioes 1", "Teste de texto da nota de Opinioes 1", DateTime.parse("2021-06-12 20:18:04")),
                      new NotaTexto("Opinioes 2", "Teste de texto da nota de Opinioes 2", DateTime.parse("2021-06-14 16:32:04"))];
                      
List<NotaTexto> vDesejos= [new NotaTexto("Desejos 1", "Teste de texto da nota de Desejos 1", DateTime.parse("2021-06-12 20:18:04")),
                      new NotaTexto("Desejos 2", "Teste de texto da nota de Desejos 2", DateTime.parse("2021-06-14 16:32:04"))];

List<NotaTexto> vExperiencias= [new NotaTexto("Experiencias 1", "Teste de texto da nota de Experiencias 1", DateTime.parse("2021-06-12 20:18:04")),
                      new NotaTexto("Experiencias 2", "Teste de texto da nota de Experiencias 2", DateTime.parse("2021-06-14 16:32:04"))];

void filtrar(String filtro) {
  vFiltro = [];

  vPrincipal.forEach((nota) {
    if(nota.titulo.toLowerCase().contains(filtro.toLowerCase()) ||
       nota.texto.toLowerCase().contains(filtro.toLowerCase()) ||
       nota.data.toString().toLowerCase().contains(filtro.toLowerCase())){
      
      vFiltro.add(nota);

    }
  });
}