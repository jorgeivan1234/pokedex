import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardPokemon extends StatelessWidget {

  final Map<String, dynamic> pokemon; 

  const CardPokemon({
    super.key, 
    required this.pokemon
  });

  @override
  Widget build(BuildContext context) {

    final types = pokemon['types'];
    final typePrincipal = types.isNotEmpty
      ? types.first['type']['name'].toString()
      : '';

      final colorCard = switch (typePrincipal){
        'fire' => Colors.red,
        'water' => const Color.fromARGB(255, 10, 123, 215),
        'grass' => Colors.green,
        'fighting' => Colors.grey,
        'flying' => const Color.fromARGB(186, 239, 197, 194),
        'poison' => Colors.purple,
        'ground' => Colors.brown,
        'normal' =>  const Color.fromARGB(206, 240, 214, 214), 
        'rock' => const Color.fromARGB(255, 52, 29, 20), 
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

    return SizedBox(
      height: 300,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50)
        ),
        clipBehavior: Clip.antiAlias,
        color: colorCard,
        child: InkWell(
          onTap: () => context.push('/details', extra: pokemon),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  //si la imagen no hay nada entonces es nullo
                  pokemon['sprites']['front_default'] ?? '',
                  height: 150,
                  width: 150,
                  //en caso que no exista mostrara una pokebola
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.catching_pokemon, size: 100, color: Colors.red),
                ),

                // const SizedBox(height: 8),
                
                Text(
                  pokemon['name'].toString().toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '#${pokemon['id']}',
                  style: const TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 6),
                
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 4,
                  children: [
                    for (final item in types)
                      Chip(
                        label: Text(item['type']['name'].toString()),
                        visualDensity: VisualDensity.compact,
                        labelStyle: const TextStyle(fontSize: 11),
                        padding: EdgeInsets.zero,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
