import 'package:json_annotation/json_annotation.dart';

part 'named_api_resource.g.dart';

@JsonSerializable()
class NamedAPIResource {
  String? name;
  String? url;
  NamedAPIResource({this.name, this.url});

  factory NamedAPIResource.fromJson(Map<String, dynamic> json) => _$NamedAPIResourceFromJson(json);
}
