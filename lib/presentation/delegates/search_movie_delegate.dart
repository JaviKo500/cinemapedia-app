

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback =  Future< List<Movie> > Function( String query );
class SearchMovieDelegate extends SearchDelegate<Movie?> {

  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({ required this.searchMovies });

  @override
  String get searchFieldLabel => 'Search movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        duration: const Duration( milliseconds: 200 ),
        child: IconButton(
          onPressed: () => query = '', 
          icon: const Icon(Icons.clear),
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close( context, null ), 
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text(
        'Results',
        style: TextStyle()
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future:  searchMovies( query ) , 
      initialData: const [],
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieSearchItem( movie: movie, );
          },
        );
      },
    );
  }
  
  
}


class _MovieSearchItem extends StatelessWidget {
  final Movie movie;
  const _MovieSearchItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
      child: Row(
        children: [
          // * image
          SizedBox(
            width: size.width * 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular( 20 ),
              child: Image.network( 
                movie.posterPath,
                loadingBuilder: (context, child, loadingProgress) {
                  return FadeIn(child: child);
                },
              ),
            ),
          ),
          const SizedBox(width: 10,),
          // * desc
          SizedBox(
            width: size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textStyles.titleMedium
                ),
                ( movie.overview.length > 100 )
                ? Text(
                  '${movie.overview.substring( 0, 100)}...',
                  style: const TextStyle()
                )
                : Text(
                  movie.overview,
                  style: const TextStyle()
                ),
                Row(
                  children: [
                    Icon(Icons.star_half_rounded, color: Colors.yellow.shade800,),
                    const SizedBox(width: 5,),
                    Text(
                      HumanFormats.number(movie.voteAverage, 1),
                      style: textStyles.bodyMedium?.copyWith( color: Colors.yellow.shade900, )
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}