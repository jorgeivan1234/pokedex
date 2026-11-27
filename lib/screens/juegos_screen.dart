import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/models/models.dart';
import '../data/data.dart';
import '../shared/widget/widget.dart';

class JuegosScreen extends StatefulWidget {

  final int? initialGeneration;

  const JuegosScreen({super.key, this.initialGeneration});

  @override
  State<JuegosScreen> createState() => _JuegosScreenState();
}

class _JuegosScreenState extends State<JuegosScreen> {

  static const generationNames = <int, String>{
    1: 'Primera Generacion',
    2: 'Segunda Generacion',
    3: 'Tercera Generacion',
    4: 'Cuarta Generacion',
    5: 'Quinta Generacion',
    6: 'Sexta Generacion',
    7: 'Septima Generacion',
    8: 'Octava Generacion',
    9: 'Novena Generacion',
  };

  static const generationNumbers = <String, int>{
    'Primera Generacion': 1,
    'Segunda Generacion': 2,
    'Tercera Generacion': 3,
    'Cuarta Generacion': 4,
    'Quinta Generacion': 5,
    'Sexta Generacion': 6,
    'Septima Generacion': 7,
    'Octava Generacion': 8,
    'Novena Generacion': 9,
  };
  
  String? selectedCategory;
  String? selectedPlatform;
  String? selectedSubCategory = 'Todos';


  @override
  void initState() {
    super.initState();
      selectedCategory = generationNames[widget.initialGeneration];
    }
  }

  final categories = pokemonGames
      .map((game) => game.generacion.split(',').first.trim())
      .toSet()
      .toList()
    ..sort();

  final platforms = pokemonGames
      .map((game) => game.plataforma)
      .toSet()
      .toList()
    ..sort();

  List<PokemonGameModel> get filteredGames {
    return pokemonGames.where((game) {
      final gameCategory = game.generacion.split(',').first.trim();

      final matchesCategory =
          selectedCategory == null || gameCategory == selectedCategory;
      final matchesPlatform =
          selectedPlatform == null || game.plataforma == selectedPlatform;

      return matchesCategory && matchesPlatform;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Juegos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color(0xFF17202B),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: const DrawerScreen(),
      backgroundColor: const Color.fromARGB(255, 26, 63, 109),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF17202B),
        selectedItemColor: const Color(0xFFFF5252),
        unselectedItemColor: Colors.white70,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
          return context.go('/home');
        }, items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(  
          slivers: [

            // widget que agrega un widget normal en este caso Row pero en un ScrollView
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(height: 20),
                          
                          Text(
                            'Catalogo de videojuegos de pokemon',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          
                          const SizedBox(height: 20),

                          Text( 
                            'Juego Pokemon',
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize:28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),
                          
                          Text(
                            'Expolora las aventuras de cada generacion como entrenador',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:14,
                            ),
                          ),

                          const SizedBox(height: 10),

                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Categoria',
                              prefixIcon: Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.red.shade700,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red.shade700,
                                  width: 2,
                                ),
                              ),
                            ),
                            hint: const Text('Todas'),
                            value: selectedCategory,
                            items: categories.map((category){
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(category),
                              );
                            }).toList(),
                            onChanged: (category) {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                          ),

                          const SizedBox(height: 12),

                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Consola',
                              prefixIcon: Icon(Icons.videogame_asset_outlined),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                            value: selectedPlatform,
                            hint: const Text('Todas'),
                            items: platforms.map((platform) {
                              return DropdownMenuItem(
                                value: platform,
                                child: Text(platform),
                              );
                            }).toList(),
                            onChanged: (platform) {
                              setState(() {
                                selectedPlatform = platform;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width:48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.catching_pokemon_outlined,
                        color: Colors.red.shade700,
                        size:28,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //es el padding de Sliver para la lista de juegos
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
              // es un ListView pero con scroll ademas de que es compatible con otros slivers
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final game = filteredGames[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: _PokemonGameTile(
                        game: game,
                        onLongPress: () => context.push(
                          '/Game-Description',
                          extra: game,
                        ),
                      ),
                    );
                  },
                  childCount: filteredGames.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PokemonGameTile extends StatelessWidget {

  final PokemonGameModel game;
  final VoidCallback onLongPress;

  const _PokemonGameTile({
    required this.game,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onLongPress: onLongPress,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: game.color.withOpacity(0.25),
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              // Imagen del juego
              Container(
                width: 7,
                height: 160,
                color: game.color,
              ),
              Container(
                width: 100,
                height: 160,
                padding: const EdgeInsets.all(8),
                color: game.color.withOpacity(0.1),
                child: Image.asset(
                  game.imagenAssets,
                  fit: BoxFit.contain,
                ),
              ),
              // Información del juego
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 14, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        game.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF17202B),
                        ),
                      ),

                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          _GameTag(label: game.plataforma),
                          _GameTag(label: game.genero),
                        ],
                      ),

                      const SizedBox(height: 4),

                      Text(
                        game.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey.shade700,
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        game.generacion,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey.shade500,
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 7),

                      Row(
                        children: [
                          Icon(
                            Icons.touch_app_outlined,
                            size: 14,
                            color: Colors.red.shade700,
                          ),

                          const SizedBox(width: 4),

                          Text(
                            'Mantén presionado para ver detalles',
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GameTag extends StatelessWidget {

  final String label; 

  const _GameTag({
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFFF0F2F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Color(0xFF485563),
        ),
      ),
    );
  }
}