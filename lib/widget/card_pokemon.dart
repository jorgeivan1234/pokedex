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

    return SizedBox(
      height: 300,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50)
        ),
        clipBehavior: Clip.antiAlias,
        color: Colors.blue.shade800,
        child: InkWell(
          onTap: () => context.push('/details', extra: pokemon),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(height: 8),
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
