

import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class IsarDatasource implements LocalStorageDatasource {
  @override
  Future<bool> isMovieFavorite(int movieId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    throw UnimplementedError();
  }
}