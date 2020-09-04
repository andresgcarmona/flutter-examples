import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_example_two/models/user.dart';

void main() => runApp(MyApp(user: User()));

class MyApp extends StatelessWidget {
  final User user;

  const MyApp({Key key, this.user}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<User>(
        model: user,
        child: MaterialApp(
          title: 'Scoped Model Example Two',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        )
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scoped Model Example')),
      body: Center(
        child: ScopedModelDescendant<User>(
            builder: (context, child, model) =>
                Text(
                  model.name,
                  style: Theme
                      .of(context)
                      .textTheme
                      .title,
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>
                ChangeNamePage())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class ChangeNamePage extends StatefulWidget {
  @override
  _ChangeNamePageState createState() => _ChangeNamePageState();
}

class _ChangeNamePageState extends State<ChangeNamePage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change name'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ScopedModelDescendant<User>(
          builder: (context, child, model) =>
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: model.name,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      model.changeName(_nameController.text);

                      setState(() {
                        _nameController.text = '';
                      });

                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Name changed to ${model.name}')));
                    },
                    child: Text('Change name'),
                  )
                ],
              ),
        ),
      ),
    );
  }
}
