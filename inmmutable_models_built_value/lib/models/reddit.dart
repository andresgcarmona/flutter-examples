import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reddit.g.dart';

abstract class Reddit implements Built<Reddit, RedditBuilder> {
  Children get data;

  Reddit._();

  static Serializer<Reddit> get serializer => _$redditSerializer;

  factory Reddit([void Function(RedditBuilder) updates]) = _$Reddit;
}

abstract class Children implements Built<Children, ChildrenBuilder> {
  BuiltList<Data> get children;

  Children._();

  static Serializer<Children> get serializer => _$childrenSerializer;

  factory Children([void Function(ChildrenBuilder) updates]) = _$Children;
}

abstract class Data implements Built<Data, DataBuilder> {
  Post get data;

  Data._();

  static Serializer<Data> get serializer => _$dataSerializer;

  factory Data([void Function(DataBuilder) updates]) = _$Data;
}

abstract class Post implements Built<Post, PostBuilder> {
  String get author;

  String get url;

  String get title;

  String get thumbnail;

  String get subreddit;

  int get ups;

  Post._();

  static Serializer<Post> get serializer => _$postSerializer;
  
  factory Post([void Function(PostBuilder) updates]) = _$Post;
}