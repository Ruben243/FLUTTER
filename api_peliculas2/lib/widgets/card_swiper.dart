import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_api/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: _size.height * 0.9,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Swiper(
            itemCount: movies.length,
            layout: SwiperLayout.STACK,
            itemWidth: _size.width * 0.7,
            itemHeight: _size.height * 0.6,
            itemBuilder: (BuildContext context, int index) {
              final movie = movies[index];

              movie.heroId = 'swiper-${movie.id}';
              return GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, 'details', arguments: movie),
                child: Hero(
                  tag: movie.heroId!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                        placeholder: const AssetImage('assets/no-image.jpg'),
                        image: NetworkImage(movie.fullPosterImg),
                        fit: BoxFit.fill),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
