import 'package:flutter/cupertino.dart';
import 'package:peliculas_api/models/models.dart';
import 'package:peliculas_api/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  final int movieId;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: _size.height * 0.9,
            child: const CupertinoActivityIndicator(),
          );
        }

        final cast = snapshot.data!;
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: _size.height * 0.5,
          child: ListView.builder(
            itemCount: cast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) => _CastCard(actor: cast[index]),
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key, required this.actor}) : super(key: key);
  final Cast actor;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: _size.width * 0.4,
      height: _size.height * 0.9,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                image: NetworkImage(actor.fullProfilePath),
                placeholder: const AssetImage('assets/no-image.jpg'),
                height: _size.height * 0.340,
                width: _size.width * 0.4,
                fit: BoxFit.cover,
              )),
          const SizedBox(height: 4),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
