import 'package:flutter/material.dart';
import 'package:componentes/Widgets/widgets.dart';

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
          children: const <Widget>[
            CustomCardType1(),
            SizedBox(
              height: 30,
            ),
            CustomCardType2(name: 'Aloy equipamiento', imageUrl: '''
https://1.bp.blogspot.com/-WD6AsHOR2sY/YVICnM2sZ-I/AAAAAAAAv0Y/
vl0GcR4e6cwwTu5mL95IY2lAvR75bdqngCLcBGAsYHQ/s1212/
horizon%2Bforbidden%2Bwest%2Baloy.jpg'''),
            SizedBox(
              height: 30,
            ),
            CustomCardType1(),
            SizedBox(
              height: 30,
            ),
            CustomCardType2(
              imageUrl: 'https://i.ytimg.com/vi/GoqEag-nK4k/maxresdefault.jpg',
            ),
            SizedBox(
              height: 30,
            ),
            CustomCardType1(),
            SizedBox(
              height: 30,
            ),
            CustomCardType2(
              imageUrl:
                  'https://as01.epimg.net/meristation/imagenes/2020/08/06/analisis/1596722220_968180_1596723980_miniatura_normal.jpg',
            ),
            SizedBox(
              height: 30,
            ),
            CustomCardType1(),
            SizedBox(
              height: 30,
            ),
            CustomCardType2(
              imageUrl:
                  'https://blog.es.playstation.com/tachyon/sites/14/2021/09/01c70cd81de634d3a1932a9719883e1d672ddd88-scaled.jpg?resize=1088%2C612&crop_strategy=smart&zoom=1.5',
            ),
          ],
        ));
  }
}
