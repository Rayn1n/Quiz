import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  final int totalPerguntas;
  final int acertos;

  TelaResultado({required this.totalPerguntas, required this.acertos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fim do Quiz!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Você acertou $acertos de $totalPerguntas perguntas.',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Recomeçar'),
            ),
          ],
        ),
      ),
    );
  }
}
