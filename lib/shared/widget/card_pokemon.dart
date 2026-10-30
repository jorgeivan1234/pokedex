import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/shared/utils/pokemon_type_color.dart';

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

    final colorCard = pokemonTypeColor(typePrincipal);
    final colorCard2 = pokemonTypeColor2(typePrincipal);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(50)
      ),
      clipBehavior: Clip.antiAlias,
      color: colorCard.withValues(alpha: 0.8),
      child: InkWell(
        onTap: () => context.push(
          '/details',
          extra: {
            'pokemon': pokemon,
            'pokemonSpecies': pokemonSpecies,
          },
        ),
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
                color: colorCard2,
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