import 'package:calculadora/screens/resultado.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'botones.dart';

class CalculadorController extends GetxController {
  var primerNumero = '0'.obs;
  var segundoNumero = '0'.obs;
  var solucion = '0'.obs;
  var operativo = '+'.obs;

  resetAll() {
    primerNumero.value = '0';
    segundoNumero.value = '0';
    solucion.value = '0';
    operativo.value = '+';
  }

  negativoPositivo() {
    if (solucion.startsWith('-')) {
      solucion.value = solucion.value.replaceAll('-', '');
    } else {
      solucion.value = '-' + solucion.value;
    }
  }

  add(String number) {
    if (solucion.value == '0') return solucion.value = number;

    if (solucion.value == '-0') {
      return solucion.value = '-' + number;
    }
    solucion.value = solucion.value + number;
  }

  puntoDecimal() {
    if (solucion.contains('.')) return;
    if (solucion.startsWith('0')) {
      solucion.value = '0.';
    } else {
      solucion.value = solucion.value + '.';
    }
  }

  operacion(String nuevaOperacion) {
    operativo.value = nuevaOperacion;
    primerNumero.value = solucion.value;
    solucion.value = '0';
  }

  borrar() {
    if (solucion.value.replaceAll('-', '').length > 1) {
      solucion.value = solucion.value.substring(0, solucion.value.length - 1);
    } else {
      solucion.value = '0';
    }
  }

  igual() {
    double num1 = double.parse(primerNumero.value);
    double num2 = double.parse(solucion.value);

    segundoNumero.value = solucion.value;

    switch (operativo.value) {
      case '+':
        solucion.value = '${num1 + num2}';
        break;

      case '-':
        solucion.value = '${num1 - num2}';
        break;

      case '/':
        solucion.value = '${num1 / num2}';
        break;

      case 'X':
        solucion.value = '${num1 * num2}';
        break;

      default:
        return;
    }
    if (solucion.value.endsWith('.0')) {
      solucion.value = solucion.value.substring(0, solucion.value.length - 2);
    }
  }
}

class Funcion extends StatelessWidget {
  Funcion({super.key});
  final controller = Get.find<CalculadorController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Resultado(text: '${controller.primerNumero}'),
            Resultado(text: '${controller.operativo}'),
            Resultado(text: '${controller.segundoNumero}'),
            Linea(),
            ResultadoFinal(text: '${controller.solucion}'),
          ],
        ));
  }
}
