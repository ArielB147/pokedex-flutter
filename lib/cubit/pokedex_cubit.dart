import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/pokedex_repository.dart';
import 'pokedex_state.dart';

class PokedexCubit extends Cubit<PokedexState> {
  final PokedexRepository _repository;

  PokedexCubit({required PokedexRepository repository})
      : _repository = repository,
        super(PokedexInitial());

  Future<void> loadPokemon({required int offset, required int limit}) async {
    emit(PokedexLoading());
    try {
      final pokemon = await _repository.getPokemonByRegion(
        offset: offset,
        limit: limit,
      );
      emit(PokedexLoaded(pokemonList: pokemon, filteredList: pokemon));
    } catch (e) {
      emit(PokedexError('No se pudieron cargar los Pokémon: ${e.toString()}'));
    }
  }

  void search(String query) {
    final current = state;
    if (current is! PokedexLoaded) return;

    if (query.isEmpty) {
      emit(current.copyWith(
        filteredList: current.pokemonList,
        searchQuery: '',
      ));
      return;
    }

    final filtered = current.pokemonList.where((p) {
      final nameLower = p.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower) ||
          p.id.toString().contains(query);
    }).toList();

    emit(current.copyWith(
      filteredList: filtered,
      searchQuery: query,
    ));
  }
}
