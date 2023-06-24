import 'package:bibliotech_flutter/helpers/extensions.dart';

class Reserva {
  final int reserva_id;
  final String aluno;
  final int livro_id;
  final DateTime dataInicio;
  final DateTime dataFim;
  final String observacao; // Corrigido para tipo String

  Reserva({
    required this.reserva_id,
    required this.aluno,
    required this.livro_id,
    required this.dataInicio,
    required this.dataFim,
    required this.observacao,
  });

  factory Reserva.fromMap(Map<String, dynamic> mapa) {
    return Reserva(
      reserva_id: mapa['reserva_id'] ?? 0, // Defina um valor padrão adequado para int
      aluno: mapa['aluno'] ?? '',
      livro_id: mapa['livro_id'] ?? 0, // Defina um valor padrão adequado para int
      dataInicio: mapa['dataInicio'] ?? DateTime.now(),
      dataFim: mapa['dataFim'] ?? DateTime.now(),
      observacao: mapa['observacao'] ?? '', // Corrigido para tipo String
    );
  }
}
