import 'package:flutter/material.dart';
import 'telainicial.dart';

void main() => runApp(Quiz());


class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromARGB(255, 11, 158, 138)),
      home: TelaInicial(),
    );
  }
}