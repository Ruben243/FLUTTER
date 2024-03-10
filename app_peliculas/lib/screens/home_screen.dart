import 'package:app_peliculas/api/api.dart';
import 'package:app_peliculas/models/movie.dart';
import 'package:app_peliculas/widgets/moda_slider.dart';
import 'package:app_peliculas/widgets/populares_slider.dart';
import 'package:app_peliculas/widgets/proximas_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> peliculasValoradas;
  late Future<List<Movie>> pelicularPopulares;
  late Future<List<Movie>> peliculasProximas;

  @override
  void initState() {
    super.initState();

    peliculasValoradas = Api().getValoradas();
    pelicularPopulares = Api().getPopulares();
    peliculasProximas = Api().getProximas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        title: Image.asset(
          'assets/flutflix.png',
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Trending Movies',
                    style: GoogleFonts.aBeeZee(fontSize: 25)),
                const SizedBox(height: 8),
                SizedBox(
                  child: FutureBuilder(
                      future: peliculasValoradas,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return PeliculasModa(snapshot: snapshot);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text('Top Rated Movies',
                    style: GoogleFonts.aBeeZee(fontSize: 25)),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  child: FutureBuilder(
                      future: peliculasValoradas,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return Populares(snapshot: snapshot);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text('Upcoming Movies',
                    style: GoogleFonts.aBeeZee(fontSize: 25)),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  child: FutureBuilder(
                      future: peliculasProximas,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return Proximas(snapshot: snapshot);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
