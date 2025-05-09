import 'package:flutter/material.dart';
import './telas/sinal.dart';
import './telas/node.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
  title: 'App Login Flutter',
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
  '/': (context) => const Sinal(),
  '/node': (context) => const NodePage(),
},
);

  }
}