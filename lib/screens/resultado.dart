import 'package:calculadora/screens/botones.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String text;
  const Resultado({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: const TextStyle(fontSize: 40),
      ),
    );
  }
}

class ResultadoFinal extends StatelessWidget {
  final String text;

  const ResultadoFinal({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          text,
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
