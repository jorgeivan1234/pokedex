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

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            textColor: Colors.black,
            iconColor: Colors.black,
            onTap: () => context.go('/perfil'),
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
            onTap: () => context.go('/generation'),
          ),

          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Sprites'),
            textColor: Colors.black,
            iconColor: Colors.black,
            onTap: () => context.go('/sprites'),
          ),

          //por juego
          ListTile(
            leading: const Icon(Icons.gamepad_outlined),
            title: const Text('Juegos'),
            textColor: Colors.black,
            iconColor: Colors.black,
            onTap: () => context.go('/juego'),
          ),

                    //por juego
          ListTile(
            leading: const Icon(Icons.class_outlined),
            title: const Text('Tabla de tipos'),
            textColor: Colors.black,
            iconColor: Colors.black,
            onTap: () => context.go('/table_tipe'),
          ),

                    //por juego
          ListTile(
            leading: const Icon(Icons.present_to_all),
            title: const Text('estrategias'),
            textColor: Colors.black,
            iconColor: Colors.black,
            onTap: () => context.go('/strategi'),
          ),

          ListTile(
            leading: const Icon(Icons.data_object),
            title: const Text('Objetos'),
            textColor: Colors.black,
            iconColor: Colors.black,
            onTap: () => context.go('/items'),
          ),

          ListTile(
            leading: const Icon(Icons.move_down),
            title: const Text('Movimientos'),
            textColor: Colors.black,
            iconColor: Colors.black,
            onTap: () => context.go('/moves'),
          ),
        ],
      ),
    );
  }
}