import 'package:flutter/material.dart';

import 'package:contador/src/pages/contador_page.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override //sobreescribimos el metodo build
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
          child: ContadorPage(),
        ));
  }
}
