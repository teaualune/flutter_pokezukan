// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    id: json['id'] as int,
    name: json['name'] as String,
    baseExperience: json['base_experience'] as int?,
    height: json['height'] as int,
    isDefault: json['is_default'] as bool,
    order: json['order'] as int,
    weight: json['weight'] as int,
    abilities: (json['abilities'] as List<dynamic>)
        .map((e) => Ability.fromJson(e as Map<String, dynamic>))
        .toList(),
    sprites: json['sprites'] == null
        ? null
        : PokemonSprite.fromJson(json['sprites'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'is_default': instance.isDefault,
      'order': instance.order,
      'weight': instance.weight,
      'abilities': instance.abilities,
      'sprites': instance.sprites,
    };
