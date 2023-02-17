import 'package:json_annotation/json_annotation.dart';

import 'ability.dart';
import 'pokemon_sprite.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  int id;
  String name;

  @JsonKey(name: 'base_experience')
  int? baseExperience;

  int height;

  @JsonKey(name: 'is_default')
  bool isDefault;

  int order;
  int weight;
  List<Ability> abilities;

  PokemonSprite? sprites;

  Pokemon({
    required this.id,
    required this.name,
    this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.abilities,
    this.sprites,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}