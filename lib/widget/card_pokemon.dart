import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardPokemon extends StatelessWidget {

  final Map<String, dynamic> pokemon; 
  final Map<String, dynamic> pokemonSpecies; 

  const CardPokemon({
    super.key, 
    required this.pokemon, 
    required this.pokemonSpecies
  });

  @override
  Widget build(BuildContext context) {

    final description = pokemonSpecies['flavor_text_entries'];

    final entradaEs = description.where(
      (item) => item['language']['name'] == 'es',
    ).toList();

    final textoDescription = entradaEs.isEmpty
      ? 'Descripcion en español'
      : entradaEs.first['flavor_text']
        .toString()
        .replaceAll('\n', '');


    final types = pokemon['types'] as List<dynamic>;
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
        'rock' => const Color.fromARGB(255, 165, 53, 8), 
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

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(50)
      ),
      clipBehavior: Clip.antiAlias,
      color: colorCard,
      child: InkWell(
        onTap: () => context.push('/details', extra: pokemon),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                //si la imagen no hay nada entonces es nullo
                pokemon['sprites']['front_default'] ?? '',
                scale: 1,
                //en caso que no exista mostrara una pokebola
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.catching_pokemon, size: 100, color: Colors.red),
              ),
                
              Text(
                pokemon['name'].toString().toUpperCase(),
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                '#${pokemon['id']}',
                style: const TextStyle(color: Colors.black),
              ),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 2,
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

              Card(
                shadowColor: Colors.white,
                surfaceTintColor: Colors.black,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    textoDescription,
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}