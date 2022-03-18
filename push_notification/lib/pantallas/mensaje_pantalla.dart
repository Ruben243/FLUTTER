import 'package:flutter/material.dart';

class MensajeScreen extends StatelessWidget {
  const MensajeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensaje Screen'),
      ),
      body: Center(
        child: Text('$args', style: const TextStyle(fontSize: 30)),
      ),
    );
  }
}
