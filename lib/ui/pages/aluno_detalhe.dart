import 'package:flutter/material.dart';
import 'package:bibliotech_flutter/models/aluno.dart';

class AlunoDetalhe extends StatelessWidget {
  final Aluno? aluno;

  const AlunoDetalhe(this.aluno, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text('Detalhes do Aluno'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Nome: ${aluno?.nome}',
                style: TextStyle(color: Theme.of(context).focusColor),
              ),
              subtitle: Text(
                'RA: ${aluno?.ra}',
                style: TextStyle(color: Theme.of(context).focusColor),
              ),
            ),
            ListTile(
              title: Text(
                'Endereço: ${aluno?.endereco}',
                style: TextStyle(color: Theme.of(context).focusColor),
              ),
              subtitle: Text(
                'Cidade: ${aluno?.cidade}, UF: ${aluno?.uf}',
                style: TextStyle(color: Theme.of(context).focusColor),
              ),
            ),
            ListTile(
              title: Text(
                'Telefone: ${aluno?.telefone}',
                style: TextStyle(color: Theme.of(context).focusColor),
              ),
            ),
            ListTile(
              title: Text(
                'Curso: ${aluno?.curso}',
                style: TextStyle(color: Theme.of(context).focusColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
