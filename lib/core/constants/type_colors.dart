import 'package:flutter/material.dart';

const Map<String, Color> typeColors = {
  'normal': Color(0xFF919AA2),
  'fire': Color(0xFFFF9741),
  'water': Color(0xFF3692DC),
  'electric': Color(0xFFFBD100),
  'grass': Color(0xFF38BF4B),
  'ice': Color(0xFF4CD1C0),
  'fighting': Color(0xFFCE4069),
  'poison': Color(0xFFB567CE),
  'ground': Color(0xFFDA7C4D),
  'flying': Color(0xFF89AAE3),
  'psychic': Color(0xFFFF6675),
  'bug': Color(0xFF91C12F),
  'rock': Color(0xFFC5B78C),
  'ghost': Color(0xFF5269AD),
  'dragon': Color(0xFF006FC9),
  'dark': Color(0xFF5B5466),
  'steel': Color(0xFF5A8EA2),
  'fairy': Color(0xFFEB89E5),
};

Color getTypeColor(String type) =>
    typeColors[type.toLowerCase()] ?? const Color(0xFF919AA2);
