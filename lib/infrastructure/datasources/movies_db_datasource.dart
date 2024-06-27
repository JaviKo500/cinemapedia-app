

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/movie_db/movie_db_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MoviesDbDatasource extends MoviesDatasource{
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieDbKey,
      'language': 'es-MX',
    }
  ));

  List<Movie> _jsonToMovies ( Map< String, dynamic > json ) {
     final movieDbResponse = MovieDbResponse.fromJson(json);
    
    final List< Movie > movies = movieDbResponse.results
      .where((movieDb) => movieDb.posterPath.isNotEmpty )
      .map((movieDb) => MovieMapper.movieDbToEntity(movieDb)).toList();
    
    return movies;
  }
  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final  response = await dio.get('/movie/now_playing', 
      queryParameters: {
        'page': page,
      }
    );

    return _jsonToMovies( response.data );
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final  response = await dio.get('/movie/popular', 
      queryParameters: {
        'page': page,
      }
    );
    if (kDebugMode) {
      print(response.data);
    }
    return _jsonToMovies( response.data );
  }
}