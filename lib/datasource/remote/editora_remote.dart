import 'package:bibliotech_flutter/infra/cliente_http.dart';
import 'package:bibliotech_flutter/models/editora.dart';

class EditoraRemote {
  final link = "http://localhost:8000/api/editora/";

  Future<Editora> get(String editora_id) async {
    var dados = await ClienteHttp().getJson(link+'show/'+editora_id);
    Editora editora = Editora.fromMap(dados['dados']);
    return editora;
  }
}
