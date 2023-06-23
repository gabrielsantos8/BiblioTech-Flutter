import 'package:bibliotech_flutter/infra/cliente_http.dart';
import 'package:bibliotech_flutter/models/aluno.dart';

class AlunoRemote {
  final link = "http://localhost:8000/api/aluno/";

  Future<Aluno> login(String ra) async {
    var dados = await ClienteHttp().getJson(link+'login/'+ra);
    Aluno aluno = Aluno.fromArray(dados['dados']);
    return aluno;
  }
}