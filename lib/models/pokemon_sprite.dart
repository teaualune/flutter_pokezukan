import 'package:json_annotation/json_annotation.dart';

part 'pokemon_sprite.g.dart';

@JsonSerializable()
class PokemonSprite {
  @JsonKey(name: 'front_default')
  String? frontDefault;

  PokemonSprite({this.frontDefault});

  factory PokemonSprite.fromJson(Map<String, dynamic> json) => _$PokemonSpriteFromJson(json);
}