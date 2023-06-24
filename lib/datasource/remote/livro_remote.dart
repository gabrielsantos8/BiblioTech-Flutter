import 'package:bibliotech_flutter/infra/cliente_http.dart';
import 'package:bibliotech_flutter/models/livro.dart';

class LivroRemote {
  final link = "http://localhost:8000/api/aluno/login/11954";

  Future<Livro> login(String livro) async {
    var dados = await ClienteHttp().getJson(link+'login/');
    Livro livro = Livro.fromMap(dados['dados']);
    return livro;
  }
}