import 'package:flutter/material.dart';

class RegionData {
  final String name;
  final String generation;
  final int offset;
  final int limit;
  final String assetPath;
  final List<Color> gradientColors;

  const RegionData({
    required this.name,
    required this.generation,
    required this.offset,
    required this.limit,
    required this.assetPath,
    required this.gradientColors,
  });

  String get pokemonRange {
    final start = (offset + 1).toString().padLeft(3, '0');
    final end = (offset + limit).toString().padLeft(3, '0');
    return '#$start – #$end';
  }
}

const List<RegionData> regions = [
  RegionData(
    name: 'Kanto',
    generation: 'Generation I',
    offset: 0,
    limit: 151,
    assetPath: 'assets/images/regions/kanto.png',
    gradientColors: [Color(0xFFE53935), Color(0xFFFF7043)],
  ),
  RegionData(
    name: 'Johto',
    generation: 'Generation II',
    offset: 151,
    limit: 100,
    assetPath: 'assets/images/regions/johto.png',
    gradientColors: [Color(0xFFFFB300), Color(0xFFFF6F00)],
  ),
  RegionData(
    name: 'Hoenn',
    generation: 'Generation III',
    offset: 251,
    limit: 135,
    assetPath: 'assets/images/regions/hoenn.png',
    gradientColors: [Color(0xFF43A047), Color(0xFF00897B)],
  ),
  RegionData(
    name: 'Sinnoh',
    generation: 'Generation IV',
    offset: 386,
    limit: 107,
    assetPath: 'assets/images/regions/sinnoh.png',
    gradientColors: [Color(0xFF3949AB), Color(0xFF7B1FA2)],
  ),
  RegionData(
    name: 'Unova',
    generation: 'Generation V',
    offset: 493,
    limit: 156,
    assetPath: 'assets/images/regions/unova.png',
    gradientColors: [Color(0xFF455A64), Color(0xFF263238)],
  ),
  RegionData(
    name: 'Kalos',
    generation: 'Generation VI',
    offset: 649,
    limit: 72,
    assetPath: 'assets/images/regions/kalos.png',
    gradientColors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
  ),
  RegionData(
    name: 'Alola',
    generation: 'Generation VII',
    offset: 721,
    limit: 88,
    assetPath: 'assets/images/regions/alola.png',
    gradientColors: [Color(0xFFFF8F00), Color(0xFF00ACC1)],
  ),
  RegionData(
    name: 'Galar',
    generation: 'Generation VIII',
    offset: 809,
    limit: 96,
    assetPath: 'assets/images/regions/galar.png',
    gradientColors: [Color(0xFF6A1B9A), Color(0xFF283593)],
  ),
  RegionData(
    name: 'Paldea',
    generation: 'Generation IX',
    offset: 905,
    limit: 120,
    assetPath: 'assets/images/regions/paldea.png',
    gradientColors: [Color(0xFFD32F2F), Color(0xFFAD1457)],
  ),
];
