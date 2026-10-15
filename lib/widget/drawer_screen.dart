import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //crea el drawer
    return Drawer(
      backgroundColor: Colors.blue,
      //en el crea una lista
      child: ListView(
        padding: EdgeInsets.symmetric(),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Pokedex',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          //boton a inicio o home
          ListTile(
            leading: const Icon(Icons.catching_pokemon_outlined),
            title: const Text('Inicio'),
            textColor: Colors.black,
            iconColor: Colors.black,
            onTap: () => context.go('/home'),
          ),

          //Generacional
          ListTile(
            leading: const Icon(Icons.map_outlined),
            title: const Text('Generaciones'),
            textColor: Colors.black,
            iconColor: Colors.black,
            onTap: () => context.go('/generacion'),
          ),

          //por juego
          ListTile(
            leading: const Icon(Icons.gamepad_outlined),
            title: const Text('Juegos'),
            textColor: Colors.black,
            iconColor: Colors.black,
            onTap: () => context.go('/juego'),
          ),
        ],
      ),
    );
  }
}