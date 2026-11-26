import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/models/models.dart';
import '../data/data.dart';
import '../shared/widget/widget.dart';

class JuegosScreen extends StatefulWidget {

  const JuegosScreen({super.key});

  @override
  State<JuegosScreen> createState() => _JuegosScreenState();
}

class _JuegosScreenState extends State<JuegosScreen> {

  String? selectCategory;
  String? selectPlataform;

  final categories = PokemonGames
        .map((game) => game.generacion.split(',').first.trim())
        .toSet()
        .toList()
        ..sort();
  
  final plataform = PokemonGames
        .map((game) => game.plataforma)
        .toSet()
        .toList()
        ..sort();

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
                            items: const [
                              'Primera Generacion',
                              'Segunda Generacion',
                              'Tercera Generacion',
                              'Cuarta Generacion',
                              'Quinta Generacion',
                              'Sexta Generacion',
                              'Septima Generacion',
                              'Octava Generacion',
                            ].map((category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(category),
                              );
                            }).toList(),
                            onChanged: (category) {

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
                            hint: const Text('Todas'),
                            items: const [
                              'Game Boy',
                              'Game Boy Color',
                              'Game Boy Advance',
                              'Nintendo DS',
                              'Nintendo 3DS',
                              'Nintendo Switch',
                            ].map((platform) {
                              return DropdownMenuItem(
                                value: platform,
                                child: Text(platform),
                              );
                            }).toList(),
                            onChanged: (platform) {
                              
                            },
                          )
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
                    final game = pokemonGames[index];

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
                  childCount: pokemonGames.length,
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