import 'package:block_streams_example/model.dart';
import 'package:block_streams_example/bloc.dart';
import 'package:flutter/widgets.dart';

class MovieProvider extends InheritedWidget {
  final MovieBloc movieBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MovieBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MovieProvider) as MovieProvider)
          .movieBloc;

  MovieProvider({Key key, MovieBloc movieBlock, Widget child})
      : this.movieBloc = movieBlock ?? MovieBloc(API()),
        super(child: child, key: key);
}
