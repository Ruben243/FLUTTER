// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:async';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  // ignore: unused_field
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List "),
      ),
      body: Stack(
        children: <Widget>[_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: const EdgeInsets.only(top: 10),
              child: FadeInImage(
                fadeInDuration: const Duration(milliseconds: 200),
                fit: BoxFit.cover,
                placeholder: const AssetImage("assests/jar-loading.gif"),
                image: NetworkImage(
                    "https://picsum.photos/500/300?image=${index + 1}"),
              ));
        },
      ),
    );
  }

  Future<void> obtenerPagina1() async {
    const duration = Duration(seconds: 2);
    Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  void respuestaHttp() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(microseconds: 250),
    );
    _agregar10();
  }

  Future<Timer> fetchData() async {
    _isLoading = true;
    setState(() {});
    const duracion = Duration(seconds: 2);

    return Timer(duracion, respuestaHttp);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(
            height: 15,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
