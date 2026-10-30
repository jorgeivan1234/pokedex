//estoy prometiendo demasiado para lo poco que llevo
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //crea el drawer
    return Drawer(      
      //en el crea una lista
      child: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/may.gif',
              fit: BoxFit.cover
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          ListView(
            children: [
              DrawerHeader(
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
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () => context.go('/perfil'),
          ),
          //boton a inicio o home
          ListTile(
            leading: const Icon(Icons.catching_pokemon_outlined),
            title: const Text('Inicio'),
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () => context.go('/home'),
          ),

          //Generacional
          ListTile(
            leading: const Icon(Icons.map_outlined),
            title: const Text('Generaciones'),
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () => context.go('/generation'),
          ),

          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Sprites'),
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () => context.go('/sprites'),
          ),

          ListTile(
            leading: const Icon(Icons.gamepad_outlined),
            title: const Text('Juegos'),
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () => context.go('/juego'),
          ),

          ListTile(
            leading: const Icon(Icons.class_outlined),
            title: const Text('Tabla de tipos'),
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () => context.go('/table_tipe'),
          ),

          ListTile(
            leading: const Icon(Icons.present_to_all),
            title: const Text('estrategias'),
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () => context.go('/strategi'),
          ),

          ListTile(
            leading: const Icon(Icons.data_object),
            title: const Text('Objetos'),
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () => context.go('/items'),
          ),

          ListTile(
            leading: const Icon(Icons.move_down),
            title: const Text('Movimientos'),
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () => context.go('/moves'),
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuracion'),
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () => context.go('/config'),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: FilledButton(
              onPressed:(){

              },
              child: Text('Cerrar sesion'),
            ),
          ),
            ],
          ),
        ],
      ),
    );
  }
}