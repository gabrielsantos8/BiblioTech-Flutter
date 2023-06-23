import 'package:flutter/material.dart';
import 'package:bibliotech_flutter/main.dart';
import 'package:bibliotech_flutter/ui/pages/home_page.dart';

ThemeData meuTema() {
  const corPrimaria = Color.fromARGB(255, 0, 173, 239);
  const corPrimariaEscura = Color.fromARGB(255, 56, 113, 193);
  const corPrimariaClara = Color.fromARGB(255, 46, 49, 146);
  const backgroundColor = Color.fromARGB(255, 0, 0, 0);
  const loginColor = Color.fromARGB(255, 255, 255, 255);
  const erroColor = Color.fromARGB(255, 255, 0, 0);

  final inputDecoration = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: corPrimariaEscura, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: corPrimariaClara, width: 3),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final buttonDecoration = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(corPrimaria),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 28, vertical: 18)
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ),
    )
  );

  const appBarDecoration = AppBarTheme(
    color: corPrimaria,
    titleTextStyle: TextStyle(fontSize: 28, color: Color.fromARGB(255, 255, 255, 255)),
    centerTitle: true
  );

  return ThemeData(
    primaryColor: corPrimaria,
    primaryColorDark: corPrimariaEscura,
    primaryColorLight: corPrimariaClara,
    appBarTheme: appBarDecoration,
    inputDecorationTheme: inputDecoration,
    elevatedButtonTheme: buttonDecoration,
    cardColor: backgroundColor,
    focusColor: loginColor,
    hintColor : erroColor
  );
}