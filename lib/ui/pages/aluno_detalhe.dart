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
                'Nome:',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${aluno?.nome}',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'RA:',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${aluno?.ra}',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Endereço:',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${aluno?.endereco}',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Cidade:',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${aluno?.cidade}',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'UF:',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${aluno?.uf}',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Telefone:',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${aluno?.telefone}',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Curso:',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${aluno?.curso}',
                style: TextStyle(
                  color: Theme.of(context).focusColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
