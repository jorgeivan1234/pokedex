import 'package:flutter/material.dart';
import 'package:pokedex/shared/infraestructure/service/poke_api_service.dart';

class MegaEvolutionSection extends StatefulWidget {

  final String pokemonName;

  const MegaEvolutionSection({
    super.key,
    required this.pokemonName
  });

  @override
  State<MegaEvolutionSection> createState() => _MegaEvolutionSectionState();
}

class _MegaEvolutionSectionState extends State<MegaEvolutionSection> {
  late Future<List<Map<String, dynamic>>> _megaEvolutionsFuture;

  @override
  void initState() {
    super.initState();
    _loadMegaEvolutions();
  }

  @override
  void didUpdateWidget (covariant MegaEvolutionSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.pokemonName != widget.pokemonName) {
      _loadMegaEvolutions();
    }
  }

  void _loadMegaEvolutions() {
    _megaEvolutionsFuture = obtenerMegaEvoluciones(widget.pokemonName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _megaEvolutionsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return const Text('No se pudieron cargar las megas evoluciones.');
        }

        final megaEvolutions = snapshot.data!;

        if (megaEvolutions.isEmpty) {
          return const Text('Este Pokemon no tiene mega evoluciones.');
        }


        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for ( final pokemon in megaEvolutions)
                Padding(
                  padding: const EdgeInsetsGeometry.only(right: 12),
                  child: _MegaEvolutionCard(
                    pokemon: pokemon, 
                    basePokemonName: widget.pokemonName,
                  ),
                ),
            ],
          ),
        );
      }
    );
  }
}

class _MegaEvolutionCard extends StatelessWidget {

  final Map<String, dynamic> pokemon;
  final String basePokemonName;

  const _MegaEvolutionCard({
    required this.pokemon,
    required this.basePokemonName
  });

  @override
  Widget build(BuildContext context) {

    final sprites = pokemon['sprites'] as Map<String, dynamic>?;
    final otherSprites = sprites?['other'] as Map<String, dynamic>?;
    final officialArtwork = otherSprites?['official-artwork'] as Map<String, dynamic>?;
    final homeSprite = otherSprites?['home'] as Map<String, dynamic>?;
    final imageUrl =
      officialArtwork?['front_default'] as String? ??
      homeSprite?['front_default'] as String? ??
      sprites?['front_default'] as String ?;

    final name = pokemon['name']?.toString() ?? '';

    return Container(
      width: 130,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Theme.of(context).colorScheme.outline)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageUrl != null)
            Image.network(
              imageUrl,
              width: 90,
              height: 90,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  width: 90,
                  height: 90,
                  child: Icon(Icons.catching_pokemon_rounded),
                );
              },
            )
          else
            const SizedBox(
              width: 90,
              height: 90,
              child: Icon(Icons.catching_pokemon_rounded),
            ),

          const SizedBox(height: 5),

          Text(
            _displayName(name, basePokemonName),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }

  String _displayName(String name, String baseName) {

    final suffix = name
      .replaceFirst('$baseName-mega', '')
      .replaceAll('-', ' ')
      .trim();

    final variant =  _capitalizeWords(suffix);
    final base = _capitalizeWords(baseName);

    return 'Mega $base${variant.isEmpty ? ' ' : ' $variant'}';
  }

  String _capitalizeWords(String value) {

    return value
      .split(' ')
      .where((word) => word.isNotEmpty)
      .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
      .join(' ');
  }
}
