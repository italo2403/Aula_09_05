import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NodePage extends StatefulWidget {
  const NodePage({super.key});

  @override
  State<NodePage> createState() => _NodePageState();
}

class _NodePageState extends State<NodePage> {
  String resposta = 'Clique no botão para testar o Node.js';

  Future<void> chamarApi() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/api/mensagem'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          resposta = data['mensagem'];
        });
      } else {
        setState(() {
          resposta = 'Erro ao conectar com o servidor';
        });
      }
    } catch (e) {
      setState(() {
        resposta = 'Erro: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Testar Node.js')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(resposta, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: chamarApi,
              child: const Text('Chamar API Node.js'),
            ),
          ],
        ),
      ),
    );
  }
}
