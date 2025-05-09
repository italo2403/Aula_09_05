import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // <- para enviar ao backend
import 'dart:convert';

class Sinal extends StatefulWidget {
  const Sinal({super.key});

  @override
  State<Sinal> createState() => _SinalState();
}

class _SinalState extends State<Sinal> {
  Color corLuz = Colors.transparent;

  // Função para acender luz e notificar o Node.js
  void acenderLuz(Color cor) async {
    setState(() {
      corLuz = cor;
    });

    String corNome = '';
    if (cor == Colors.green) corNome = 'Verde';
    if (cor == Colors.yellow) corNome = 'Amarela';
    if (cor == Colors.red) corNome = 'Vermelha';

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/api/log'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'cor': corNome}),
      );

      if (response.statusCode != 200) {
        print('Erro ao enviar cor: ${response.statusCode}');
      }
    } catch (e) {
      print('Falha na requisição: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Semáforo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Círculo colorido
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: corLuz,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
            ),
          ),
          const SizedBox(height: 40),
          // Botões de cor
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => acenderLuz(Colors.green),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Verde'),
              ),
              ElevatedButton(
                onPressed: () => acenderLuz(Colors.yellow),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                child: const Text('Amarela', style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () => acenderLuz(Colors.red),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Vermelha'),
              ),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/node'),
            child: const Text('Testar conexão com Node.js'),
          ),
        ],
      ),
    );
  }
}
