import 'package:flutter/material.dart';

class TelaDestino extends StatelessWidget {
  final int pontuacao;
  final int totalPerguntas;
  final Function resetQuiz;

  TelaDestino(this.pontuacao, this.totalPerguntas,this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela de Resultado')),
      backgroundColor: Color.fromARGB(255, 255, 135, 23),
        body: Container(
          decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fim.png'),
                    fit: BoxFit.cover
                  ),
                ),
         child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Fim do quiz', style: TextStyle(fontSize: 24,  color: Color.fromARGB(255, 255, 255, 255)),
          ),
          
          SizedBox(height: 20),
          Text('Pontuacao: $pontuacao de $totalPerguntas',
           style: TextStyle(fontSize: 20,  color: Color.fromARGB(255, 255, 255, 255))
           ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            resetQuiz();
            Navigator.pop(context);
          },
          child: Text('Recomecar'))
            ],
        ),
    ),
    ));
  }
}