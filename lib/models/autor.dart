class Autor {
  final int autor_id;
  final String nome;
  final String endereco;
  final String cidade;
  final String uf;
  final String telefone;

  Autor({
    required this.autor_id,
    required this.nome,
    required this.endereco,
    required this.cidade,
    required this.uf,
    required this.telefone,
  });

  factory Autor.fromMap(Map<String, dynamic> mapa) {
    return Autor(
      autor_id: mapa['id'] ?? '',
      nome: mapa['nome'] ?? '',
      endereco: mapa['endereco'] ?? '',
      cidade: mapa['cidade'] ?? '',
      uf: mapa['uf'] ?? '',
      telefone: mapa['telefone'] ?? '',
    );
  }
}
