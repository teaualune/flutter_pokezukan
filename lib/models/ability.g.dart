// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ability _$AbilityFromJson(Map<String, dynamic> json) {
  return Ability(
    ability: json['ability'] == null
        ? null
        : NamedAPIResource.fromJson(json['ability'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'ability': instance.ability,
    };
