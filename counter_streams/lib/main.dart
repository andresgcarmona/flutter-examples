import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter with stream',
      theme: ThemeData.dark(),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  final StreamController<int> _controller = StreamController<int>();

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream version of Counter App'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _controller.stream,
          initialData: _counter,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('You hit me: ${snapshot.data} times.', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal),);
          },
        ),
      ),
      floatingActionButton: ButtonBar(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            // Now we have access to model variable and we can call methods on it.
            onPressed: () {
              _controller.sink.add(++_counter);
            }
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              _controller.sink.add(--_counter);
            }
          ),
        ],
      ),
    );
  }
}
