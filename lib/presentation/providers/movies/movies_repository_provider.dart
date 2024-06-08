import 'package:cinemapedia/infrastructure/datasources/movies_db_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movies_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// * this repository is immutable
final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl( MoviesDbDatasource() );
});