import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/constants/type_colors.dart';
import '../../data/models/pokemon_model.dart';
import 'type_badge.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final primaryType =
        pokemon.types.isNotEmpty ? pokemon.types.first : 'normal';
    final primaryColor = getTypeColor(primaryType);
    final secondaryColor = pokemon.types.length > 1
        ? getTypeColor(pokemon.types[1])
        : primaryColor.withOpacity(0.7);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryColor, secondaryColor],
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Pokeball decoration
          Positioned(
            right: -12,
            bottom: -12,
            child: Opacity(
              opacity: 0.15,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 18),
                ),
              ),
            ),
          ),
          // Pokemon image (bottom right)
          Positioned(
            right: 4,
            bottom: 4,
            child: CachedNetworkImage(
              imageUrl: pokemon.imageUrl,
              height: 80,
              width: 80,
              placeholder: (context, url) => const SizedBox(
                height: 80,
                width: 80,
              ),
              errorWidget: (context, url, error) => const SizedBox(
                height: 80,
                width: 80,
                child: Icon(
                  Icons.catching_pokemon,
                  color: Colors.white30,
                  size: 50,
                ),
              ),
            ),
          ),
          // Text content (top left)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.formattedId,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  pokemon.capitalizedName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: pokemon.types
                      .map((type) => TypeBadge(type: type))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
