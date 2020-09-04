import 'package:flutter/material.dart';

import 'package:block_streams_example/provider.dart';
import 'package:block_streams_example/model.dart';
import 'package:block_streams_example/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MovieProvider(
      movieBlock: MovieBloc(API()),
      child: MaterialApp(
        title: 'Block - Streams Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieBloc = MovieProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Bloc - Streams example.')),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: movieBloc.query.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search for a Movie',
              ),
            ),
          ),
          StreamBuilder(
            stream: movieBloc.log,
            builder: (BuildContext context, snapshot) => Container(
                  child: Text(snapshot?.data ?? ''),
                ),
          ),
          Flexible(
            child: StreamBuilder(
              stream: movieBloc.results,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            child: Image.network(
                                'https://image.tmdb.org/t/p/w92${snapshot.data[index].posterPath}'),
                          ),
                          title: Text(snapshot.data[index].title),
                          subtitle: Text(snapshot.data[index].overview),
                        ));
              },
            ),
          )
        ],
      ),
    );
  }
}
