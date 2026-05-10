import 'package:dio/dio.dart';
import '../models/pokemon_model.dart';

class PokedexRepository {
  final Dio _dio;
  final Map<String, List<PokemonModel>> _cache = {};

  PokedexRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<PokemonModel>> getPokemonByRegion({
    required int offset,
    required int limit,
  }) async {
    final key = '${offset}_$limit';
    if (_cache.containsKey(key)) return _cache[key]!;

    final listResponse = await _dio.get(
      'https://pokeapi.co/api/v2/pokemon',
      queryParameters: {'offset': offset, 'limit': limit},
    );

    final results = listResponse.data['results'] as List<dynamic>;

    final detailFutures = results
        .map((pokemon) => _dio.get(pokemon['url'] as String))
        .toList();

    final detailResponses = await Future.wait(detailFutures);

    final pokemon = detailResponses
        .map((r) => PokemonModel.fromJson(r.data as Map<String, dynamic>))
        .toList();

    _cache[key] = pokemon;
    return pokemon;
  }
}
