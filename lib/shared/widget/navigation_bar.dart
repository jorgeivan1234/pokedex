import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PokedexNavigationBar extends StatelessWidget {
  final int currentIndex;

  const PokedexNavigationBar({
    super.key, 
    required this.currentIndex, 
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 119, 235, 229),
      currentIndex: currentIndex,
      onTap: (index) {
        context.go(index == 0 ? '/home' : '/search');
      },
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.catching_pokemon,            
            color: Colors.red,
          ),
          activeIcon: Icon(
            Icons.catching_pokemon,
            color: Colors.red,
          ),
          label: 'Pokedex',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Colors.indigo,
          ),
          label: 'Busqueda',
        ),
      ],
    );
  }
}

