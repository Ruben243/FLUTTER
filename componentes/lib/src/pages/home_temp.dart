import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({Key? key}) : super(key: key);
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Componentes Temp"),
      ),
      body: ListView(children: _crearItems()),
    );
  }

  List<Widget> _crearItems() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '*'),
            subtitle: const Text('Subtitulo'),
            leading: const Icon(Icons.account_balance_wallet),
            trailing: const Icon(Icons.arrow_back),
            onTap: () {},
          ),
          Divider(color: Colors.blueAccent.shade700)
        ],
      );
    }).toList();
  }
}
