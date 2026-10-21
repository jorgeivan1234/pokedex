import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PokedexNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const PokedexNavigationBar({
    super.key, 
    required this.currentIndex, 
    required this.onTap,
  });

  // void onItemTapped(BuildContext context, int index){
  //   switch(index) {
  //     case 0:
  //       context.go('/home/0');
  //     break;

  //     case 1:
  //       context.go('/home/1');
  //     break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      // onTap: (value) => onItemTapped(context, value), 
      onTap: onTap,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
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

