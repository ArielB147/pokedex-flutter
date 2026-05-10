import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/regions_data.dart';
import '../../cubit/pokedex_cubit.dart';
import '../../data/repositories/pokedex_repository.dart';
import '../views/region_view.dart';

class RegionScreen extends StatelessWidget {
  final RegionData region;

  const RegionScreen({super.key, required this.region});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokedexCubit(
        repository: context.read<PokedexRepository>(),
      )..loadPokemon(offset: region.offset, limit: region.limit),
      child: RegionView(region: region),
    );
  }
}
