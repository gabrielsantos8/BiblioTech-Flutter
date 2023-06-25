class Livro {
  final int livro_id;
  final String titulo;
  final String subTitulo;
  final String isbn;
  final String autor;
  final int autor_id;
  final String editora;
  final int editora_id;
  final String local;
  final int ano; 

  Livro({
    required this.livro_id, 
    required this.titulo, 
    required this.editora, 
    required this.editora_id,
    required this.subTitulo, 
    required this.isbn, 
    required this.autor, 
    required this.autor_id,
    required this.local, 
    required this.ano});

  factory Livro.fromMap(Map<String, dynamic> mapa) {
    return Livro(
      livro_id: mapa['id'] ?? '',
      titulo: mapa['titulo'] ?? '',
      subTitulo: mapa['subtitulo'] ?? '',
      isbn: mapa['isbn'] ?? '',
      autor_id: mapa['autor_id'] ?? '',
      autor: mapa['autor'] ?? '',
      editora: mapa['editora'] ?? '',
      editora_id: mapa['editora_id'] ?? '',
      local: mapa['local'] ?? '',
      ano: mapa['ano'] ?? '',
    );
  }
}