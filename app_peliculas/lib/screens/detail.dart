import 'package:app_peliculas/colors.dart';
import 'package:app_peliculas/constants.dart';
import 'package:app_peliculas/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detalles extends StatelessWidget {
  const Detalles({
    super.key,
    required this.movie,
  });

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar.large(
        // ignore: sized_box_for_whitespace
        leading: Container(
          height: 70,
          width: 70,
          margin: const EdgeInsets.only(top: 16, left: 8),
          decoration: BoxDecoration(
              color: Colours.scaffoldBgColor,
              borderRadius: BorderRadius.circular(8)),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded)),
        ),
        backgroundColor: Colours.scaffoldBgColor,
        expandedHeight: 450,
        pinned: true,
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(movie.title,
              style: GoogleFonts.aBeeZee(
                  fontSize: 25, fontWeight: FontWeight.w600)),
          background: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)),
            child: Image.network('${Constants.imagePath}${movie.backdropPath}',
                filterQuality: FilterQuality.high, fit: BoxFit.cover),
          ),
        ),
      ),
      SliverToBoxAdapter(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Overview",
                style: GoogleFonts.belleza(
                    fontSize: 25, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9, right: 8),
            child: Text(movie.overview,
                style: GoogleFonts.openSans(
                    fontSize: 19, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 16),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text("Release date: ",
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        Text(movie.releaseDate,
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text("Rating:",
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        const Icon(Icons.star, color: Colors.amber),
                        Text('${movie.voteAverage.toStringAsFixed(1)}/10')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ))
    ]));
  }
}
