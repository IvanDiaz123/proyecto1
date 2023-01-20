import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Botones extends StatelessWidget {
  final Color bgcolor;
  final String text;
  final bool big;

  final Function onPressed;

  Botones(
      {Key? key,
      required this.text,
      required this.onPressed,
      bgcolor,
      this.big = false})
      : this.bgcolor = bgcolor ?? Color(0xff333333),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final boton = TextButton.styleFrom(
        backgroundColor: bgcolor,
        primary: Colors.white,
        shape: StadiumBorder());

    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 1, left: 3),
      child: TextButton(
        style: boton,
        child: Container(
          width: this.big ? 150 : 65,
          height: 65,
          child: Center(
            child: Text(
              this.text,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
          ),
        ),
        onPressed: () => this.onPressed(),
      ),
    );
  }
}

class Linea extends StatelessWidget {
  const Linea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2,
      color: Colors.black,
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }
}
