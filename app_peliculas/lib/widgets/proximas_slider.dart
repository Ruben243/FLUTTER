import 'package:app_peliculas/constants.dart';
import 'package:app_peliculas/screens/detail.dart';
import 'package:flutter/material.dart';

class Proximas extends StatelessWidget {
  const Proximas({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int itemIndex) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Detalles(movie: snapshot.data[itemIndex])));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                      height: 300,
                      width: 200,
                      child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                      )),
                ),
              ),
            );
          }),
    );
  }
}
