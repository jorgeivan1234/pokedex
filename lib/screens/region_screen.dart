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
                      leading: const Icon(Icons.swap_calls),
                      title: const Text('Movimientos'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    const Divider(height: 2),
                    ListTile(
                      leading: const Icon(Icons.catching_pokemon_rounded),
                      title: const Text('Species'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    const Divider(height: 2),
                    ListTile(
                      leading: const Icon(Icons.category),
                      title: const Text('Tipos'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    const Divider(height: 2),
                    ListTile(
                      leading: const Icon(Icons.videogame_asset_outlined),
                      title: const Text('Generacion'),
                      subtitle: const Text('Debut'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
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