import 'package:flutter/material.dart';
import 'package:inmmutable_models_built_value/models/reddit.dart';
import 'package:inmmutable_models_built_value/models/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> _post = [];

  @override
  void initState() {
    super.initState();

    getReddit().then((post) {
      setState(() {
        _post = post;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Reddit Popular Posts')
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getReddit().then((post) {
            setState(() {
              _post = post;
            });
          });
        },
        child: AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          firstChild: Center(
            child: CircularProgressIndicator(),
          ),
          secondChild: ListView(
            children: _buildListTiles(),
          ),
          crossFadeState: _post.isNotEmpty
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
        ),
      ),
    );
  }

  List<Widget> _buildListTiles() {
    return _post.map((post) =>
        ListTile(
          leading: CircleAvatar(
            child: Image.network(
              '${!post.thumbnail.contains(".jpg")
                  ? "https://via.placeholder.com/300"
                  : post.thumbnail}',
              scale: 0.2,
            ),
          ),
          title: Text('Title: ${post.title} by ${post.author}'),
          subtitle: Text(
              'Subreddit: ${post.subreddit} with ${post.ups} upvotes'),
        )).toList();
  }
}
