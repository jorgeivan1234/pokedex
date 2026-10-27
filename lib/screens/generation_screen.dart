import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/widget/widget.dart';

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
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
          return context.go('/home');
        },
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.red,),
            title: Text('Generation 1'),
            subtitle: Text('Kanto'),
            onTap: (){
              context.push(
                '/region',
                extra: {'name': 'Kanto', 'generation': 1},
              );
            },          
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.blue.shade900),
            title: Text('Generation 2'),
            subtitle: Text('Johto'),
            onTap: (){
              context.push(
                '/region',
                extra: {'name': 'Johto', 'generation': 2},
              );
            },  
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.black),
            title: Text('Generation 3'),
            subtitle: Text('Hoenn'),
            onTap: (){
              context.push(
                '/region',
                extra: {'name': 'Hoenn', 'generation': 3},
              );
            },  
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.deepPurple.shade900),
            title: Text('Generation 4'),
            subtitle: Text('Sinnoh'),
            onTap: (){
              context.push(
                '/region',
                extra: {'name': 'Sinnoh', 'generation': 4},
              );
            },  
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.white),
            title: Text('Generation 5'),
            subtitle: Text('Unova'),
            onTap: (){
              context.push(
                '/region',
                extra: {'name': 'Unova', 'generation': 5},
              );
            },  
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.green.shade900),
            title: Text('Generation 6'),
            subtitle: Text('Kalos'),
            onTap: (){
              context.push(
                '/region',
                extra: {'name': 'Kalos', 'generation': 6},
              );
            },  
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.cyan.shade900),
            title: Text('Generation 7'),
            subtitle: Text('Alola'),
            onTap: (){
              context.push(
                '/region',
                extra: {'name': 'Alola', 'generation': 7},
              );
            },  
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.yellow.shade900),
            title: Text('Generation 8'),
            subtitle: Text('Galar'),
            onTap: (){
              context.push(
                '/region',
                extra: {'name': 'Galar', 'generation': 8},
              );
            },  
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon, color: Colors.teal.shade900),
            title: Text('Generation 9'),
            subtitle: Text('Paldea'),
            onTap: (){
              context.push(
                '/region',
                extra: {'name': 'Paldea', 'generation': 9},
              );
            },  
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