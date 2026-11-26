import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/shared/infraestructure/service/poke_api_service.dart';
import '../shared/widget/widget.dart';

class AbilitiesScreen extends StatefulWidget {

  final Map<String, dynamic> ability;

  const AbilitiesScreen({
    super.key,
    required this.ability,
  });

  @override
  State<AbilitiesScreen> createState() => _AbilitiesScreenState();
}

class _AbilitiesScreenState extends State<AbilitiesScreen> {

  late Future<Map<String, dynamic>> _abilityFuture;

  @override
  void initState() {
    super.initState();
    _loadAbility();
  }

  void _loadAbility() {
    _abilityFuture = obtenerHabilidadPorUrl(
      widget.ability['url'] as String
    );
  }

  void _retryLoading() {
    setState(_loadAbility);
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
    String lenguage
  ) {
    for (final entry in entries.whereType<Map>()) {
      final entryLenguage = entry['language'];

      if (entryLenguage is Map && entryLenguage ['name'] == lenguage) {
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
        backgroundColor: Colors.blueAccent.shade700,
        //llama el nombre del pokemon para el titulo desde la api
        title: Text(
          _formatName(widget.ability['name'] as String)
        ),
        centerTitle: true,
      ),
      //trae el widget de podexnavigatio
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/down_bicicle.gif',
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return const ColoredBox(color: Colors.blue);
              },
            ),
          ),
          Positioned.fill(
            child: ColoredBox(
              color: Colors.black.withValues(alpha: 0.2),
            ),
          ),

          FutureBuilder<Map<String, dynamic>>(
            future: _abilityFuture, 
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
                          'No se pudo cargar la habilidad:\n${snapshot.error}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 12),
                        FilledButton(
                          onPressed: _retryLoading,
                          child: const Text('Intenta de nuevo.')
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (!snapshot.hasData) {
                return const Center(
                  child: Text(
                    'No se encontraron datos de esta habilidad.',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              final ability = snapshot.data!;

              final effectEntries = ability['effect_entries'] as List? ?? [];

              final flavorEntries = ability['flavor_text_entries'] as List? ?? [];
              
              final pokemonEntries = ability['pokemon'] as List? ?? [];

              final spanishEffect = _findEntryLenguage(effectEntries, 'es');

              final englishEffect = _findEntryLenguage(effectEntries, 'en');

              final spanishFlavor = _findEntryLenguage(flavorEntries, 'es');
                            
              final englishFlavor = _findEntryLenguage(flavorEntries, 'en');

              final description = spanishEffect?['effect'] ?? 
                                  englishEffect?['effect'] ?? 
                                 'Esta habilidad no tiene una descripcion disponible.';

              final flavorText = spanishFlavor?['flavor_text'] ?? englishFlavor?['flavor_text'];

              //whidget scroll con el fin de que no se desborden los pixeles
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: Colors.white.withValues(alpha: 0.7),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _formatName(ability['name'] as String),
                            style: Theme.of(context)
                              .textTheme
                              .headlineSmall
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
                          )
                        ],

                        const SizedBox(height: 16),

                        Text(
                          'Pokemon con esta habilidad: ${pokemonEntries.length}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        for (final entry in pokemonEntries.whereType<Map>())
                          if (entry['pokemon'] is Map && entry['pokemon']['name'] is String)
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(
                                entry['is_hidden'] == true
                                      ? Icons.visibility_off
                                      :Icons.catching_pokemon,
                              ),
                              title: Text(
                                _formatName(
                                  entry['pokemon']['name'] as String,
                                ),
                              ),

                              subtitle: entry['is_hidden'] == true
                                              ? const Text('Habilidad oculta')
                                              : null

                            )
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