

import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {

  final MoviesDatasource moviesDatasource;
  
  MoviesRepositoryImpl(
    this.moviesDatasource
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDatasource.getNowPlaying( page: page );
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
     return moviesDatasource.getPopular( page: page );
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return moviesDatasource.getTopRated( page: page );
  }
  
  @override
  Future<List<Movie>> getUpComing({int page = 1}) {
    return moviesDatasource.getUpComing( page: page );
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return moviesDatasource.getMovieById( id );
  }
  
  
}