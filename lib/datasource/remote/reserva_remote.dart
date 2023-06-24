import 'package:bibliotech_flutter/infra/cliente_http.dart';
import 'package:bibliotech_flutter/models/reserva.dart';

class ReservaRemote {
  final link = "http://localhost:8000/api/reserva/";

  Future<Reserva> obterReserva() async {
    var dados = await ClienteHttp().getJson(link);
    Reserva reserva = Reserva.fromMap(dados['dados']);
    return reserva;
  }
}
