import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widget/widget.dart';

class SpritesScreen extends StatefulWidget {
  
  final Map<String, dynamic> pokemon;
  
  const SpritesScreen({
    super.key, 
    required this.pokemon
  });
  
  @override
  State<SpritesScreen> createState() => _SpritesScreenState();
}

class _SpritesScreenState extends State<SpritesScreen> {

  late Map<String, dynamic> currentPokemon;
  late final List<MapEntry<String, String>> spriteOptions;
  String? selectedSpriteUrl;
  String selectedSpriteGroup = 'all';
  bool isLoading = false;

  int get CurrentPokemonId => 
    (currentPokemon['Id'] as num).toInt();

  @override
  void initState() {
    super.initState();
    final sprites = widget.pokemon['sprites'];
    currentPokemon = widget.pokemon;

    spriteOptions = sprites is Map
      ? collectSprites(Map<String, dynamic>.from(sprites))
      : [];

      if(spriteOptions.isNotEmpty) {
        final defaultSprites = spriteOptions.where((sprites) => sprites.key == 'front_default');

        selectedSpriteUrl = defaultSprites.isNotEmpty
          ? defaultSprites.first.value
          :spriteOptions.first.value;
      }
  }
  
  @override
  Widget build(BuildContext context) {

    final types = widget.pokemon['types'];
    final typePrincipal = types.isNotEmpty
      ? types.first['type']['name'].toString()
      : '';

      final colorCard = switch (typePrincipal){
        'fire' => Colors.red,
        'water' => const Color.fromARGB(255, 10, 123, 215),
        'grass' => Colors.green,
        'fighting' => Colors.grey,
        'flying' => const Color.fromARGB(186, 239, 197, 194),
        'poison' => Colors.purple,
        'ground' => Colors.brown,
        'normal' =>  const Color.fromARGB(206, 240, 214, 214), 
        'rock' => const Color.fromARGB(255, 52, 29, 20), 
        'bug' => Colors.greenAccent,
        'ghost' => Colors.deepPurple,
        'steel' => Colors.blueGrey,
        'electric' => Colors.yellow,
        'psychic' => Colors.purpleAccent,
        'ice' => Colors.lightBlue,
        'dark' => Colors.black,        
        'dragon' => const Color.fromARGB(255, 116, 2, 255), 
        'fairy' =>  Colors.pinkAccent, 
        'stellar' => Colors.deepOrange,
        'unknown' =>  Colors.amber, 
        _ => Colors.indigo              
      };

      final visibleSprites = spriteOptions.where((sprite){
        final path = sprite.key;

        switch (selectedSpriteGroup){
          case 'main':
          return !path.startsWith('other.') &&
            !path.startsWith('versions.');

          case 'other':
            return path.startsWith('other.');

          case 'versions':
            return path.startsWith('versions.');

          case 'Generation':
            return path.startsWith('versions/generation-i.');

          case 'ninguno':
            return false;

          case 'all':
          default:
            return true;
        }
      }).toList();
      
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
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        centerTitle: true,
      ),

      //widget scroll con el fin de que no se desborden los pixeles 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [      
          Expanded(
            child: Card(
              color: colorCard,
              margin: const EdgeInsets.all(12),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if ( selectedSpriteUrl != null)
                    Image.network(
                      selectedSpriteUrl!,
                      scale: 0.4,
                      width: 150,
                      height: 150,
                      errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.catching_pokemon_outlined, size: 100),
                    )
                    else 
                    const Icon(Icons.catching_pokemon, size: 100),
              
                    SpritesFiltres(
                      selectedGroup: selectedSpriteGroup, 
                      onGroupChanged: (group){
                        if (group != null) {
                        setState(() {
                            selectedSpriteGroup = group;
                          });
                        }
                      },
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            for (final sprite in visibleSprites)
                            SpritesButton(
                              sprite: sprite,
                              isSelected: selectedSpriteUrl == sprite.value,
                              onPressed: () {
                                setState(() {
                                  selectedSpriteUrl = sprite.value;
                                });
                              },
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