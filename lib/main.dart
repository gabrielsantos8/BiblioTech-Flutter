import 'package:flutter/material.dart';
import 'ui/pages/home_page.dart';
import 'ui/pages/login_page.dart';
import 'ui/meu_tema.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: meuTema(),
    home: LoginPage(),
  ));
}