class Aluno {
  final int aluno_id;
  final String nome;
  final String ra;
  final String endereco;
  final String cidade;
  final String uf;
  final String telefone;
  final int curso_id;
  final String curso;

  Aluno({
    required this.aluno_id,
    required this.nome,
    required this.ra,
    required this.endereco,
    required this.cidade,
    required this.uf,
    required this.telefone,
    required this.curso_id,
    required this.curso,
  });

  factory Aluno.fromArray(List<dynamic> mapa) {
    if (mapa.isNotEmpty) {
      return Aluno(
          aluno_id: mapa[0]['id'] ?? '',
          nome: mapa[0]['nome'] ?? '',
          ra: mapa[0]['ra'].toString(),
          endereco: mapa[0]['endereco'] ?? '',
          cidade: mapa[0]['cidade'] ?? '',
          uf: mapa[0]['uf'] ?? '',
          telefone: mapa[0]['telefone'].toString(),
          curso_id: mapa[0]['curso_id'] ?? '',
          curso: mapa[0]['curso'] ?? '');
    }
    return Aluno(
        aluno_id: 0,
        nome: '',
        ra: '',
        endereco: '',
        cidade: '',
        uf: '',
        telefone: '',
        curso_id: 0,
        curso: '');
  }
}
