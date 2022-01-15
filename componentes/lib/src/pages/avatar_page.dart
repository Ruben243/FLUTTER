import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  static const pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avatar page"),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.all(2.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media.fortniteapi.io/images/08a185b938621150e439d0c09891f221/transparent.png'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              child: Text("R"),
              backgroundColor: Colors.pink,
            ),
          ),
        ],
      ),
      body: const Center(
        child: FadeInImage(
            fadeInDuration: Duration(milliseconds: 100),
            fit: BoxFit.cover,
            placeholder: AssetImage('assests/jar-loading.gif'),
            image: NetworkImage(
                'https://static.wikia.nocookie.net/horizon-zero-dawn/images/2/24/Aloy_FW.png/revision/latest?cb=20211230003003&path-prefix=es')),
      ),
    );
  }
}
