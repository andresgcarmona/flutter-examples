import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: StarwarsData(),
  ));
}

class StarwarsData extends StatefulWidget {
  @override
  _StarwarsDataState createState() => _StarwarsDataState();
}

class _StarwarsDataState extends State<StarwarsData> {
  final String url = 'https://swapi.co/api/starships';
  List data = [];

  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var response = json.decode(res.body);

      data = response['results'];
      dev.log(data.length.toString());
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Star Wars Ships'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(data[index]['name']),
              subtitle: Text(data[index]['model']),
            );
          },
        ));
  }

  @override
  void initState() {
    super.initState();

    this.getSWData();
  }
}
