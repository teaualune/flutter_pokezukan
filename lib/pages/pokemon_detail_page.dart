import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/pokemon.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({key});

  static const routeName = 'PokemonDetailPage';

  @override
    State<StatefulWidget> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {

  Pokemon? _pokemon;
  bool _isError = false;
  bool _loading = false;

  int? _parseNum() {
    final arg = ModalRoute.of(context)?.settings.arguments;
    if (arg is int) {
      return arg;
    }
    return null;
  }

  Future<Pokemon?> _fetchPokemon(int num) async {
    final response = await get(
      Uri.https('pokeapi.co', '/api/v2/pokemon/$num'),
    );
    if (response.statusCode == 404) {
      return null;
    }
    final json = jsonDecode(response.body);
    return Pokemon.fromJson(json);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final num = _parseNum();
      if (num != null) {
        setState(() {
          _loading = true;
        });
        _fetchPokemon(num).then((p) {
          setState(() {
            _pokemon = p;
            _loading = false;
          });
        }, onError: (_) {
          setState(() {
            _loading = false;
            _isError = true;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('No. ${_parseNum() ?? ''}')),
      body: _isError ?
          Center(child: Text('Error')) :
          _loading ?
          Center(child: Text('Loading')) :
          _pokemon == null ?
          Center(child: Text('Not Found')) :
          _buildPokemonView(context, _pokemon!),
    );
  }

  Widget _buildPokemonView(BuildContext context, Pokemon pokemon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        pokemon.sprites != null && pokemon.sprites!.frontDefault != null ?
          Image.network(pokemon.sprites!.frontDefault!) :
          SizedBox(height: 100.0),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            Text(pokemon.name, style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 16.0),
            Row(
              children: [
                Spacer(),
                Text('Weight: ${pokemon.weight}kg'),
                Spacer(),
                Text('Height: ${pokemon.height}m'),
                Spacer(),
              ],
            ),
          ]),
        )
      ],
    );
  }
}


