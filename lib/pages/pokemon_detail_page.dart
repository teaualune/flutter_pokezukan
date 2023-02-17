import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/pokemon_detail_cubit.dart';
import '../models/pokemon.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({key});

  static const routeName = 'PokemonDetailPage';

  @override
    State<StatefulWidget> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {

  int? _parseNum() {
    final arg = ModalRoute.of(context)?.settings.arguments;
    if (arg is int) {
      return arg;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final num = _parseNum();
      if (num != null) {
        context.read<PokemonDetailCubit>().loadPokemonDetail(num);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('No. ${_parseNum() ?? ''}')),
      body: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
        builder: (context, state) => state.isError ?
          Center(child: Text('Error')) :
          state.loading ?
          Center(child: Text('Loading')) :
          state.pokemon == null ?
          Center(child: Text('Not Found')) :
          _buildPokemonView(context, state.pokemon!),
      )
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


