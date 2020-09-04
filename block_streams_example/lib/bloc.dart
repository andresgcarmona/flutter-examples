import 'dart:async';
import 'package:block_streams_example/model.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final API api;

  // Stream controller.
  ReplaySubject<String> _query = ReplaySubject<String>();

  // Results stream.
  Stream<List<Movie>> _results = Stream.empty();

  Stream<List<Movie>> get results => _results;

  // Log stream.
  Stream<String> _log = Stream.empty();

  Stream<String> get log => _log;

  // Sink for user query.
  Sink<String> get query => _query;

  MovieBloc(this.api) {
    _results = _query.distinct().asyncMap(api.get).asBroadcastStream();

    _log = Observable(results)
        .withLatestFrom(_query.stream, (_, query) => 'Results for $query')
        .asBroadcastStream();
  }

  void dispose() {
    _query.close();
  }
}
