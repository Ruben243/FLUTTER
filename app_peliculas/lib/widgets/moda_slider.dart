import 'package:app_peliculas/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:app_peliculas/screens/detail.dart';

class PeliculasModa extends StatelessWidget {
  const PeliculasModa({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data.length,
        options: CarouselOptions(
            aspectRatio: 16 / 9,
            height: 300,
            autoPlay: true,
            viewportFraction: 0.55,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            autoPlayAnimationDuration: const Duration(seconds: 1)),
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Detalles(movie: snapshot.data[itemIndex])));
              },
              child: Image.network(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
              ));
        },
      ),
    );
  }
}
