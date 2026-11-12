import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/mappers/caracteristicas_mapper.dart';
import '../shared/utils/pokemon_type_color.dart';
import '../shared/widget/widget.dart';

class DetailsScreen extends StatefulWidget {

  final Map<String, dynamic> pokemon;
  final Map<String, dynamic> pokemonSpecies;

  const DetailsScreen({
    super.key, 
    required this.pokemon, 
    required this.pokemonSpecies
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  final AudioPlayer _player  = AudioPlayer();

  Future<void> _playCry(String version) async {
    final id = widget.pokemon['id'];
    final url = 'https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/$version/$id.ogg';

    await _player.stop();
    await _player.play(UrlSource(url));
  }

  @override
  void dispose(){
    _player.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
 
    final abilities = widget.pokemon['abilities'];
    final type = widget.pokemon['types'];
    final stats = widget.pokemon['stats'];
    final gameGenerational = widget.pokemon['game_indices'];
    final heightMeters = (widget.pokemon['height']) / 10;
    final weightKg = (widget.pokemon['weight']) / 10;
    final items = widget.pokemon['held_items'];
    final moves = widget.pokemon['moves'];

    final description = widget.pokemonSpecies['flavor_text_entries'] as List? ?? [];
    final evolutionData = widget.pokemonSpecies['evolution_chain'];
    final evolutionUrl = evolutionData is Map ? evolutionData['url'] as String? : null;
    final number = widget.pokemonSpecies['pokedex_numbers'];


    final entradaEs = description.where(
      (item) => item['language']['name'] == 'es',
    ).toList();

    final textoDescription = entradaEs.isEmpty 
      ? 'Descripcion en español'
      : entradaEs.first['flavor_text']
        .toString()
        .replaceAll('\n', '');

    final typePrincipal = type.isNotEmpty
        ? type.first['type']['name'].toString()
        : '';

    final colorCard = pokemonTypeColor(typePrincipal);
    // final colorCard2 = pokemonTypeColor2(typePrincipal);

    return Scaffold(
      //color del fondo scafoold
      backgroundColor: Colors.blue,
      //cabeza del codigo 
      appBar: AppBar(
        backgroundColor: colorCard,
        //llama el nombre del pokemon para el titulo desde la api
        title: Text(widget.pokemon['name']),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.go('/home'), 
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/arcanite_gold.gif',
              fit: BoxFit.cover,
            ),    
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          SafeArea(
            child: Center(
              //widget scroll con el fin de que no se desborden los pixeles 
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ 
                      Card(
                        color: colorCard.withValues(alpha: 0.8),
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              PokemonHero(
                                name: widget.pokemon['name'].toString(), 
                                id: int.parse(
                                  widget.pokemon['id'].toString()
                                ), 
                                imageUrl: widget.pokemon['sprites']['front_default']?.toString() ?? '', 
                                types: [
                                  for (final item in type)
                                  item ['type']['name'].toString()
                                ],
                                color: colorCard, 
                                onCry: () => _playCry('legacy'), 
                                onLongpress: () => context.push (
                                  '/sprites',
                                  extra: widget.pokemon
                                ),                                
                              ),

                              const SizedBox(height: 10),

                              _DetailsSection(
                                title: 'Descripcion', 
                                icon: Icons.menu_book_outlined, 
                                child: Text(
                                  textoDescription,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.5,
                                  ),
                                ),
                              ),

                              _DetailsSection(
                                title: 'Datos principales',
                                icon: Icons.info_outline_rounded, 
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    _InfoBadge(
                                      label: 'Altura', 
                                      value: '${heightMeters.toStringAsFixed(1)} M',
                                    ),
                                    _InfoBadge(
                                      label: 'Peso', 
                                      value: '${weightKg.toStringAsFixed(1)} Kg',
                                    ),
                                    _InfoBadge(
                                      label: 'Experiencia', 
                                      value: '${widget.pokemon['base_experience']} EXP',
                                    ),
                                    _InfoBadge(
                                      label: 'R.Captura', 
                                      value: '${widget.pokemonSpecies['capture_rate']}',
                                    ),
                                    _InfoBadge(
                                      label: 'Felicidad Base', 
                                      value: '${widget.pokemonSpecies['base_happiness']}',
                                    ),
                                    _InfoBadge(
                                      label: 'Eclosiones', 
                                      value: '${widget.pokemonSpecies['hatch_counter']}',
                                    ),
                                  ],
                                ),
                              ),

                              _DetailsSection(
                                title: 'Caracteristicas', 
                                icon: Icons.auto_awesome_rounded, 
                                child: Column(
                                  children: [
                                    _FactRow(
                                      label: 'Legendario', 
                                      value: CaracteristicasMapper.booleanLabels(widget.pokemonSpecies['is_legendary']),
                                    ),
                                    _FactRow(
                                      label: 'Mitico', 
                                      value: CaracteristicasMapper.booleanLabels(widget.pokemonSpecies['is_mythical']),
                                    ),
                                    _FactRow(
                                      label: 'Diferencia de genero', 
                                      value: CaracteristicasMapper.booleanLabels(widget.pokemonSpecies['has_gender_differences']),
                                    ),
                                  ],
                                ),
                              ),

                              _DetailsSection(
                                title: 'Habilidades', 
                                icon: Icons.bolt_rounded, 
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 4,
                                  children: [
                                    for (final item in abilities)
                                      ActionChip(
                                        avatar: Icon(
                                          item['is_hidden'] == true
                                            ? Icons.visibility_off_rounded
                                            :Icons.bolt_rounded,
                                          size: 18,
                                        ),
                                        label: Text(
                                          '${item['ability']['name']}' 
                                          '${item['is_hidden'] == true ? ' (oculta)' : ''}',
                                        ),
                                        onPressed: () => context.push(
                                          '/abilities',
                                          extra: item['ability']
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              _DetailsSection(
                                title: 'Estadisticas', 
                                icon: Icons.bar_chart_rounded, 
                                child: Column(
                                  children: [
                                    for (final item in stats)
                                      _StatsRow(
                                        name: item['stat']['name'].toString(), 
                                        value: item['base_stat'] as int, 
                                        color: colorCard
                                      ),
                                  ],
                                ),
                              ),

                              _ExpandableDetails(
                                title: 'Evoluciones', 
                                icon: Icons.alt_route_rounded, 
                                child: evolutionUrl == null   
                                  ? const Text('No hay datos de evolucion disponible.')
                                  : EvolutionSelected(url: evolutionUrl)
                              ),

                              _ExpandableDetails(
                                title: 'Juegos y Generaciones', 
                                icon: Icons.videogame_asset_rounded, 
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    for(final item in gameGenerational)
                                      Chip(
                                        avatar: const Icon(Icons.catching_pokemon_rounded),
                                        label: Text(item['version']['name'].toString()),
                                      ),
                                  ],
                                ),
                              ),

                              _ExpandableDetails(
                                title: 'Objetos que pueden llevar', 
                                icon: Icons.inventory_2_rounded, 
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    for(final item in items)
                                      Chip(
                                        label: Text(item['item']['name'].toString()),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      //trae el drawer a details
      drawer: const DrawerScreen(),
      //trae el widget de podexnavigatio
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
        },
      ),
    );
  }
}           

class _DetailsSection extends StatelessWidget {

  final String title;
  final IconData icon;
  final Widget child;

  const _DetailsSection({
    required this.title, 
    required this.icon, 
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsetsGeometry.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [

                Icon(icon, size: 20),

                const SizedBox(width: 10),

                Text(
                  title, 
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 10),

            child
          ],
        ),
      ),
    );
  }
}

class _InfoBadge extends StatelessWidget {

  final String label;
  final String value;
  
  const _InfoBadge({
    required this.label, 
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 105),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium
          ),

          const SizedBox(width: 6),

          Text(
            value, style: const TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}

class _FactRow extends StatelessWidget {

  final String label;
  final dynamic value;
  
  const _FactRow({
    required this.label, 
    required this.value
  });

  @override
  Widget build(BuildContext context) { 
    final displayValue = value is bool ? ( value ? 'Si' : 'No') : '$value';
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            displayValue,
            style: const TextStyle(
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {

  final String name;
  final int value;
  final Color color;

  const _StatsRow({
    required this.name, 
    required this.value, 
    required this.color
  });

  @override
  Widget build(BuildContext context) {

    final progress = (value / 255).clamp(0.0, 1.0).toDouble();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(name.replaceAll('-', ' ')),
              ),

              Text(
                '$value', style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              color: color,
              backgroundColor: color.withValues(alpha: 0.18),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpandableDetails extends StatelessWidget {

  final String title;
  final IconData icon; 
  final Widget child;

  const _ExpandableDetails({
    required this.title, 
    required this.icon, 
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20)
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        leading: Icon(icon),
        title: Text(
          title, 
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        children: [
          child
        ],
      ),
    );
  }
}