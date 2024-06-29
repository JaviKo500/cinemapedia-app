import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/movie_db/movie_db.dart';
import 'package:cinemapedia/infrastructure/models/movie_db/moviedb_details.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: movieDb.backdropPath.isNotEmpty 
        ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
        : 'https://static.vecteezy.com/system/resources/previews/008/382/505/original/illustration-of-astronaut-in-space-for-404-website-error-page-not-found-text-cute-template-with-planet-stars-for-poster-banner-or-website-page-vector.jpg',
      genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath: movieDb.posterPath.isNotEmpty 
        ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
        : 'no-poster',
      releaseDate: movieDb.releaseDate,
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount
    );
    static Movie movieDetailsToEntity(MovieDetails movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: movieDb.backdropPath.isNotEmpty 
        ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
        : 'https://static.vecteezy.com/system/resources/previews/008/382/505/original/illustration-of-astronaut-in-space-for-404-website-error-page-not-found-text-cute-template-with-planet-stars-for-poster-banner-or-website-page-vector.jpg',
      genreIds: movieDb.genres.map((e) => e.name ).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath: movieDb.posterPath.isNotEmpty 
        ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
        : 'https://static.vecteezy.com/system/resources/previews/008/382/505/original/illustration-of-astronaut-in-space-for-404-website-error-page-not-found-text-cute-template-with-planet-stars-for-poster-banner-or-website-page-vector.jpg',
      releaseDate: movieDb.releaseDate,
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount
    );
}
