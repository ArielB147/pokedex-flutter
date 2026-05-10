import '../data/models/pokemon_model.dart';

abstract class PokedexState {}

class PokedexInitial extends PokedexState {}

class PokedexLoading extends PokedexState {}

class PokedexLoaded extends PokedexState {
  final List<PokemonModel> pokemonList;
  final List<PokemonModel> filteredList;
  final String searchQuery;

  PokedexLoaded({
    required this.pokemonList,
    required this.filteredList,
    this.searchQuery = '',
  });

  PokedexLoaded copyWith({
    List<PokemonModel>? pokemonList,
    List<PokemonModel>? filteredList,
    String? searchQuery,
  }) {
    return PokedexLoaded(
      pokemonList: pokemonList ?? this.pokemonList,
      filteredList: filteredList ?? this.filteredList,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class PokedexError extends PokedexState {
  final String message;
  PokedexError(this.message);
}
