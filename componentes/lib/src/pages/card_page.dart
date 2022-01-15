import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: const Text("Cards components"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            _cardTipo1(),
            const SizedBox(
              height: 30,
            ),
            _cardTipo2(),
            const SizedBox(
              height: 30,
            ),
            _cardTipo1(),
            const SizedBox(
              height: 30,
            ),
            _cardTipo2(),
            const SizedBox(
              height: 30,
            ),
            _cardTipo1(),
            const SizedBox(
              height: 30,
            ),
            _cardTipo2(),
            const SizedBox(
              height: 30,
            ),
            _cardTipo1(),
            const SizedBox(
              height: 30,
            ),
            _cardTipo2(),
          ],
        ));
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.black45,
      borderOnForeground: true,
      child: Column(children: <Widget>[
        const ListTile(
          leading: Icon(Icons.photo_album),
          title: Text(
              "La vida es una historia contada por un idiota, una historia llena de estruendo y furia, que nada significa"),
          subtitle: Text(
              "Esta frase refleja que la historia de nuestra vida solo puede ser contada por nosotros mismos, sin que éste tenga ningún significado ni sentido."),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(onPressed: () {}, child: const Text('Cancel')),
            TextButton(onPressed: () {}, child: const Text('Ok')),
          ],
        )
      ]),
    );
  }

  Widget _cardTipo2() {
    // ignore: avoid_unnecessary_containers
    final card = Container(
      child: Column(
        children: <Widget>[
          const FadeInImage(
              fadeInDuration: Duration(milliseconds: 200),
              height: 250,
              fit: BoxFit.cover,
              placeholder: AssetImage('assests/jar-loading.gif'),
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLcCMf793GCctuuzhfQECxUNo1XSMBNajAOQ&usqp=CAU')),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text('Aloy'),
          ),
        ],
      ),
    );
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ],
        ),
        child:
            ClipRRect(borderRadius: BorderRadius.circular(30.0), child: card));
  }
}
