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
      'question': 'Qual é a capital do Brasil?',
      'options': ['Rio de Janeiro', 'Brasília', 'São Paulo', 'Salvador'],
      'perguntaCorret': 'Brasília',
    },
    {
      'question': 'Qual é a maior floresta tropical do mundo?',
      'options': [
        'Floresta Amazônica',
        'Floresta Negra',
        'Floresta de Bialowieza',
        'Floresta Boreal'
      ],
      'perguntaCorret': 'Floresta Amazônica',
    },
    {
      'question': 'Qual é o planeta mais próximo do Sol?',
      'options': ['Terra', 'Vênus', 'Marte', 'Mercúrio'],
      'perguntaCorret': 'Mercúrio',
    },
    {
      'question': 'Em que ano o homem pisou na Lua pela primeira vez?',
      'options': ['1959', '1969', '1979', '1989'],
      'perguntaCorret': '1969',
    },
    {
      'question': 'Qual a composição da água?',
      'options': ['Composto BioOrganico', 'H2o', 'Composto Inorgânico', 'Composto Organico'],
      'perguntaCorret': 'Composto Inorgânico',
    },
    {
      'question': 'Quantos ossos tem no corpo humano?',
      'options': ['206', '200', '190', '220'],
      'perguntaCorret': '206',
    },
    {
      'question': 'Onde os animes foram criados?',
      'options': ['Brasil', 'Coreia', 'China', 'Japão'],
      'perguntaCorret': 'Japão',
    },
    {
      'question': 'Qual a idade aproximada do planeta terra?',
      'options': ['5 Bilhões de anos', '4,5 Bilhões de anos', '4 Bilhões de anos', '3,5 Bilhões de anos'],
      'perguntaCorret': '4,5 Bilhões de anos',
    },
    {
      'question': 'Quem foi o primeiro humano a pisar na lua?',
      'options': ['Donald Alden Armstrong', 'Neil Alden Armstrong', 'Neil Alden ArmWeak', 'Joey Armstrong'],
      'perguntaCorret': 'Neil Alden Armstrong',
    },
    {
      'question': 'Quanto e 1 com 1?',
      'options': ['11', '1', '2', '10'],
      'perguntaCorret': '11',
    },
    {
      'question': '1+1 = 2?',
      'options': ['Verdadeiro', 'Falso'],
      'perguntaCorret': 'Verdadeiro',
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
            Image.asset('lib/Assets/TelaQuiz.jpg', height: 300),
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
