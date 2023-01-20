import 'package:flutter/material.dart';

import 'package:calculadora/screens/controlador.dart';
import 'package:calculadora/screens/tema.dart';
import 'package:calculadora/screens/botones.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BodyScreen extends StatelessWidget {
  BodyScreen({super.key});

  final controller = Get.put(CalculadorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ListaBotones(),
              Expanded(child: Container()),
              Funcion(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Botones(
                    text: 'AC',
                    bgcolor: Color(0xffA5A5A5),
                    onPressed: () => controller.resetAll(),
                  ),
                  Botones(
                      text: '+/-',
                      bgcolor: Color(0xffA5A5A5),
                      onPressed: () => controller.negativoPositivo()),
                  Botones(
                      text: 'Del',
                      bgcolor: Color(0xffA5A5A5),
                      onPressed: () => controller.borrar()),
                  Botones(
                      text: '/',
                      bgcolor: Color(0xffA5A5A5),
                      onPressed: () => controller.operacion('/')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Botones(text: '7', onPressed: () => controller.add('7')),
                  Botones(text: '8', onPressed: () => controller.add('8')),
                  Botones(text: '9', onPressed: () => controller.add('9')),
                  Botones(
                      text: 'X',
                      bgcolor: Color.fromARGB(255, 59, 131, 240),
                      onPressed: () => controller.operacion('X'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Botones(text: '4', onPressed: () => controller.add('4')),
                  Botones(text: '5', onPressed: () => controller.add('5')),
                  Botones(text: '6', onPressed: () => controller.add('6')),
                  Botones(
                      text: '-',
                      bgcolor: Color.fromARGB(255, 59, 131, 240),
                      onPressed: () => controller.operacion('-'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Botones(text: '1', onPressed: () => controller.add('1')),
                  Botones(text: '2', onPressed: () => controller.add('2')),
                  Botones(text: '3', onPressed: () => controller.add('3')),
                  Botones(
                      text: '+',
                      bgcolor: Color.fromARGB(255, 59, 131, 240),
                      onPressed: () => controller.operacion('+')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Botones(
                    text: '0',
                    onPressed: () => controller.add('0'),
                  ),
                  Botones(
                    text: '.',
                    onPressed: () => controller.puntoDecimal(),
                  ),
                  Botones(
                    text: '=',
                    big: true,
                    bgcolor: Color.fromARGB(255, 59, 131, 240),
                    onPressed: () => controller.igual(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    this._themeData = theme;

    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: ListaBotones(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => theme.setTheme(ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.lime,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.lime))),
      ),
    );
  }
}

class ListaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Row(
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.light_mode_rounded),
          onPressed: () => theme.setTheme(ThemeData.light()),
        ),
        FloatingActionButton(
          child: Icon(Icons.dark_mode_outlined),
          onPressed: () => theme.setTheme(ThemeData.dark()),
        ),
      ],
    );
  }
}
