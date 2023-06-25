import 'package:bibliotech_flutter/datasource/remote/livro_remote.dart';
import 'package:bibliotech_flutter/ui/pages/livro_detalhe.dart';
import 'package:bibliotech_flutter/ui/widgets/item_lista.dart';
import 'package:flutter/material.dart';

Widget buildLivrosList(String parameter, String aluno_id) {
    return FutureBuilder(
      future: LivroRemote().get(parameter, aluno_id),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LivroDetalhes(snapshot.data![index]),
                            ),
                          );
                        },
                        child: ItemLista(snapshot.data![index]),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro ao carregar os livros'));
            } else {
              return const Center(child: Text('Nenhum livro encontrado'));
            }
        }
      },
    );
  }