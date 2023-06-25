import 'package:bibliotech_flutter/helpers/extensions.dart';

class Livro {
  final int livro_id;
  final String titulo;
  final String subTitulo;
  final String isbn;
  final String autor;
  final String editora;
  final String local;
  final int ano; 

  Livro({
    required this.livro_id, 
    required this.titulo, 
    required this.editora, 
    required this.subTitulo, 
    required this.isbn, 
    required this.autor, 
    required this.local, 
    required this.ano});

  factory Livro.fromMap(Map<String, dynamic> mapa) {
    return Livro(
      livro_id: mapa['id'] ?? '',
      titulo: mapa['titulo'] ?? '',
      subTitulo: mapa['subtitulo'] ?? '',
      isbn: mapa['isbn'] ?? '',
      autor: mapa['autor'] ?? '',
      editora: mapa['editora'] ?? '',
      local: mapa['local'] ?? '',
      ano: mapa['ano'] ?? '',
    );
  }
}