import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';


class MovieScreen extends ConsumerStatefulWidget {
  static const String name = 'movie-screen';
  final String movieId;
  const MovieScreen ({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  
  @override
  void initState() {
    super.initState();
    ref.read( movieInfoProvider.notifier ).loadMovies( widget.movieId );
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch( movieInfoProvider )[widget.movieId];
    if ( movie == null ) {
      return const Scaffold(
        body:  Center( child:  CircularProgressIndicator() ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Screen ${widget.movieId}',
          style: const TextStyle()
        ),
      ),
    );
  }
}