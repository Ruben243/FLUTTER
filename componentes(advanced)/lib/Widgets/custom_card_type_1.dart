import 'package:flutter/material.dart';
import 'package:componentes/theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.black45,
      borderOnForeground: true,
      child: Column(children: <Widget>[
        const ListTile(
          leading: Icon(Icons.photo_album, color: AppTheme.primary),
          title: Text(
              "La vida es una historia contada por un idiota, una historia llena de estruendo y furia, que nada significa"),
          subtitle: Text(
              "Esta frase refleja que la historia de nuestra vida solo puede ser contada por nosotros mismos, sin que éste tenga ningún significado ni sentido."),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                  style: TextButton.styleFrom(primary: AppTheme.primaryDark)),
              TextButton(
                  onPressed: () {},
                  child: const Text('Ok'),
                  style: TextButton.styleFrom(primary: AppTheme.primary)),
            ],
          ),
        )
      ]),
    );
  }
}
