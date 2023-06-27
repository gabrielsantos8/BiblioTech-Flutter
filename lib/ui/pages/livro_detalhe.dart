import 'package:bibliotech_flutter/datasource/remote/autor_remote.dart';
import 'package:bibliotech_flutter/datasource/remote/editora_remote.dart';
import 'package:bibliotech_flutter/models/autor.dart';
import 'package:bibliotech_flutter/models/editora.dart';
import 'package:flutter/material.dart';
import 'package:bibliotech_flutter/models/livro.dart';

class LivroDetalhes extends StatefulWidget {
  final Livro livro;

  const LivroDetalhes(this.livro, {Key? key}) : super(key: key);

  @override
  State<LivroDetalhes> createState() => _LivroDetalhesState();
}

class _LivroDetalhesState extends State<LivroDetalhes>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Future<Autor> fetchAutor() async {
    AutorRemote autorRemote = AutorRemote();
    Autor autor = await autorRemote.get(widget.livro.autor_id.toString());
    return autor;
  }

  Future<Editora> fetchEditora() async {
    EditoraRemote editoraRemote = EditoraRemote();
    Editora editora =
        await editoraRemote.get(widget.livro.editora_id.toString());
    return editora;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text('Detalhes do Livro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Text(
                        'Título',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        widget.livro.titulo,
                        style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Text(
                        'Sub-Título',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        widget.livro.subTitulo,
                        style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Text(
                        'Ano',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        widget.livro.ano.toString(),
                        style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Text(
                        'ISBN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        widget.livro.isbn,
                        style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Text(
                        'Local',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Text(
                        widget.livro.local,
                        style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Text(
                        'Editora',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TableCell(
                      child: InkWell(
                        child: Text(
                          widget.livro.editora,
                          style: TextStyle(
                            color: Theme.of(context).focusColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () {
                          _mostrarDetalhesEditora(widget.livro.editora_id);
                        },
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Text(
                        'Autor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TableCell(
                      child: InkWell(
                        child: Text(
                          widget.livro.autor,
                          style: TextStyle(
                            color: Theme.of(context).focusColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () {
                          _mostrarDetalhesAutor(widget.livro.autor_id);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDetalhesEditora(int editoraId) async {
    EditoraRemote editoraRemote = EditoraRemote();
    Editora editora = await editoraRemote.get(editoraId.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalhes da Editora'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Nome: ${editora.nome}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Endereço: ${editora.endereco}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Cidade: ${editora.cidade}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'UF: ${editora.uf}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Telefone: ${editora.telefone}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDetalhesAutor(int autorId) async {
    AutorRemote autorRemote = AutorRemote();
    Autor autor = await autorRemote.get(autorId.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalhes do Autor'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Nome: ${autor.nome}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Endereço: ${autor.endereco}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Cidade: ${autor.cidade}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'UF: ${autor.uf}',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Telefone: ${autor.telefone}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
