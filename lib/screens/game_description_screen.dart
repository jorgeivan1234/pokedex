import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemon_description_game_data.dart';
import 'package:pokedex/models/pokemon_game_model.dart';

class GameDescriptionScreen extends StatelessWidget {

  final PokemonGameModel game;
  
  const GameDescriptionScreen({
    super.key, 
    required this.game
  });

  @override
  Widget build(BuildContext context) {
    final matchingDescriptions = pokemonDescriptionGame.where(
      (item) => item.id == game.id,
    );
    final description = matchingDescriptions.isEmpty
        ? null
        : matchingDescriptions.first;

    return Scaffold(
      appBar: AppBar(
        title: Text(game.title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/ash.gif'
            ),
          ),
          SizedBox.expand(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Image.asset(
                  description?.imagenAssets ?? game.imagenAssets,
                  height: 400,
                  fit: BoxFit.contain
                ),
            
                const SizedBox(height: 16),
            
                SizedBox(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: description?.color ?? game.color,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          game.title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),

                        
                        FilledButton(
                          onPressed: (){}, 
                          child: Text('Jugar'), 
                        ),
                    
                        const SizedBox(height: 8),
                    
                        Text('Plataforma: ${description?.plataforma ?? game.plataforma}'),
                                                
                        const SizedBox(height: 4),

                        Text('Género: ${description?.genero ?? game.genero}'),

                        const SizedBox(height: 4),

                        Text('Generación: ${description?.generacion ?? game.generacion}'),

                        if (description != null) ...[
                          const SizedBox(height: 4),
                          Text('Desarrollador: ${description.desarrollador}'),
                          Text('Distribuidor: ${description.distribuidor}'),
                        ],
                        
                        const SizedBox(height: 12),
                    
                        Text(
                          description?.descripcion ?? game.descripcion,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        if (description == null) ...[
                          const SizedBox(height: 12),
                          const Text(
                            'Aún no hay información ampliada para este juego.',
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),          
          ),
        ],
      ),
    );
  }
}