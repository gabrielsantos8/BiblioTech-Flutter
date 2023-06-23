import 'dart:convert';
import 'package:bibliotech_flutter/ui/widgets/botao_quadrado.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bibliotech_flutter/models/aluno.dart';
import 'package:bibliotech_flutter/datasource/remote/aluno_remote.dart';

class HomeScreen extends StatefulWidget {
final Aluno aluno;

const HomeScreen(this.aluno, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  List<dynamic> books = [];
  

  Future<void> fetchBooks() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/aluno/login/'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        books = data['books'];
      });
    }
  }

  Future<void> fetchReservedBooks() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/aluno/login/'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        books = data['reserved_books'];
      });
    }
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text('</BiblioTech>'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetailsScreen(widget.aluno),
                ),
              );
            },
            color: Theme.of(context).focusColor,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BotaoQuadrado('Todos os Livros',fetchBooks),
                BotaoQuadrado('Livros Reservados', fetchReservedBooks),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  title: Text(
                    book['Titulo'],
                    style: TextStyle(color: Theme.of(context).focusColor),
                  ),
                  subtitle: Text(
                    book['Autor'],
                    style: TextStyle(color: Theme.of(context).focusColor),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StudentDetailsScreen extends StatelessWidget {
  final Aluno? aluno;

  const StudentDetailsScreen(this.aluno, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text('Detalhes do Aluno'),
      ),
      body: Column(
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
    );
  }
}
