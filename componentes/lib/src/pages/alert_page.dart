import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alert page"), centerTitle: true),
      body: Center(
        child: ElevatedButton(
          child: const Text("Mostrar boton"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                const StadiumBorder()),
          ),
          onPressed: () => _mostarAlerta(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.backup),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: const Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text('Este es el contenido de la caja de la alerta'),
                FlutterLogo(size: 100.0),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Ok',
                      style: TextStyle(color: Colors.green, fontSize: 20))),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  )),
            ],
          );
        });
  }
}
