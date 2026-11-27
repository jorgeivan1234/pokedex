import 'package:flutter/material.dart';
import 'package:pokedex/shared/infraestructure/service/poke_api_service.dart';

import '../shared/utils/pokemon_type_color.dart';
import '../shared/widget/widget.dart';

class MovesScreen extends StatefulWidget {
  final Map<String, dynamic> moves;
  final Map<String, dynamic> pokemon;

  const MovesScreen({super.key, required this.moves, required this.pokemon});

  @override
  State<MovesScreen> createState() => _MovesScreenState();
}

class _MovesScreenState extends State<MovesScreen> {
  late Future<Map<String, dynamic>> _movesFuture;

  @override
  void initState() {
    super.initState();
    _loadMove();
  }

  void _loadMove() {
    _movesFuture = obtenerMovimientoPorUrl(widget.moves['url'] as String);
  }

  void _retryLoading() {
    setState(_loadMove);
  }

  String _formatName(String name) {
    return name
        .replaceAll('-', ' ')
        .replaceAll('_', ' ')
        .split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .join(' ');
  }

  Map<String, dynamic>? _findEntryLenguage(
    List<dynamic> entries,
    String lenguage,
  ) {
    for (final entry in entries.whereType<Map>()) {
      final entryLenguage = entry['language'];

      if (entryLenguage is Map && entryLenguage['name'] == lenguage) {
        return Map<String, dynamic>.from(entry);
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color del fondo scafoold
      backgroundColor: Colors.blue,
      //cabeza del codigo
      appBar: AppBar(
        backgroundColor: Colors.blue,
        //llama el nombre del pokemon para el titulo desde la api
        title: Text(_formatName(widget.moves['name'] as String)),
        centerTitle: true,
      ),
      //trae el widget de podexnavigatio
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/cynthia.gif',
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return const ColoredBox(color: Colors.blue);
              },
            ),
          ),
          Positioned.fill(
            child: ColoredBox(color: Colors.black.withValues(alpha: 0.2)),
          ),

          FutureBuilder<Map<String, dynamic>>(
            future: _movesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'No se pudo cargar el movimiento:\n${snapshot.error}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 12),
                        FilledButton(
                          onPressed: _retryLoading,
                          child: const Text('Intenta de nuevo.'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: Text(
                    'No se encontraron datos de este movimiento.',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              final move = snapshot.data!;

              final moveType = move['type'] is Map
                  ? move['type']['name'].toString()
                  : 'Desconcido';

              final colorCard = pokemonTypeColor(moveType);

              final effectEntries = move['effect_entries'] as List? ?? [];

              final flavorEntries = move['flavor_text_entries'] as List? ?? [];

              final learnedByPokemon =
                  move['learned_by_pokemon'] as List? ?? [];

              final effect =
                  _findEntryLenguage(effectEntries, 'es') ??
                  _findEntryLenguage(effectEntries, 'en');

              final flavor =
                  _findEntryLenguage(flavorEntries, 'es') ??
                  _findEntryLenguage(flavorEntries, 'en');

              final description =
                  effect?['short_effect'] ??
                  effect?['effect'] ??
                  'Este movimiento no tiene una descripcion disponible.';

              final flavorText = flavor?['flavor_text'];

              final type = move['type'] is Map
                  ? move['type']['name'].toString()
                  : 'Desconocido';

              final damageClass = move['damage_class'] is Map
                  ? move['damage_class']['name'].toString()
                  : 'Desconcido';

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: colorCard.withValues(alpha: 0.7),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _formatName(move['name'] as String),
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Descripción',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          description.toString(),
                          textAlign: TextAlign.justify,
                        ),

                        if (flavorText != null) ...[
                          const SizedBox(height: 16),

                          const Text(
                            'Texto del juego',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            flavorText.toString().replaceAll('\n', ' '),
                            textAlign: TextAlign.justify,
                          ),
                        ],

                        const SizedBox(height: 16),

                        const Text(
                          'Datos del movimiento',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text('Tipo: ${_formatName(type)}'),

                        Text('Categoria: ${_formatName(damageClass)}'),

                        Text('Potencia: ${move['power'] ?? 'No aplica'}'),

                        Text('Precision: ${move['accuracy'] ?? 'No aplica'}'),

                        Text('PP: ${move['pp'] ?? 'No disponibllle'}'),

                        Text('Prioridad: ${move['priority'] ?? 0}'),

                        const SizedBox(height: 16),

                        Text(
                          'Pokemon que puede aprenderlo: ${learnedByPokemon.length}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        for (final entry in learnedByPokemon.whereType<Map>())
                          if (entry['name'] is String)
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.catching_pokemon,
                                size: 40,
                                color: Colors.white,
                              ),
                              title: Text(
                                _formatName(entry['name'] as String),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
