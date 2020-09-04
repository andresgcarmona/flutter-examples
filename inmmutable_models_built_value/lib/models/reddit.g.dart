// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Reddit> _$redditSerializer = new _$RedditSerializer();
Serializer<Children> _$childrenSerializer = new _$ChildrenSerializer();
Serializer<Data> _$dataSerializer = new _$DataSerializer();
Serializer<Post> _$postSerializer = new _$PostSerializer();

class _$RedditSerializer implements StructuredSerializer<Reddit> {
  @override
  final Iterable<Type> types = const [Reddit, _$Reddit];
  @override
  final String wireName = 'Reddit';

  @override
  Iterable<Object> serialize(Serializers serializers, Reddit object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(Children)),
    ];

    return result;
  }

  @override
  Reddit deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RedditBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(Children)) as Children);
          break;
      }
    }

    return result.build();
  }
}

class _$ChildrenSerializer implements StructuredSerializer<Children> {
  @override
  final Iterable<Type> types = const [Children, _$Children];
  @override
  final String wireName = 'Children';

  @override
  Iterable<Object> serialize(Serializers serializers, Children object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'children',
      serializers.serialize(object.children,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Data)])),
    ];

    return result;
  }

  @override
  Children deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChildrenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'children':
          result.children.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Data)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$DataSerializer implements StructuredSerializer<Data> {
  @override
  final Iterable<Type> types = const [Data, _$Data];
  @override
  final String wireName = 'Data';

  @override
  Iterable<Object> serialize(Serializers serializers, Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Post)),
    ];

    return result;
  }

  @override
  Data deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(Post)) as Post);
          break;
      }
    }

    return result.build();
  }
}

class _$PostSerializer implements StructuredSerializer<Post> {
  @override
  final Iterable<Type> types = const [Post, _$Post];
  @override
  final String wireName = 'Post';

  @override
  Iterable<Object> serialize(Serializers serializers, Post object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(String)),
      'subreddit',
      serializers.serialize(object.subreddit,
          specifiedType: const FullType(String)),
      'ups',
      serializers.serialize(object.ups, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Post deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subreddit':
          result.subreddit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ups':
          result.ups = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Reddit extends Reddit {
  @override
  final Children data;

  factory _$Reddit([void Function(RedditBuilder) updates]) =>
      (new RedditBuilder()..update(updates)).build();

  _$Reddit._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('Reddit', 'data');
    }
  }

  @override
  Reddit rebuild(void Function(RedditBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RedditBuilder toBuilder() => new RedditBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reddit && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Reddit')..add('data', data))
        .toString();
  }
}

class RedditBuilder implements Builder<Reddit, RedditBuilder> {
  _$Reddit _$v;

  ChildrenBuilder _data;
  ChildrenBuilder get data => _$this._data ??= new ChildrenBuilder();
  set data(ChildrenBuilder data) => _$this._data = data;

  RedditBuilder();

  RedditBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Reddit other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Reddit;
  }

  @override
  void update(void Function(RedditBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Reddit build() {
    _$Reddit _$result;
    try {
      _$result = _$v ?? new _$Reddit._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Reddit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Children extends Children {
  @override
  final BuiltList<Data> children;

  factory _$Children([void Function(ChildrenBuilder) updates]) =>
      (new ChildrenBuilder()..update(updates)).build();

  _$Children._({this.children}) : super._() {
    if (children == null) {
      throw new BuiltValueNullFieldError('Children', 'children');
    }
  }

  @override
  Children rebuild(void Function(ChildrenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChildrenBuilder toBuilder() => new ChildrenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Children && children == other.children;
  }

  @override
  int get hashCode {
    return $jf($jc(0, children.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Children')..add('children', children))
        .toString();
  }
}

class ChildrenBuilder implements Builder<Children, ChildrenBuilder> {
  _$Children _$v;

  ListBuilder<Data> _children;
  ListBuilder<Data> get children =>
      _$this._children ??= new ListBuilder<Data>();
  set children(ListBuilder<Data> children) => _$this._children = children;

  ChildrenBuilder();

  ChildrenBuilder get _$this {
    if (_$v != null) {
      _children = _$v.children?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Children other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Children;
  }

  @override
  void update(void Function(ChildrenBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Children build() {
    _$Children _$result;
    try {
      _$result = _$v ?? new _$Children._(children: children.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'children';
        children.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Children', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Data extends Data {
  @override
  final Post data;

  factory _$Data([void Function(DataBuilder) updates]) =>
      (new DataBuilder()..update(updates)).build();

  _$Data._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('Data', 'data');
    }
  }

  @override
  Data rebuild(void Function(DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataBuilder toBuilder() => new DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Data && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Data')..add('data', data)).toString();
  }
}

class DataBuilder implements Builder<Data, DataBuilder> {
  _$Data _$v;

  PostBuilder _data;
  PostBuilder get data => _$this._data ??= new PostBuilder();
  set data(PostBuilder data) => _$this._data = data;

  DataBuilder();

  DataBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Data other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Data;
  }

  @override
  void update(void Function(DataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Data build() {
    _$Data _$result;
    try {
      _$result = _$v ?? new _$Data._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Post extends Post {
  @override
  final String author;
  @override
  final String url;
  @override
  final String title;
  @override
  final String thumbnail;
  @override
  final String subreddit;
  @override
  final int ups;

  factory _$Post([void Function(PostBuilder) updates]) =>
      (new PostBuilder()..update(updates)).build();

  _$Post._(
      {this.author,
      this.url,
      this.title,
      this.thumbnail,
      this.subreddit,
      this.ups})
      : super._() {
    if (author == null) {
      throw new BuiltValueNullFieldError('Post', 'author');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Post', 'url');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Post', 'title');
    }
    if (thumbnail == null) {
      throw new BuiltValueNullFieldError('Post', 'thumbnail');
    }
    if (subreddit == null) {
      throw new BuiltValueNullFieldError('Post', 'subreddit');
    }
    if (ups == null) {
      throw new BuiltValueNullFieldError('Post', 'ups');
    }
  }

  @override
  Post rebuild(void Function(PostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostBuilder toBuilder() => new PostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        author == other.author &&
        url == other.url &&
        title == other.title &&
        thumbnail == other.thumbnail &&
        subreddit == other.subreddit &&
        ups == other.ups;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, author.hashCode), url.hashCode), title.hashCode),
                thumbnail.hashCode),
            subreddit.hashCode),
        ups.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Post')
          ..add('author', author)
          ..add('url', url)
          ..add('title', title)
          ..add('thumbnail', thumbnail)
          ..add('subreddit', subreddit)
          ..add('ups', ups))
        .toString();
  }
}

class PostBuilder implements Builder<Post, PostBuilder> {
  _$Post _$v;

  String _author;
  String get author => _$this._author;
  set author(String author) => _$this._author = author;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  String _subreddit;
  String get subreddit => _$this._subreddit;
  set subreddit(String subreddit) => _$this._subreddit = subreddit;

  int _ups;
  int get ups => _$this._ups;
  set ups(int ups) => _$this._ups = ups;

  PostBuilder();

  PostBuilder get _$this {
    if (_$v != null) {
      _author = _$v.author;
      _url = _$v.url;
      _title = _$v.title;
      _thumbnail = _$v.thumbnail;
      _subreddit = _$v.subreddit;
      _ups = _$v.ups;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Post other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Post;
  }

  @override
  void update(void Function(PostBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Post build() {
    final _$result = _$v ??
        new _$Post._(
            author: author,
            url: url,
            title: title,
            thumbnail: thumbnail,
            subreddit: subreddit,
            ups: ups);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
