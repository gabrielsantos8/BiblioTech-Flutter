import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bibliotech_flutter/ui/pages/home_page.dart';
import 'package:bibliotech_flutter/models/aluno.dart';
import 'package:bibliotech_flutter/datasource/remote/aluno_remote.dart';

class LoginPage extends StatelessWidget {
  final raController = TextEditingController();

  Future<Aluno> checkRaExistence(String ra)  {
    AlunoRemote alunoRemote = new AlunoRemote();
    Future<Aluno> aluno = alunoRemote.login(ra);
    return aluno;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text('</BiblioTech>'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                'images/logo.png',
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 200.0),
              child: TextFormField(
                controller: raController,
                style: TextStyle(color: Theme.of(context).focusColor),
                decoration: InputDecoration(
                  labelText: 'RA',
                  labelStyle: TextStyle(color: Theme.of(context).focusColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () async {
                final ra = raController.text;
                Aluno aluno = await checkRaExistence(ra);
                if (aluno.aluno_id > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen(aluno)),
                  );
                } else {
                  return showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Erro'),
                      content: Text(
                        'RA não cadastrado, favor entrar em contato com a bibliotecária.',
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Entrar'),
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}
