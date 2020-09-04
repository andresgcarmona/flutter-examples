import 'dart:async';
import 'dart:convert';

import 'package:inmmutable_models_built_value/models/reddit.dart';
import 'package:inmmutable_models_built_value/models/serializers.dart';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://www.reddit.com/r/popular/new.json?limit=25';

Future<List<Post>> getReddit() async {
  final response = await http.get(Uri.parse(baseUrl));

  Reddit reddit = serializers.deserializeWith(
      Reddit.serializer, json.decode(response.body));

  return reddit.data.children.map((Data data) => data.data).toList();
}
