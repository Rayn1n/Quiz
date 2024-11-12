import 'package:flutter/material.dart';
import 'tela_inicial.dart';

class TelaFinal extends StatelessWidget {
  final int respostasCorretas;
  final int totalPerguntas;

  TelaFinal({required this.respostasCorretas, required this.totalPerguntas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do Quiz'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/Assets/TelaFinal.jpg', height: 200,),
              Text(
                'Parabéns por concluir o quiz!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Você acertou $respostasCorretas de $totalPerguntas perguntas.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Volta para a tela inicial para reiniciar o quiz
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => TelaInicial()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text('Recomeçar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
