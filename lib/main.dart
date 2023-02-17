import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_zukan/blocs/pokemon_detail_cubit.dart';
import 'package:poke_zukan/pages/num_list_page.dart';
import 'package:poke_zukan/pages/pokemon_detail_page.dart';
import 'package:poke_zukan/repositories/pokemon_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => PokemonRepository(),
      child: BlocProvider(
        create: (blocCtx) => PokemonDetailCubit(
          RepositoryProvider.of<PokemonRepository>(blocCtx),
        ),
        child: _buildMaterialApp(context),
      ),
    );
  }

  Widget _buildMaterialApp(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: NumListPage.routeName,
      routes: {
        NumListPage.routeName: (context) => const NumListPage(),
        PokemonDetailPage.routeName: (context) => const PokemonDetailPage(),
      },
    );
  }
}
