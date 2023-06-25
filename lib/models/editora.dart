class Editora {
  final int editora_id;
  final String nome;
  final String endereco;
  final String cidade;
  final String uf;
  final String telefone;

  Editora({
    required this.editora_id,
    required this.nome,
    required this.endereco,
    required this.cidade,
    required this.uf,
    required this.telefone,
  });

  factory Editora.fromMap(Map<String, dynamic> mapa) {
    return Editora(
      editora_id: mapa['id'] ?? '',
      nome: mapa['nome'] ?? '',
      endereco: mapa['endereco'] ?? '',
      cidade: mapa['cidade'] ?? '',
      uf: mapa['uf'] ?? '',
      telefone: mapa['telefone'] ?? '',
    );
  }
}
