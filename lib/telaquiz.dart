import 'package:flutter/material.dart';
import 'teladestino.dart';

class TelaQuiz extends StatefulWidget {
  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class _TelaQuizState extends State<TelaQuiz> {
  int _perguntaAtual = 0;
  int _pontuacao = 0;

  final List<Pergunta> perguntas = [
    Pergunta(
      pergunta: 'Qual o nome desse movimento?',
      respostas: ['Dragon rush', 'Dragon breath', 'Rush Dragon', 'Cross Up'],
      respostaCorreta: 'Dragon rush',
      ImagePath: 'assets/images/dragonrush.gif'
    ),
    Pergunta(
      pergunta: 'Qual o combo mais recomendado a se aprender?',
      respostas: [
        'Combo com começo de golpe fraco',
        'Combo com começo de golpe médio',
        'Combo com começo de golpe forte',
        'Combo com começo de super dash'
      ],
      respostaCorreta: 'Combo com começo de golpe médio',
      ImagePath: 'assets/images/combo.png'
    ),
    Pergunta(
      pergunta: 'Qual personagem tem um ataque especial que possui hitkill?',
      respostas: [
        'Androide 17',
        'Goku ssj',
        'Gogeta ssb',
        'Gogeta ssj4'
      ],
      respostaCorreta: 'Gogeta ssj4',
      ImagePath: 'assets/images/ssj4.png'
    ),
    Pergunta(
      pergunta: 'Qual a assistência que mais dá pressão no jogo?',
      respostas: ['Assistência A', 'Assistência B', 'Assistência C', 'Todas elas'],
      respostaCorreta: 'Assistência C',
      ImagePath: 'assets/images/assis.png'
    ),
    Pergunta(
      pergunta: 'Ao final de cada combo é recomendado finalizar com que ataque?',
      respostas: [
        'Ataque fraco',
        'Ataque médio',
        'Ataque forte',
        'Ki blast'
      ],
      respostaCorreta: 'Ataque forte',
      ImagePath: 'assets/images/final.png'
    ),
  ];

  void _responderPergunta(String resposta) {
    if (perguntas[_perguntaAtual].respostaCorreta == resposta) {
      setState(() {
        _pontuacao++;
      });
    }

    if (_perguntaAtual < perguntas.length - 1) {
      setState(() {
        _perguntaAtual++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaDestino(_pontuacao, perguntas.length, resetQuiz)),
      );
    }
  }

  void resetQuiz() {
    setState(() {
      _perguntaAtual = 0;
      _pontuacao = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      backgroundColor: Color.fromARGB(255, 255, 135, 23),
      body: Container(
        decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fundoquiz.png'),
                    fit: BoxFit.cover
                  ),
                ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              perguntas[_perguntaAtual].ImagePath,
              width: 600, 
              height: 600, 
            ),
             Text(
              'Pergunta ${_perguntaAtual + 1}/${perguntas.length}',
              style: TextStyle(fontSize: 16),
              
            ),
            SizedBox(height: 20),
            Text(
              perguntas[_perguntaAtual].pergunta,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: perguntas[_perguntaAtual].respostas.map((resposta) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _responderPergunta(resposta);
                    },
                    child: Text(resposta),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: TelaQuiz()));
}
class Pergunta {
  final String pergunta;
  final List<String> respostas;
  final String respostaCorreta;
  final String ImagePath;

  Pergunta({
    required this.pergunta,
    required this.respostas,
    required this.respostaCorreta, 
    required this.ImagePath,
  });
}