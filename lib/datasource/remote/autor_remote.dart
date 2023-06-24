import 'package:bibliotech_flutter/infra/cliente_http.dart';
import 'package:bibliotech_flutter/models/autor.dart';

class AutorRemote {
  final link = "http://localhost:8000/api/autor/";

  Future<Autor> login(String livro) async {
    var dados = await ClienteHttp().getJson(link+'login/');
    Autor autor = Autor.fromMap(dados['dados']);
    return autor;
  }
}