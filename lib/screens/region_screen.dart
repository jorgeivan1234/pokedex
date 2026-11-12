import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/widget/widget.dart';

class RegionScreen extends StatefulWidget {

  final String name;
  final int generation;

  const RegionScreen({
    super.key, 
    required this.name, 
    required this.generation
  });

  @override
  State<RegionScreen> createState() => _RegionScreenState();
}

class _RegionScreenState extends State<RegionScreen> {

  final mapasPorRegion = <String, dynamic> {
    'kanto': 'assets/images/mapas/kanto.webp',
    'johto': 'assets/images/mapas/johto.png',
    'hoenn': 'assets/images/mapas/hoenn.png',
    'sinnoh': 'assets/images/mapas/Sinnoh.webp',
    'unova': 'assets/images/mapas/unova.png',
    'kalos': 'assets/images/mapas/kalos.jpg',
    'alola': 'assets/images/mapas/alola.webp',
    'galar': 'assets/images/mapas/galar.jpg',
    'paldea': 'assets/images/mapas/paldea.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.go('/generation'), 
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/iniciales.gif',
              fit: BoxFit.fill
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          SafeArea(
            child: Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Generacion ${widget.generation} - ${widget.name}'),

                    ListTile(
                      leading: const Icon(Icons.map_outlined),
                      title: const Text('Mapas'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        final ruta = mapasPorRegion[widget.name.toLowerCase()];
                        if (ruta == null) return;

                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                ruta, fit: BoxFit.cover,
                                scale: 0.8
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.psychology),
                      title: const Text('Habilidades'),
                      trailing: const Icon(Icons.chevron_right),                      
                      onTap: () => context.push('/abilitiesList', extra: widget.generation),
                    ),
                    ListTile(
                      leading: const Icon(Icons.swap_calls),
                      title: const Text('Movimientos'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.go('/movesList', extra: widget.generation),
                    ),
                    const Divider(height: 2),
                    ListTile(
                      leading: const Icon(Icons.catching_pokemon_rounded),
                      title: const Text('Species'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.go('/proximamente'),
                    ),
                    const Divider(height: 2),
                    ListTile(
                      leading: const Icon(Icons.category),
                      title: const Text('Tipos'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.go('/typeList', extra: widget.generation),
                    ),
                    const Divider(height: 2),
                    ListTile(
                      leading: const Icon(Icons.videogame_asset_outlined),
                      title: const Text('Generacion'),
                      subtitle: const Text('Debut'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.go('/proximamente'),
                    ),
                    const Divider(height: 2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      backgroundColor: Colors.blue,
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
        },
      ),
    );
  }
}