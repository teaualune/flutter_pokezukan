import 'dart:convert';

import 'package:http/http.dart' as http;

class PokemonAPIService {
  static const _domain = 'pokeapi.co';
  static const _pathPrefix = '/api/v2';

  static PokemonAPIService? _instance;

  factory PokemonAPIService.sharedInstance() {
    if (_instance == null) {
      _instance = PokemonAPIService._init();
    }
    return _instance!;
  }

  PokemonAPIService._init();

  final _client = http.Client();

  Future fetchPokemon(int num) async {
    final response = await _client.get(
      Uri.https(_domain, '$_pathPrefix/pokemon/$num'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Error();
  }
}
