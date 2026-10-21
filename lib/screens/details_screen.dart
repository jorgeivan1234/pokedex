import 'package:flutter/material.dart';
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
    final gameGenerational = pokemon['game_indices'];
    final heightMeters = (pokemon['height']) / 10;
    final weightKg = (pokemon['weight']) / 10;
    final items = pokemon['held_items'];
    final moves = pokemon['moves'];
    // final evolution = pokemon['species']; 

    final types = pokemon['types'];
    final typePrincipal = types.isNotEmpty
      ? types.first['type']['name'].toString()
      : '';

      final colorCard = switch (typePrincipal){
        'fire' => Colors.red.shade900,
        'water' => const Color.fromARGB(255, 10, 123, 215),
        'grass' => Colors.green,
        'fighting' => Colors.grey,
        'flying' => const Color.fromARGB(186, 239, 197, 194),
        'poison' => Colors.purple,
        'ground' => Colors.brown,
        'normal' =>  const Color.fromARGB(206, 240, 214, 214), 
        'rock' => const Color.fromARGB(255, 77, 52, 43), 
        'bug' => Colors.greenAccent,
        'ghost' => Colors.deepPurple,
        'steel' => Colors.blueGrey,
        'electric' => Colors.yellow,
        'psychic' => Colors.purpleAccent,
        'ice' => Colors.lightBlue,
        'dark' => Colors.black,        
        'dragon' => const Color.fromARGB(255, 116, 2, 255), 
        'fairy' =>  Colors.pinkAccent, 
        'stellar' => Colors.deepOrange,
        'unknown' =>  Colors.amber, 
        _ => Colors.indigo              
      };

    return Scaffold(
      //color del fondo scafoold
      backgroundColor: Colors.blue,
      //cabeza del codigo 
      appBar: AppBar(
        backgroundColor: colorCard,
        //llama el nombre del pokemon para el titulo desde la api
        title: Text(pokemon['name']),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        centerTitle: true,
      ),
      //widget scroll con el fin de que no se desborden los pixeles 
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [      
              Card(
                color: colorCard,
                margin: const EdgeInsets.all(12),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onLongPress: () => context.push('/sprites', extra: pokemon),
                        child: Image.network(
                          pokemon['sprites']['front_default'],
                          scale:  0.4,
                        ),
                      ),  

                      Text(
                        pokemon['name'],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      
                      SizedBox(width: 12),

                      Text(
                        'Pokemon #${pokemon['id']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      SizedBox(width: 12),


                      Text(
                        'Experience: ${pokemon['base_experience']} XP',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      SizedBox(width: 12),

                      Text(
                        'Altura: ${heightMeters.toStringAsFixed(1)} M',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      SizedBox(width: 12),

                      Text(
                        'peso: ${weightKg.toStringAsFixed(1)} Kg',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      
                      SizedBox(width: 12),

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
                      InkWell(// Cada chip debe navegar con los datos de su propia habilidad
                        onTap: () => context.push('/habilitys', extra: ['ability']),
                        child: Wrap(
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
        
                      //crea un layout para la tabla de su stats
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
        
                      //crea un layout para los juegos que aparece
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final item in gameGenerational)
                          Chip(
                            avatar: const Icon(Icons.catching_pokemon_sharp),
                            label: Text(item['version']['name'].toString()),
                          ),
                        ],
                      ),

                      SizedBox(width: 12),

                      Text(
                        'Items', 
                        style: TextStyle(
                          fontSize: 20,
                          //hace mas oscuro el texto
                          fontWeight: FontWeight.bold
                        ),
                      ),
        
                      SizedBox(height: 8),
        
                      //crea un layout para las items
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final item in items)
                          Chip(
                            avatar: pokemon['sprites']?['default'] is String
                              ? Image.network(pokemon['sprites']['default'])
                              : null,
                            label: Text(item['item']['name'].toString()),
                          ),
                        ],
                      ),

                      SizedBox(width: 12),

                      Text(
                        'Move', 
                        style: TextStyle(
                          fontSize: 20,
                          //hace mas oscuro el texto
                          fontWeight: FontWeight.bold
                        ),
                      ),
        
                      SizedBox(height: 8),
        
                      //crea un layout para ls movimientos
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final item in moves)
                          Chip(
                            avatar: const Icon(Icons.catching_pokemon_sharp),
                            label: Text(item['move']['name'].toString()),
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