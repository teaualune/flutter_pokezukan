import 'package:json_annotation/json_annotation.dart';
import 'named_api_resource.dart';

part 'ability.g.dart';

@JsonSerializable()
class Ability {
  NamedAPIResource? ability;

  Ability({this.ability});

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}
