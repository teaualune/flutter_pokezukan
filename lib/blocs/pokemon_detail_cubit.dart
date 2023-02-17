import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_zukan/repositories/pokemon_repository.dart';

import '../models/pokemon.dart';

class PokemonDetailState {
  Pokemon? pokemon;
  bool loading = false;
  bool isError = false;

  PokemonDetailState(this.pokemon, {this.loading = false, this.isError = false});
}

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit(this.pokemonRepo) : super(PokemonDetailState(null));

  final PokemonRepository pokemonRepo;
  // final _pokemonRepo = PokemonRepository();

  Future<void> loadPokemonDetail(int num) async {
    emit(PokemonDetailState(state.pokemon, loading: true, isError: state.isError));
    try {
      final pokemon = await pokemonRepo.getPokemonByNum(num);
      emit(PokemonDetailState(pokemon, loading: false, isError: false));
    } catch (e) {
      emit(PokemonDetailState(null, loading: false, isError: true));
    }
  }
}
