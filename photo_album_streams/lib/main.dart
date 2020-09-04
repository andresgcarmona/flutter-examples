import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Streamer',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PhotoList(),
    );
  }
}

class Photo {
  final String title;
  final String url;

  Photo.fromJson(Map map)
      : title = map['title'],
        url = map['url'];
}

class PhotoList extends StatefulWidget {
  @override
  _PhotoListState createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  StreamController<Photo> streamController;
  List<Photo> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Photo Streams')),
        body: Center(
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  _builItem(index)),
        ));
  }

  @override
  void initState() {
    super.initState();

    streamController = StreamController.broadcast();
    streamController.stream.listen((p) {
      setState(() {
        list.add(p);
      });
    });

    load(streamController);
  }

  void load(StreamController<Photo> streamController) async {
    print('Loading images...');

    String url = 'https://jsonplaceholder.typicode.com/photos';

    http.Client client = http.Client();

    http.Request req = http.Request('get', Uri.parse(url));

    var response = await client.send(req);

    print(response.contentLength);

    response.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((e) => e)
        .map((map) => Photo.fromJson(map))
        .pipe(streamController);
  }

  @override
  void dispose() {
    streamController?.close();
    streamController = null;

    super.dispose();
  }

  Widget _builItem(int index) {
    if (index >= list.length) {
      return null;
    }

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(list[index].url),
          Text(list[index].title),
        ],
      ),
    );
  }
}
