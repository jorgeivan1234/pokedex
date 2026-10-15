import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../widget/widget.dart';

class DetailsScreen extends StatelessWidget {

  final Map<String, dynamic> pokemon;

  const DetailsScreen({
    super.key, 
    required this.pokemon
  });

  @override
  Widget build(BuildContext context) {
    
    final abilities = pokemon['abilities'];
    final type = pokemon['types'];
    final stats = pokemon['stats'];
    final number_generational = pokemon['game_indices'];

    return Scaffold(
      //color del fondo scafoold
      backgroundColor: Colors.blue,
      //cabeza del codigo 
      appBar: AppBar(
        backgroundColor: Colors.red,
        //llama el nombre del pokemon para el titulo desde la api
        title: Text(pokemon['name']),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        centerTitle: true,
      ),
      //whidget scroll con el fin de que no se desborden los pixeles 
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                pokemon['sprites']['front_default'],
                width: 100,
                height: 100,
              ),
        
              // Text(
              //   pokemon['name'],
              //   style: const TextStyle(
              //     color: Colors.black,
              //     fontSize: 24,
              //   )
              //),
        
              SizedBox(width: 12),
                  
              Text(
                'Pokemon #${pokemon['id']}',
                style: TextStyle(
                  color: Colors.white,
                  ),
                ),
          
               SizedBox(width: 12),
          
              Text(
                'Experience: ${pokemon['base_experience']} XP',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            
              SizedBox(width: 12),
            
              Text(
                'height: ${pokemon['height']} M',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            
              Text(
                'weight: ${pokemon['weight']} Kg',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
        
              Card(
                margin: const EdgeInsets.all(12),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hability', 
                        style: TextStyle(
                          fontSize: 20,
                          //hace mas oscuro el texto
                          fontWeight: FontWeight.bold
                        ),
                      ),
        
                      SizedBox(height: 8),
        
                      //crea un layout para las habilidades
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final item in abilities)
                          Chip(
                            avatar: const Icon(Icons.catching_pokemon_sharp),
                            label: Text(item['ability']['name'].toString()),
                          ),
                        ],
                      ),
        
                      SizedBox(height: 8),
        
                      Text(
                        'Type', 
                        style: TextStyle(
                          fontSize: 20,
                          //hace mas oscuro el texto
                          fontWeight: FontWeight.bold
                        ),
                      ),
        
                      //crea un layout para la tabla de su tipo
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final item in type)
                          Chip(
                            avatar: const Icon(Icons.catching_pokemon_sharp),
                            label: Text(item['type']['name'].toString()),
                          ),
                        ],
                      ),
        
                      SizedBox(height: 8),
        
                      Text(
                        'Stats', 
                        style: TextStyle(
                          fontSize: 20,
                          //hace mas oscuro el texto
                          fontWeight: FontWeight.bold
                        ),
                      ),
        
                      //crea un layout para la tabla de su tipo
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final item in stats)
                          Chip(
                            avatar: const Icon(Icons.catching_pokemon),
                            label: Text('${item['stat']['name']} ${item['base_stat']}'),
                          ),
                        ],
                      ),
        
                      SizedBox(height: 8),
        
                      Text(
                        'Generation', 
                        style: TextStyle(
                          fontSize: 20,
                          //hace mas oscuro el texto
                          fontWeight: FontWeight.bold
                        ),
                      ),
        
                      //crea un layout para la tabla de su tipo
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final item in number_generational)
                          Chip(
                            avatar: const Icon(Icons.catching_pokemon_sharp),
                            label: Text(item['version']['name'].toString()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //trae el drawer a details
      drawer: const DrawerScreen(),
      //trae el widget de podexnavigatio
      bottomNavigationBar: PokedexNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) context.go('/search');
        },
      ),
    );
  }
}