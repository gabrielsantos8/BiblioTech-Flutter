import 'package:bibliotech_flutter/infra/cliente_http.dart';
import 'package:bibliotech_flutter/models/editora.dart';

class EditoraRemote {
  final link = "http://localhost:8000/api/editora/";

  Future<Editora> obterEditora() async {
    var dados = await ClienteHttp().getJson(link);
    Editora editora = Editora.fromMap(dados['dados']);
    return editora;
  }
}
