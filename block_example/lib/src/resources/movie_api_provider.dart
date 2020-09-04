import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:block_example/src/models/item_model.dart';
import 'package:block_example/src/resources/api_key.dart';

class MovieApiProvider {
  final String url = 'http://api.themoviedb.org/3/movie/popular?api_key=';

  Future<ItemModel> fetchMovieList() async {
    String uri = url + apiKey;

    final response = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load the movie list.');
    }
  }
}
