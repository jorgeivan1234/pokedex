import 'package:flutter/material.dart';
import 'package:pokedex/shared/infraestructure/service/services.dart';

class EvolutionSelected extends StatefulWidget {

  final String url;

  const EvolutionSelected({
    super.key, 
    required this.url
  });

  @override
  State<EvolutionSelected> createState() => _EvolutionSelectedState();
}

class _EvolutionSelectedState extends State<EvolutionSelected> {

  late Future<Map<String, dynamic>> _evolutionFuture;
  final Map<String, Future<Map<String, dynamic>>> _pokemonFutures = {};

  @override
  void initState() {
    super.initState();
    _evolutionFuture = obtenerEvolucion(widget.url);
  }

  @override
  void didUpdateWidget(covariant EvolutionSelected oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(oldWidget.url != widget.url){
      _evolutionFuture = obtenerEvolucion(widget.url);
      _pokemonFutures.clear();
    }
  }

  Future<Map<String, dynamic>> _getPokemon(String name) {
    return _pokemonFutures.putIfAbsent(
      name,
      () => obtenerPokemonPorNombre(name),
    );
  }
  @override
  Widget build(BuildContext context){
    return FutureBuilder<Map<String, dynamic>>(
      future: _evolutionFuture, 
      builder: (context, snapshot) {
        
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }

        if(snapshot.hasError || !snapshot.hasData){
          return const Text('No se pudieron cargar las evoluciones.');
        }

        final chain = snapshot.data!['chain'] as Map<String, dynamic>;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: _buildStage(chain),
        );
      },
    );
  }

  Widget _buildStage(Map<String, dynamic> stage) {

    final species = stage['species'] as Map<String, dynamic>;
    final name = species['name'].toString();
    final nextStages = stage['evolves_to'] as List; 

    return FutureBuilder<Map<String, dynamic>>(
      future: _getPokemon(name),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const SizedBox(
            height: 140,
            width: 120,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError || !snapshot.hasData){
          return _PokemonEvolutionCard(
            name: name, 
            error: true, 
          );
        }

        final pokemon = snapshot.data!;
        final sprites = pokemon['sprites'] as Map<String, dynamic>?;
        final otherSprites = sprites?['other'] as Map<String, dynamic>?;
        final officialArtwork = otherSprites?['official-artwork'] as Map<String, dynamic>?;
        final homeSprite = otherSprites?['home'] as Map<String, dynamic>?;
        final sprite = 
          sprites?['front_default'] as String ? 
          ?? officialArtwork?['front_default'] as String? 
          ?? homeSprite?['front_default'] as String?;
        
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _PokemonEvolutionCard(
              name: name, 
              imageUrl: sprite
            ),

            for (final next in nextStages) ...[
              _EvolutionArrow(
                condition: _conditionalLabel(
                  Map<String, dynamic>.from(next as Map),
                ),
              ),
              _buildStage(Map<String, dynamic>.from(next as Map)),
            ],
          ],
        );
      }
    );
  }

  String _conditionalLabel(Map<String, dynamic> nextStage) {
    final details = nextStage['evolution_details'] as List? ?? [];

    if (details.isEmpty){
      return 'Evoluciona';
    }

    final detail = Map<String, dynamic>.from(details.first as Map);
    final level = detail['min_level'];

    if (level is num){
      return 'Nivel ${level.toInt()}';
    }

    final item = detail['item'];
    if (item is Map && item['name'] != null) {
      return 'Usar ${_formatName(item['name'].toString())}';
    }

    final trigger = detail['trigger'];
    final triggerName = trigger is Map ? trigger['name']?.toString(): null;
    switch (triggerName) {
      case 'trade' : 
        return 'Intercambio';
      case 'level-up' : 
        return 'Subir de nivel';
      case 'use-item' : 
        return 'Usar objeto';
      default: 
        return 'Evoluciona';
    }
  }

  String _formatName(String value) {
    return value 
      .replaceAll('-', ' ')
      .replaceAll('_', ' ')
      .split(' ')
      .map((word) {
        if (word.isEmpty) return word;
        return '${word[0].toUpperCase()}${word.substring(1)}';
      })
      .join(' ');
  }

}

class _PokemonEvolutionCard extends StatelessWidget {

  final String name; 
  final String? imageUrl;
  final bool error;

  const _PokemonEvolutionCard({
    required this.name, 
    this.imageUrl, 
    this.error = false
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    
    return Container(
      width: 110,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: colors.outline),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if ( imageUrl != null && !error)
          Image.network(
            imageUrl!,
            width: 80,
            height: 80,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                width: 80,
                height: 80,
                child: Icon(
                  Icons.catching_pokemon_rounded,
                  size: 50,
                ),
              );
            },
          )
          else 
            const SizedBox(
              width: 80,
              height: 90,
              child: Icon(
                Icons.catching_pokemon_rounded,
                size: 50,
              ),
            ),
            
            const SizedBox(height: 5),

            Text(
              _capitalize(name),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
            ),
        ],
      ),
    );
  }

  String _capitalize(String value) {
    if (value.isEmpty) return value;
    return '${value[0].toUpperCase()}-${value.substring(1)}';
  }
}

class _EvolutionArrow extends StatelessWidget {

  final String condition;
  
  const _EvolutionArrow({
    required this.condition
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            condition,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Icon(
            Icons.arrow_forward_rounded,
            color: colors.primary,
          ),
        ],
      ),
    );
  }
}