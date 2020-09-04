import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc_provider/bloc_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<IncrementBloc>(
        creator: (context, _bag) => IncrementBloc(),
        child: MaterialApp(
          title: 'Counter example with streams and bloc.',
          theme: ThemeData.dark(),
          home: CounterPage(),
        ));
  }
}

class IncrementBloc implements Bloc {
  int _counter;

  // Counter controller.
  StreamController<int> _counterController = StreamController<int>();

  // Actions controller. Will control the actions and handle the logic in this BLoC.
  StreamController _actionController = StreamController();

  StreamSink<int> get _add => _counterController.sink;

  Stream<int> get counter => _counterController.stream;

  // The sink (entry point) for the actions controller (the logic controller).
  StreamSink get incrementCounter => _actionController.sink;

  IncrementBloc() {
    _counter = 0;

    // Automatically listen to any incoming event when the BLoC is constructed.
    _actionController.stream.listen(_handleLogic);
  }

  @override
  void dispose() {
    _counterController.close();
    _actionController.close();
  }

  void _handleLogic(event) {
    _counter = _counter + 1;
    _add.add(_counter);
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  IncrementBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<IncrementBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Counter with Streams & BLoC.')),
      body: Center(
        child: StreamBuilder<int>(
            stream: bloc.counter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('You hit me ${snapshot.data} times.',
                  style: TextStyle(fontSize: 24.0));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bloc.incrementCounter.add(null);
        },
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }


}
