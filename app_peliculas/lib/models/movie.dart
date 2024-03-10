class Movie {
  String title;
  String backdropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  Movie({
    required this.title,
    required this.backdropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"] as String,
        backdropPath: json["backdrop_path"] as String,
        originalTitle: json["original_title"] as String,
        overview: json["overview"] as String,
        posterPath: json["poster_path"] as String,
        releaseDate: json["release_date"] as String,
        voteAverage: json["vote_average"].toDouble());
  }
}
