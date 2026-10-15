import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/widget/drawer_screen.dart';

class GenerationScreen extends StatelessWidget {

  const GenerationScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Generation'),
        centerTitle: true,
      ),
      drawer: const DrawerScreen(),
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.red,),
            title: Text('Generation 1'),
            subtitle: Text('Kanto'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.blue.shade900),
            title: Text('Generation 2'),
            subtitle: Text('Johto'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.black),
            title: Text('Generation 3'),
            subtitle: Text('Hoenn'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.deepPurple.shade900),
            title: Text('Generation 4'),
            subtitle: Text('Sinnoh'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.white),
            title: Text('Generation 5'),
            subtitle: Text('Unova'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.green.shade900),
            title: Text('Generation 6'),
            subtitle: Text('Kalos'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.cyan.shade900),
            title: Text('Generation 7'),
            subtitle: Text('Alola'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.yellow.shade900),
            title: Text('Generation 8'),
            subtitle: Text('Galar'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.teal.shade900),
            title: Text('Generation 9'),
            subtitle: Text('Paldea'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon),
            title: Text('Generation 10'),
            subtitle: Text('Proximamente...'),
          ),
        ],
      ),
    );
  }
}