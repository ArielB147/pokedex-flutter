class PokemonModel {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;

  const PokemonModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final sprites = json['sprites'] as Map<String, dynamic>;
    final other = sprites['other'] as Map<String, dynamic>?;
    final officialArtwork = other?['official-artwork'] as Map<String, dynamic>?;
    final imageUrl = officialArtwork?['front_default'] as String? ??
        sprites['front_default'] as String? ??
        '';

    final types = (json['types'] as List<dynamic>)
        .map((t) => t['type']['name'] as String)
        .toList();

    return PokemonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: imageUrl,
      types: types,
    );
  }

  String get formattedId => '#${id.toString().padLeft(3, '0')}';

  String get capitalizedName =>
      name.isEmpty ? name : name[0].toUpperCase() + name.substring(1);
}
