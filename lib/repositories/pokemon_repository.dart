import 'package:flutter/material.dart';
import 'package:poke_zukan/services/json_storage_service.dart';

import '../models/pokemon.dart';
import '../services/pokemon_api_service.dart';

class PokemonRepository {
  final _pokemonAPIService = PokemonAPIService.sharedInstance();

  Future<Pokemon?> getPokemonByNum(int num) async {
    final key = 'pokemon/$num';
    try {
      final storedJSON = await JSONStorageService.read(key);
      return Pokemon.fromJson(storedJSON);
    } catch (e) {
      debugPrint('Read Pokemon from storage failed: $e');
    }
    try {
      final json = await _pokemonAPIService.fetchPokemon(num);
      final pokemon = Pokemon.fromJson(json);
      try {
        await JSONStorageService.write(key, json);
      } catch (e) {
        debugPrint('Write Pokemon to storage failed: $e');
      }
      return pokemon;
    } catch (e) {
      return null;
    }
  }
}
