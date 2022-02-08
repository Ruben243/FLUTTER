// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  final options = const ['Predator', 'Alien', 'Terminator', 'StormTrooper'];
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView tipo 1'),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          trailing: const Icon(
            Icons.arrow_forward_ios_sharp,
          ),
          onTap: () {},
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
