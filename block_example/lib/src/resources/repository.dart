import 'dart:async';
import 'package:block_example/src/resources/movie_api_provider.dart';
import 'package:block_example/src/models/item_model.dart';

class Repository {
  final movieApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => movieApiProvider.fetchMovieList();
}