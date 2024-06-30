

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/movie_db/credits_response.dart';
import 'package:dio/dio.dart';

class ActorDbDatasource extends ActorsDatasource{
  
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieDbKey,
      'language': 'es-MX',
    }
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final  response = await dio.get('/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(response.data);
    final List<Actor> actors = creditsResponse.cast.map(( cast ) => ActorMapper.castDbToEntity(cast)).toList();
    return actors;
  }

  
}