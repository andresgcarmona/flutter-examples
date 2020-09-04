import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:inmmutable_models_built_value/models/reddit.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Reddit,
])

final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();