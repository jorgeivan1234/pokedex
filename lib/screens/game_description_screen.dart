import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    
    final title = description?.title ?? game.title;
    final imagePath = description?.imagenAssets ?? game.imagenAssets;
    final panelColor = description?.color ?? game.color;
    final foregroundColor = ThemeData.estimateBrightnessForColor(panelColor) == Brightness.dark
      ? Colors.white
      : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.arrow_back_ios_new_rounded),
      //   onPressed: () => context.go('/juego'), 
      // ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/ash.gif',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const ColoredBox(color: Colors.black);
              },
            ),
          ),
          Positioned.fill(
            child: ColoredBox(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Image.asset(
                  imagePath,
                  height: 300,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 280,
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 64,
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),
            
                Container(
                  padding: const EdgeInsets.all(20),
                  color: panelColor,
                  child: DefaultTextStyle.merge(
                    style: TextStyle(color: foregroundColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: foregroundColor,
                                fontWeight: FontWeight.bold
                              )
                        ),

                        SizedBox(height: 12),

                        FilledButton(
                          onPressed: null, 
                          child: Text('Proximamente'), 
                        ),
                    
                        const SizedBox(height: 12),
                    
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