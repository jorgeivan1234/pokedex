import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    final colorCard2 = pokemonTypeColor2(typePrincipal);

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
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  InkWell(
                                    onLongPress: () => context.push('/sprites', extra: widget.pokemon),
                                    child: Image.network(
                                      widget.pokemon['sprites']['front_default'],
                                      scale:  0.4,
                                    ),
                                  ),
                                  //agrega una pocicion y un boton para el pokemon
                                  Positioned(
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () => _playCry('legacy'), 
                                      icon: Icon(Icons.volume_up_rounded),
                                      color: colorCard2,
                                    ),
                                  ),
                                ],
                              ),  
                              
                              Text(
                                widget.pokemon['name'],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                      
                              SizedBox(height: 10),

                              Text(
                                'Pokemon: #${widget.pokemon['id']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                'Descripcion',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Card(
                                shadowColor: Colors.white,
                                surfaceTintColor: Colors.black,
                                color: colorCard2,
                                child: Padding(
                                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
                                  child: Text(
                                    textoDescription,
                                    maxLines: 5,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                'Experience: ${widget.pokemon['base_experience']} XP',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                'Altura: ${heightMeters.toStringAsFixed(1)} M',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                'peso: ${weightKg.toStringAsFixed(1)} Kg',
                                style: TextStyle(
                                  fontSize: 15,                                  
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                'Ratio de Captura: ${widget.pokemonSpecies['capture_rate']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                'Felicidad base: ${widget.pokemonSpecies['base_happiness']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                '¿Es Legendario?   ${widget.pokemonSpecies['is_legendary']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              
                              SizedBox(height: 10),

                              Text(
                                '¿Es Mitico?   ${widget.pokemonSpecies['is_mythical']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),      

                              SizedBox(height: 10),

                              Text(
                                'Contador de eclosiones  ${widget.pokemonSpecies['hatch_counter']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              
                              SizedBox(height: 10),

                              Text(
                                '¿Tiene diferencias de genero?  ${widget.pokemonSpecies['has_gender_differences']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              
                              SizedBox(height: 10),
                              
                              Text(
                                'Habilidad', 
                                style: TextStyle(
                                  fontSize: 20,
                                  //hace mas oscuro el texto
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                
                              SizedBox(height: 10),
                
                              //crea un layout para las habilidades
                              InkWell(// Cada chip debe navegar con los datos de su propia habilidad
                                onTap: () => context.push('/abilities', extra: ['ability']),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    for (final item in abilities.where((item) => item['is_hidden'] == false))
                                    ActionChip(
                                      backgroundColor: colorCard2,
                                      avatar: const Icon(Icons.catching_pokemon_sharp),
                                      label: Text(item['ability']['name'].toString()),
                                      onPressed: () => context.push('/abilities', extra: item['ability']),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                'Habilidad Oculta', 
                                style: TextStyle(
                                  fontSize: 20,
                                  //hace mas oscuro el texto
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                
                              SizedBox(height: 10),
                
                              //crea un layout para las habilidades
                              InkWell(// Cada chip debe navegar con los datos de su propia habilidad
                                onTap: () => context.push('/abilities', extra: ['ability']),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    for (final item in abilities.where((item) => item['is_hidden'] == true))
                                    ActionChip(
                                      backgroundColor: colorCard2,
                                      avatar: const Icon(Icons.catching_pokemon_sharp),
                                      label: Text(item['ability']['name'].toString()),
                                      onPressed: () => context.push('/abilities', extra: item['ability']),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 10),
                
                              Text(
                                'Type', 
                                style: TextStyle(
                                  fontSize: 20,
                                  //hace mas oscuro el texto
                                  fontWeight: FontWeight.bold
                                ),
                              ),

                              SizedBox(height: 10),
                
                              //crea un layout para la tabla de su tipo
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  for (final item in type)
                                  Chip(
                                    backgroundColor: colorCard2,
                                    avatar: const Icon(Icons.catching_pokemon_sharp),
                                    label: Text(item['type']['name'].toString()),
                                  ),
                                ],
                              ),
                                
                              SizedBox(height: 10),

                              Text(
                                'Stats', 
                                style: TextStyle(
                                  fontSize: 20,
                                  //hace mas oscuro el texto
                                  fontWeight: FontWeight.bold
                                ),
                              ),

                              SizedBox(height: 10),
                
                              //crea un layout para la tabla de su stats
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  for (final item in stats)
                                  Chip(
                                    backgroundColor: colorCard2,
                                    avatar: const Icon(Icons.catching_pokemon),
                                    label: Text('${item['stat']['name']} ${item['base_stat']}'),
                                  ),
                                ],
                              ),
                
                              SizedBox(height: 20),

                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(12)
                                ),
                                child: ExpansionTile(
                                  backgroundColor: colorCard2,
                                  title: Text(
                                    'Evoluciones',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        if (evolutionUrl != null)
                                        EvolutionSelected(url: evolutionUrl)
                                        else 
                                        const Text('No hay datos de evolucion disponibles.'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              
                              SizedBox(height: 20),

                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(12)
                                ),
                                child: ExpansionTile(
                                  backgroundColor: colorCard2,
                                  title: Text(
                                    'Ubicaciones',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                  children: [
                                    // crea un layout para ls movimientos
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        if (evolutionUrl != null)
                                        EvolutionSelected(url: evolutionUrl)
                                        else 
                                        const Text('No hay datos de Ubicaciones disponibles.'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                                                    
                              SizedBox(width: 12),

                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(12)
                                ),
                                child: ExpansionTile(
                                  backgroundColor: colorCard2,
                                  title: Text(
                                    'Generation',
                                    style: TextStyle(                              
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                  children: [
                                    //crea un layout para los juegos que aparece
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                      children: [
                                        for (final item in gameGenerational)
                                        Chip(
                                          backgroundColor: colorCard2,
                                          avatar: const Icon(Icons.catching_pokemon_sharp),
                                          label: Text(item['version']['name'].toString()),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
              
                              SizedBox(width: 12),

                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(12)
                                ),
                                child: ExpansionTile(
                                  backgroundColor: colorCard2,
                                  title: Text(
                                    'Items',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                  children: [
                                    //crea un layout para las items
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        for (final item in items)
                                        Chip(
                                          backgroundColor: colorCard2,
                                          avatar: widget.pokemon['sprites']?['default'] is String
                                            ? Image.network(widget.pokemon['sprites']['default'])
                                            : null,
                                          label: Text(item['item']['name'].toString()),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 12),

                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(12)
                                ),
                                child: ExpansionTile(
                                  backgroundColor: colorCard2,
                                  title: Text(
                                    'Move',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                  children: [
                                    //crea un layout para ls movimientos
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        for (final item in moves)
                                        Chip(
                                          backgroundColor: colorCard2,
                                          avatar: const Icon(Icons.catching_pokemon_sharp),
                                          label: Text(item['move']['name'].toString()),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 12),

                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(12)
                                ),
                                child: ExpansionTile(
                                  backgroundColor: colorCard2,
                                  title: Text(
                                    'Numero de PokedexS', 
                                    style: TextStyle(
                                      fontSize: 20,
                                      //hace mas oscuro el texto
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  children: [
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        for (final item in number)
                                        Chip(
                                          backgroundColor: colorCard2,
                                          avatar: const Icon(Icons.catching_pokemon_sharp),
                                          label: Text('${item['pokedex']['name']} ${item['entry_number']}'),
                                        ),
                                      ],
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
