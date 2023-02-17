import 'package:flutter/material.dart';
import 'package:poke_zukan/pages/pokemon_detail_page.dart';

class NumListPage extends StatelessWidget {
  static const routeName = 'NumListPage';

  const NumListPage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokédex')),
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: 1008,
      itemBuilder: (BuildContext context, int index) {
        final num = index + 1;
        return GestureDetector(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Text(
              '$num',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              PokemonDetailPage.routeName,
              arguments: num,
            );
          },
        );
      }
    );
  }
}