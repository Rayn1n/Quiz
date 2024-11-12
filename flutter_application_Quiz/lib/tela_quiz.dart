import 'package:flutter/material.dart';
import 'tela_final.dart';

class Quiz extends StatefulWidget {
  @override
  _TelaDoQuiz createState() => _TelaDoQuiz();
}

class _TelaDoQuiz extends State<Quiz> {
  int perguntaAtual = 0;
  int perguntaCorreta = 0;

  final List<Map<String, Object>> perguntas = [
    {
      'question': 'Qual tecnica goku aprendeu com Sr. Kaioh em dbz?',
      'options': ['KameHameHa', 'Galick Ho', 'Kaioken', 'Kaiojin'],
      'perguntaCorret': 'KaioKen',
      'image': 'lib/Assets/Q1.jpg',
    },
    {
      'question': 'Contra quem o goku despertou o ssj?',
      'options': ['Vegeta', 'Raditz', 'Freeza', 'Ginyu'],
      'perguntaCorret': 'Freeza',
      'image': 'lib/Assets/Q2.webp',
    },
    {
      'question': 'Quem e o pai de goku?',
      'options': ['Gohan', 'Bardock', 'Kuririn', 'Tao Pai Pai'],
      'perguntaCorret': 'Bardock',
      'image': 'lib/Assets/Q3.jpg',
    },
    {
      'question': 'Qual era o personagem que aremessava um tronco para voar?',
      'options': ['Kame', 'Tien', 'Yamcha', 'Tao Pai Pai'],
      'perguntaCorret': 'Tao Pai Pai',
      'image': 'lib/Assets/Q4.png',
    },
    {
      'question': 'Como gohan despertou o ssj2?',
      'options': ['Com a morte de goku', 'Com a morte do android 16', 'Com a morte do android 17', 'Com a morte do vegeta'],
      'perguntaCorret': 'Com a morte do android 16',
      'image': 'lib/Assets/Q5.webp',
    },
    {
      'question': 'Quais androides cell absolveu para chegar em sua forma perfeita?',
      'options': ['Android 17 e 18', 'Android 16 e 19', 'Android 16 e 17', 'Android 16 e 18'],
      'perguntaCorret': 'Android 17 e 18',
      'image': 'lib/Assets/Q6.webp',
    },
    {
      'question': 'Quem foi o criador de dbz?',
      'options': ['Masashi Kishimoto', 'Akira Toriyama', 'Gege Akutami', 'Eiichiro Oda'],
      'perguntaCorret': 'Akira Toriyama',
      'image': 'lib/Assets/Q7.png',
    },
    {
      'question': 'Em qual planeta goku aprendeu o teletransporte',
      'options': ['Planeta Yardrat', 'Planeta Sadalla', 'Planeta Vegeta', 'Planeta Terra'],
      'perguntaCorret': 'Planeta Yardrat.',
      'image': 'lib/Assets/Q8.webp',
    },
    {
      'question': 'Em que episódio Freeza aparece pela primeira vez?',
      'options': ['Ep. 44', 'Ep. 32', 'Ep. 53', 'Ep. 47'],
      'perguntaCorret': 'Ep. 44',
      'image': 'lib/Assets/Q9.jpg',
    },
    {
      'question': 'Qual o nome da esposa de Bardock ',
      'options': ['Kale', 'Caulifla', 'Jerez', 'Gine'],
      'perguntaCorret': 'Gine',
      'image': 'lib/Assets/Q10.jpg',
    },
    {
      'question': 'Qual o nome da forma animal de Goku?',
      'options': ['Ozaru', 'Tsufurujin', 'Raposa', 'Hirudegarn'],
      'perguntaCorret': 'Ozaru',
      'image': 'lib/Assets/Q11.webp',
    },
  ];

  void verificarPerguntas(String respostaSelecionada) {
    if (respostaSelecionada == perguntas[perguntaAtual]['perguntaCorret']) {
      perguntaCorreta++;
    }

    setState(() {
      if (perguntaAtual < perguntas.length - 1) {
        perguntaAtual++;
      } else {
        // Navega para a TelaFinal ao terminar todas as perguntas
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TelaFinal(
              respostasCorretas: perguntaCorreta,
              totalPerguntas: perguntas.length,
            ),
          ),
        );
      }
    });
  }
@override
Widget build(BuildContext context) {
  final currentQuestion = perguntas[perguntaAtual];

  return Scaffold(
    appBar: AppBar(
      title: Text('Quiz de Conhecimentos Gerais'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (currentQuestion['image'] != null) 
            Image.asset(
              currentQuestion['image'] as String,
              width: 400,
              height: 200,
            ),
          SizedBox(height: 20),
          Text(
            currentQuestion['question'] as String,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ...(currentQuestion['options'] as List<String>).map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ElevatedButton(
                onPressed: () => verificarPerguntas(option),
                child: Text(option, style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    ),
  );
 }
}
