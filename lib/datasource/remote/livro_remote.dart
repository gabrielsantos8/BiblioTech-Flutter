import 'package:bibliotech_flutter/infra/cliente_http.dart';
import 'package:bibliotech_flutter/models/livro.dart';

class LivroRemote {
  final link = "http://localhost:8000/api/livro/";

  Future<List<Livro>> get(String idtipo, String ra) async {
    var dados = await ClienteHttp().getJson(link+'list/'+idtipo+'/'+ra);
    List<dynamic> livros = dados['dados'];
    return livros.map((e)=> Livro.fromMap(e)).toList();
  }
}