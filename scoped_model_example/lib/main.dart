import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

/// The model which represents the state of the Home widget.
class AppModel extends Model {
  int _count = 0;

  int get count => _count;

  /// Increments count by one.
  void increment() {
    _count++;

    // notifyListeners MUST be called if we want the widget subtree to rebuild.
    notifyListeners();
  }

  /// Decrements count by one.
  void decrement() {
    _count--;

    notifyListeners();
  }
}

// Run the App.
void main() {
  runApp(MyApp());
}

/// Main App Widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scoped Model Example',
      theme: ThemeData.dark(),
      home: HomeTwoCounters(),
    );
  }
}

// Main screen.
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scoped Model Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter'),
            ScopedModelDescendant<AppModel>(builder: (context, child, model) {
              return Text(model.count.toString(),
                  style: Theme.of(context).textTheme.display1);
            })
          ],
        ),
      ),
      // Use ScopedModelDescendant to get access to the AppModel.
      floatingActionButton: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  // Now we have access to model variable and we can call methods on it.
                  onPressed: model.increment,
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: model.decrement,
                ),
              ],
            ),
      ),
    );
  }
}

/// Home widget with two counters.
class HomeTwoCounters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppModel modelOne = AppModel();
    final AppModel modelTwo = AppModel();

    return Scaffold(
        appBar: AppBar(
          title: Text('Example With Two Counters'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // You can put as many ScopedModel as you need in your code, and
              // in the places in the widget tree where you need them.
              ScopedModel<AppModel>(
                  model: modelOne,
                  child: Counter(
                    name: 'App model one',
                  )),
              ScopedModel<AppModel>(
                  model: modelTwo,
                  child: Counter(
                    name: 'App model two',
                  )),
            ],
          ),
        ));
  }
}

/// Counter widget. It has ScopedModelDescendant as local root parent widget.
class Counter extends StatelessWidget {
  /// Receives a string name as a constructor parameter.
  /// so we can visually identify the counter.
  final String name;

  // Add assert to throw compile time exception if the parameter is not provided
  // when constructing the widget.
  Counter({Key key, @required this.name}) : assert(name != null);

  @override
  Widget build(BuildContext context) {
    /// Uses ScopedModelDescendant to get nearest ScopedModel.
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$name'),
              Text(model.count.toString(),
                  style: Theme.of(context).textTheme.display1),
              ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: model.increment,
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: model.decrement,
                  ),
                ],
              )
            ],
          ),
    );
  }
}
