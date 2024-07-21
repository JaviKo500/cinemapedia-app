import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider = StateNotifierProvider< StorageMoviesProvider, Map<int, Movie> >((ref) {
  final localStorageRepository = ref.watch( localStorageRepositoryProvider );
  return StorageMoviesProvider(localStorageRepository: localStorageRepository);
});



class StorageMoviesProvider extends StateNotifier< Map<int, Movie> >{
  
  int page = 0;
  final LocalStorageRepositoryImpl localStorageRepository;
  
  StorageMoviesProvider({
    required this.localStorageRepository
  }): super( {} );
  
  Future< List<Movie> > loadNextPage () async {
    final  movies = await localStorageRepository.loadMovies(
      offset: page * 12,
    );
    page++;

    final  tempMoviesMap = < int, Movie > {};
    for (Movie movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }
    state = { ...state, ...tempMoviesMap };
    return movies;
  }

  
}