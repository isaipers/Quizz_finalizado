import 'package:flutter/material.dart';
import 'telaquiz.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Inicial'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/teladefundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5), 
                    borderRadius: BorderRadius.circular(5.0), 
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: const Text(
                    'Quiz sobre Dragon Ball FighterZ',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaQuiz()),
                  );
                },
                child: const Text('Pressione para começar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
