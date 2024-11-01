import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String displayText = 'Pressione o botão!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Aplicação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Minha Aplicação'),
        ),
        body: Center(
          child: Text(displayText),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              displayText = 'Olá, mundo!';
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
