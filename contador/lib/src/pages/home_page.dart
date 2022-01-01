import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key); //debe ir el primero de todos
  final estiloTexto = const TextStyle(fontSize: 25); //nuevos estilo
  final contador = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Titulo"),
        centerTitle: true, //centra el titulo en android
        foregroundColor: const Color(0xFF245624), //cambia el color por defecto
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text(
              "Numeros de click",
              style: estiloTexto,
            ),
            Text(
              '$contador',
              style:
                  estiloTexto, //cuando cambias esto el const en el widget no hace falta
            ),
          ])),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, //posicion del boton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: const Icon(Icons.add), //icono del boton
      ),
    );
  }
}
