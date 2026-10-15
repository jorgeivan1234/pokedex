import 'package:flutter/material.dart';

class PokedexNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const PokedexNavigationBar({
    super.key, 
    required this.currentIndex, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap, 
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.catching_pokemon),
          label: 'Pokedex',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Busqueda',
        )
      ],
    );
  }
}

