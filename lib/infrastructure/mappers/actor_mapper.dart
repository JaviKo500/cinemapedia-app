

import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/movie_db/credits_response.dart';

class ActorMapper {
  
  static Actor castDbToEntity( Cast cast ) => Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null 
        ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
        : 'https://static.vecteezy.com/system/resources/previews/008/382/505/original/illustration-of-astronaut-in-space-for-404-website-error-page-not-found-text-cute-template-with-planet-stars-for-poster-banner-or-website-page-vector.jpg',
    character: cast.character,
  ); 
}