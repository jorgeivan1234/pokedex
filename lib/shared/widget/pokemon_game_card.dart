import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_game_model.dart';

class PokemonGameCard extends StatelessWidget {

  final PokemonGameModel game;
  final VoidCallback onLongPress;
  
  const PokemonGameCard({
    super.key, 
    required this.game, 
    required this.onLongPress, 
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: Card(
        color: game.color.withValues(alpha: 0.7),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 280,
              child: Image.asset(
                game.imagenAssets,
                fit: BoxFit.contain
              ),
            ),
            Padding(
              padding: const EdgeInsetsGeometry.fromLTRB(16, 8, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Plataforma: ${game.plataforma}'),
                  Text('Genero: ${game.genero}'),
                  Text(game.descripcion),
                  Text(game.generacion),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}