import 'package:flutter/material.dart';

class BotaoQuadrado extends StatelessWidget {
  final String titulo;
  final VoidCallback clique;

  const BotaoQuadrado(this.titulo, this.clique, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: clique,
      child: Text (titulo),
    );
  }
}