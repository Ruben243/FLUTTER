// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  const ContadorPage({Key? key}) : super(key: key);
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final _estiloTexto = const TextStyle(fontSize: 25); //nuevos estilo
  int _contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contador"),
          centerTitle: true, //centra el titulo en android
          foregroundColor:
              const Color(0xFF245624), //cambia el color por defecto
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                "Numeros de click",
                style: _estiloTexto,
              ),
              Text(
                '$_contador',
                style:
                    _estiloTexto, //cuando cambias esto el const en el widget no hace falta
              ),
            ])),
        floatingActionButton: _crearBotones());
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const SizedBox(width: 30.0),
        FloatingActionButton(
            child: const Icon(Icons.exposure_zero), onPressed: _zero),
        const Expanded(child: SizedBox()),
        FloatingActionButton(
            child: const Icon(Icons.remove), onPressed: _restar),
        const SizedBox(width: 5.0),
        FloatingActionButton(child: const Icon(Icons.add), onPressed: _agregar)
      ],
    );
  }

  void _agregar() {
    setState(() => _contador++);
  }

  void _restar() {
    setState(() {
      if (_contador > 0) {
        _contador--;
      }
    });
  }

  void _zero() {
    setState(() {
      _contador = 0;
    });
  }
}
